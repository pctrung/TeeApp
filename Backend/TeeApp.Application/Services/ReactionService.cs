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
using TeeApp.Models.RequestModels.Reactions;
using TeeApp.Models.ResponseModels.Reactions;
using TeeApp.Models.ViewModels;
using TeeApp.Utilities.Enums.Types;
using TeeApp.Utilities.Extentions;

namespace TeeApp.Application.Services
{
    public class ReactionService : IReactionService
    {
        private readonly TeeAppDbContext _context;
        private readonly IMapper _mapper;
        private readonly User _currentUser;

        public ReactionService(IMapper mapper, TeeAppDbContext context, ICurrentUser currentUser)
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

        private bool IsHavePermissionToAccessReactionAsync(Reaction reaction)
        {
            var result = reaction.Creator.Id.Equals(_currentUser.Id);
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

        public async Task<ApiResult<ReactionResponse>> CreateAsync(int postId, ReactionRequest request)
        {
            var post = await _context.Posts
                .Where(x => x.Id.Equals(postId) && x.DateDeleted == null)
                .Include(x => x.Reactions)
                .Include(x => x.Creator)
                .ThenInclude(x => x.Followers)
                .AsSplitQuery()
                .FirstOrDefaultAsync();

            if (post == null || IsBlocked(post.Creator))
            {
                return ApiResult<ReactionResponse>.NotFound(null, "Not found this post.");
            }
            if (!post.Creator.Id.Equals(_currentUser.Id))
            {
                switch (post.Privacy)
                {
                    case PrivacyType.Private:
                        return ApiResult<ReactionResponse>.NotFound(null, "Not found this post.");

                    case PrivacyType.Friend:
                        if (!IsMyFriend(post.Creator))
                        {
                            return ApiResult<ReactionResponse>.NotFound(null, "Not found this post.");
                        }
                        break;
                }
            }

            // check exists reaction
            var reaction = post.Reactions?.FirstOrDefault(x => x.Creator?.Id?.Equals(_currentUser?.Id) == true);

            if (reaction != null)
            {
                return ApiResult<ReactionResponse>.BadRequest(null, "Already reacted this post.");
            }

            reaction = new Reaction()
            {
                Type = request.Type,
                Creator = _currentUser,
                DateCreated = DateTime.UtcNow.ToVNTimeZone(),
                Post = post
            };

            post.Reactions.Add(reaction);
            await _context.SaveChangesAsync();

            if (reaction.Id < 0)
            {
                return ApiResult<ReactionResponse>.ServerError(null, "Cannot react. Something went wrong!");
            }

            var recipients = GetRecipientList(post);
            var result = new ReactionResponse()
            {
                Reaction = _mapper.Map<ReactionViewModel>(reaction),
                PostId = post.Id,
                PostCreatorUserName = post.Creator.UserName,
                RecipientUserNames = recipients
            };

            return ApiResult<ReactionResponse>.Created(result);
        }

        public async Task<ApiResult<ReactionResponse>> UpdateAsync(int postId, ReactionRequest request)
        {
            var post = await _context.Posts
                .Where(x => x.Id.Equals(postId) && x.DateDeleted == null)
                .Include(x => x.Reactions)
                .Include(x => x.Creator)
                .ThenInclude(x => x.Followers)
                .AsSplitQuery()
                .FirstOrDefaultAsync();

            if (post == null || IsBlocked(post.Creator))
            {
                return ApiResult<ReactionResponse>.NotFound(null, "Not found this post.");
            }
            if (!post.Creator.Id.Equals(_currentUser.Id))
            {
                switch (post.Privacy)
                {
                    case PrivacyType.Private:
                        return ApiResult<ReactionResponse>.NotFound(null, "Not found this post.");

                    case PrivacyType.Friend:
                        if (!IsMyFriend(post.Creator))
                        {
                            return ApiResult<ReactionResponse>.NotFound(null, "Not found this post.");
                        }
                        break;
                }
            }

            var reaction = post.Reactions.FirstOrDefault(x => x.Post.Id.Equals(post.Id) && x.Creator.Id.Equals(_currentUser.Id));
            if (reaction == null)
            {
                return ApiResult<ReactionResponse>.NotFound(null, "Not found this reaction");
            }
            if (!IsHavePermissionToAccessReactionAsync(reaction))
            {
                return ApiResult<ReactionResponse>.Forbid(null);
            }

            reaction.Type = request.Type;
            reaction.DateModified = DateTime.UtcNow.ToVNTimeZone();

            await _context.SaveChangesAsync();

            var recipients = GetRecipientList(post);
            var result = new ReactionResponse()
            {
                Reaction = _mapper.Map<ReactionViewModel>(reaction),
                PostId = post.Id,
                PostCreatorUserName = post.Creator.UserName,
                RecipientUserNames = recipients
            };

            return ApiResult<ReactionResponse>.Ok(result);
        }

        public async Task<ApiResult<ReactionResponse>> DeleteAsync(int postId)
        {
            var post = await _context.Posts
                .Where(x => x.Id.Equals(postId) && x.DateDeleted == null)
                .Include(x => x.Reactions)
                .Include(x => x.Creator)
                .ThenInclude(x => x.Followers)
                .AsSplitQuery()
                .FirstOrDefaultAsync();

            if (post == null || IsBlocked(post.Creator))
            {
                return ApiResult<ReactionResponse>.NotFound(null, "Not found this post.");
            }
            if (!post.Creator.Id.Equals(_currentUser.Id))
            {
                switch (post.Privacy)
                {
                    case PrivacyType.Private:
                        return ApiResult<ReactionResponse>.NotFound(null, "Not found this post.");

                    case PrivacyType.Friend:
                        if (!IsMyFriend(post.Creator))
                        {
                            return ApiResult<ReactionResponse>.NotFound(null, "Not found this post.");
                        }
                        break;
                }
            }

            var reaction = post.Reactions.FirstOrDefault(x => x.Post.Id.Equals(post.Id) && x.Creator.Id.Equals(_currentUser.Id));
            if (reaction == null)
            {
                return ApiResult<ReactionResponse>.NotFound(null, "Not found this reaction.");
            }
            if (!IsHavePermissionToAccessReactionAsync(reaction))
            {
                return ApiResult<ReactionResponse>.Forbid(null);
            }

            var reactionId = reaction.Id;
            _context.Reactions.Remove(reaction);

            await _context.SaveChangesAsync();

            var recipients = GetRecipientList(post);
            var result = new ReactionResponse()
            {
                Reaction = new ReactionViewModel() { Id = reactionId },
                PostId = post.Id,
                PostCreatorUserName = post.Creator.UserName,
                RecipientUserNames = recipients
            };

            return ApiResult<ReactionResponse>.Ok(result);
        }
    }
}