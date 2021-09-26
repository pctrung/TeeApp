using AutoMapper;
using Microsoft.EntityFrameworkCore;
using System;
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
                throw new Exception("Cannot get current user. Something went wrong!");
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

        public async Task<ApiResult<CommentResponse>> CreateAsync(int postId, CommentRequest request)
        {
            var post = await _context.Posts
                .Where(x => x.Id == postId && x.DateDeleted == null)
                .Include(x => x.Comments)
                .Include(x => x.Creator)
                .ThenInclude(x => x.Followers)
                .AsSplitQuery()
                .FirstOrDefaultAsync();

            if (post == null)
            {
                return ApiResult<CommentResponse>.NotFound(null);
            }

            if (IsBlocked(post.Creator))
            {
                return ApiResult<CommentResponse>.BadRequest(null, "Cannot comment this post");
            }
            var comment = new Comment()
            {
                Content = request.Content,
                Creator = _currentUser,
                DateCreated = DateTime.Now,
                Post = post
            };

            post.Comments.Add(comment);
            await _context.SaveChangesAsync();

            if (comment.Id < 0)
            {
                return ApiResult<CommentResponse>.ServerError(null, "Cannot comment. Something went wrong!");
            }
            var result = new CommentResponse()
            {
                Comment = _mapper.Map<CommentViewModel>(comment),
                PostId = post.Id,
                PostCreatorUserName = post.Creator.UserName,
                RecipientUserNames = post.Creator.Followers.Select(x => x.UserName).ToList()
            };

            return ApiResult<CommentResponse>.Created(result);
        }

        public async Task<ApiResult<CommentResponse>> UpdateAsync(int postId, int commentId, CommentRequest request)
        {
            var post = await _context.Posts
                .Where(x => x.Id == postId && x.DateDeleted == null)
                .Include(x => x.Comments)
                .Include(x => x.Creator)
                .ThenInclude(x => x.Followers)
                .AsSplitQuery()
                .FirstOrDefaultAsync();

            if (post == null)
            {
                return ApiResult<CommentResponse>.NotFound(null, "Not found this post");
            }

            if (IsBlocked(post.Creator))
            {
                return ApiResult<CommentResponse>.BadRequest(null, "Cannot comment this post");
            }

            var comment = post.Comments.FirstOrDefault(x => x.Id == commentId);
            if (comment == null)
            {
                return ApiResult<CommentResponse>.NotFound(null, "Not found this comment");
            }
            if (!IsHavePermissionToAccessCommentAsync(comment))
            {
                return ApiResult<CommentResponse>.ForBid(null);
            }

            comment.Content = request.Content;
            comment.DateModified = DateTime.Now;

            await _context.SaveChangesAsync();

            var result = new CommentResponse()
            {
                Comment = _mapper.Map<CommentViewModel>(comment),
                PostId = post.Id,
                PostCreatorUserName = post.Creator.UserName,
                RecipientUserNames = post.Creator.Followers.Select(x => x.UserName).ToList()
            };

            return ApiResult<CommentResponse>.Ok(result);
        }

        public async Task<ApiResult<CommentResponse>> DeleteAsync(int postId, int commentId)
        {
            var post = await _context.Posts
                .Where(x => x.Id == postId && x.DateDeleted == null)
                .Include(x => x.Comments)
                .Include(x => x.Creator)
                .ThenInclude(x => x.Followers)
                .AsSplitQuery()
                .FirstOrDefaultAsync();

            if (post == null)
            {
                return ApiResult<CommentResponse>.NotFound(null, "Not found this post");
            }

            if (IsBlocked(post.Creator))
            {
                return ApiResult<CommentResponse>.BadRequest(null, "Cannot comment this post");
            }

            var comment = post.Comments.FirstOrDefault(x => x.Id == commentId);
            if (comment == null)
            {
                return ApiResult<CommentResponse>.NotFound(null, "Not found this comment");
            }
            if (!IsHavePermissionToAccessCommentAsync(comment))
            {
                return ApiResult<CommentResponse>.ForBid(null);
            }

            _context.Comments.Remove(comment);

            await _context.SaveChangesAsync();

            var result = new CommentResponse()
            {
                Comment = new CommentViewModel() { Id = commentId },
                PostId = post.Id,
                PostCreatorUserName = post.Creator.UserName,
                RecipientUserNames = post.Creator.Followers.Select(x => x.UserName).ToList()
            };

            return ApiResult<CommentResponse>.Ok(result);
        }
    }
}