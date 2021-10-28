using AutoMapper;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TeeApp.Application.Identity;
using TeeApp.Application.Interfaces;
using TeeApp.Data.EF;
using TeeApp.Data.Entities;
using TeeApp.Models.Common;
using TeeApp.Models.RequestModels.Comments;
using TeeApp.Models.ResponseModels.Comments;
using TeeApp.Models.ViewModels;
using TeeApp.Utilities.Enums.Types;
using TeeApp.Utilities.Extentions;

namespace TeeApp.Application.Services
{
    public class CommentService : ICommentService
    {
        private readonly TeeAppDbContext _context;
        private readonly IMapper _mapper;
        private readonly User _currentUser;

        public CommentService(IMapper mapper, TeeAppDbContext context, ICurrentUser currentUser)
        {
            _context = context;
            _mapper = mapper;

            _currentUser = _context.Users
                .Include(x => x.BlockedByUsers)
                .Include(x => x.BlockedUsers)
                .AsSplitQuery()
                .OrderBy(x => x.DateCreated)
                .FirstOrDefault(x => x.Id.Equals(currentUser.UserId));

            if (_currentUser == null)
            {
                throw new Exception("Unable to identify user. Please login and try again!");
            }
        }

        private bool IsBlocked(User user)
        {
            return _currentUser.BlockedByUsers.Contains(user) || _currentUser.BlockedUsers.Contains(user);
        }

        private bool IsHavePermissionToAccessCommentAsync(Comment comment)
        {
            var result = comment.Creator.Id.Equals(_currentUser.Id);
            return result;
        }

        private Friendship GetFriendship(User user)
        {
            return _context.Friendships
                .FirstOrDefault(
                x =>
                    x.RequestedUserId.Equals(user.Id) && x.RecievedUserId.Equals(_currentUser.Id) ||
                    x.RequestedUserId.Equals(_currentUser.Id) && x.RecievedUserId.Equals(user.Id));
        }

        private bool IsMyFriend(User user)
        {
            var friendship = GetFriendship(user);
            if (friendship == null || !(friendship.Type == FriendshipType.Accepted))
            {
                return false;
            }
            return true;
        }

        private List<string> GetRecipientList(Post post)
        {
            var recipients = new List<string>();
            switch (post.Privacy)
            {
                case PrivacyType.Public:
                    recipients = post.Creator.Followers.Select(x => x.UserName).ToList();
                    break;

                case PrivacyType.Friend:
                    recipients = post.Creator.Followers.Where(x => IsMyFriend(x)).Select(x => x.UserName).ToList();
                    break;
            }
            recipients.Add(post.Creator.UserName);
            return recipients;
        }

        public async Task<ApiResult<CommentResponse>> CreateAsync(int postId, CommentRequest request)
        {
            var post = await _context.Posts
                .Where(x => x.Id.Equals(postId) && x.DateDeleted == null)
                .Include(x => x.Comments)
                .Include(x => x.Creator)
                .ThenInclude(x => x.Followers)
                .AsSplitQuery()
                .FirstOrDefaultAsync();

            if (post == null || IsBlocked(post.Creator))
            {
                return ApiResult<CommentResponse>.NotFound(null, "Not found this post.");
            }
            if (!post.Creator.Id.Equals(_currentUser.Id))
            {
                switch (post.Privacy)
                {
                    case PrivacyType.Private:
                        return ApiResult<CommentResponse>.NotFound(null, "Not found this post.");

                    case PrivacyType.Friend:
                        if (!IsMyFriend(post.Creator))
                        {
                            return ApiResult<CommentResponse>.NotFound(null, "Not found this post.");
                        }
                        break;
                }
            }

            var comment = new Comment()
            {
                Content = request.Content,
                Creator = _currentUser,
                DateCreated = DateTime.UtcNow.ToVNTimeZone(),
                Post = post
            };

            post.Comments.Add(comment);
            await _context.SaveChangesAsync();

            if (comment.Id < 0)
            {
                return ApiResult<CommentResponse>.ServerError(null, "Cannot comment. Something went wrong!");
            }

            var recipients = GetRecipientList(post);
            var result = new CommentResponse()
            {
                Comment = _mapper.Map<CommentViewModel>(comment),
                PostId = post.Id,
                PostCreatorUserName = post.Creator.UserName,
                RecipientUserNames = recipients
            };

            return ApiResult<CommentResponse>.Created(result);
        }

        public async Task<ApiResult<CommentResponse>> UpdateAsync(int postId, int commentId, CommentRequest request)
        {
            var post = await _context.Posts
                .Where(x => x.Id.Equals(postId) && x.DateDeleted == null)
                .Include(x => x.Comments)
                .Include(x => x.Creator)
                .ThenInclude(x => x.Followers)
                .AsSplitQuery()
                .FirstOrDefaultAsync();

            if (post == null || IsBlocked(post.Creator))
            {
                return ApiResult<CommentResponse>.NotFound(null, "Not found this post.");
            }
            if (!post.Creator.Id.Equals(_currentUser.Id))
            {
                switch (post.Privacy)
                {
                    case PrivacyType.Private:
                        return ApiResult<CommentResponse>.NotFound(null, "Not found this post.");

                    case PrivacyType.Friend:
                        if (!IsMyFriend(post.Creator))
                        {
                            return ApiResult<CommentResponse>.NotFound(null, "Not found this post.");
                        }
                        break;
                }
            }

            var comment = post.Comments.FirstOrDefault(x => x.Id.Equals(commentId));
            if (comment == null)
            {
                return ApiResult<CommentResponse>.NotFound(null, "Not found this comment");
            }
            if (!IsHavePermissionToAccessCommentAsync(comment))
            {
                return ApiResult<CommentResponse>.Forbid(null);
            }

            comment.Content = request.Content;
            comment.DateModified = DateTime.UtcNow.ToVNTimeZone();

            await _context.SaveChangesAsync();

            var recipients = GetRecipientList(post);
            var result = new CommentResponse()
            {
                Comment = _mapper.Map<CommentViewModel>(comment),
                PostId = post.Id,
                PostCreatorUserName = post.Creator.UserName,
                RecipientUserNames = recipients
            };

            return ApiResult<CommentResponse>.Ok(result);
        }

        public async Task<ApiResult<CommentResponse>> DeleteAsync(int postId, int commentId)
        {
            var post = await _context.Posts
                .Where(x => x.Id.Equals(postId) && x.DateDeleted == null)
                .Include(x => x.Comments)
                .Include(x => x.Creator)
                .ThenInclude(x => x.Followers)
                .AsSplitQuery()
                .FirstOrDefaultAsync();

            if (post == null || IsBlocked(post.Creator))
            {
                return ApiResult<CommentResponse>.NotFound(null, "Not found this post.");
            }
            if (!post.Creator.Id.Equals(_currentUser.Id))
            {
                switch (post.Privacy)
                {
                    case PrivacyType.Private:
                        return ApiResult<CommentResponse>.NotFound(null, "Not found this post.");

                    case PrivacyType.Friend:
                        if (!IsMyFriend(post.Creator))
                        {
                            return ApiResult<CommentResponse>.NotFound(null, "Not found this post.");
                        }
                        break;
                }
            }

            var comment = post.Comments.FirstOrDefault(x => x.Id.Equals(commentId));
            if (comment == null)
            {
                return ApiResult<CommentResponse>.NotFound(null, "Not found this comment.");
            }
            if (!IsHavePermissionToAccessCommentAsync(comment))
            {
                return ApiResult<CommentResponse>.Forbid(null);
            }

            _context.Comments.Remove(comment);

            await _context.SaveChangesAsync();

            var recipients = GetRecipientList(post);
            var result = new CommentResponse()
            {
                Comment = new CommentViewModel() { Id = commentId },
                PostId = post.Id,
                PostCreatorUserName = post.Creator.UserName,
                RecipientUserNames = recipients
            };

            return ApiResult<CommentResponse>.Ok(result);
        }
    }
}