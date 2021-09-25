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
using TeeApp.Models.RequestModels.Reactions;
using TeeApp.Models.ResponseModels.Reactions;
using TeeApp.Models.ViewModels;

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
                throw new Exception("Cannot get current user. Something went wrong!");
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

        public async Task<ApiResult<ReactionResponse>> CreateAsync(int postId, ReactionRequest request)
        {
            var post = await _context.Posts
                .Where(x => x.Id == postId && x.DateDeleted == null)
                .Include(x => x.Reactions)
                .Include(x => x.Creator)
                .ThenInclude(x => x.Followers)
                .AsSplitQuery()
                .FirstOrDefaultAsync();

            if (post == null)
            {
                return ApiResult<ReactionResponse>.NotFound(null);
            }

            if (IsBlocked(post.Creator))
            {
                return ApiResult<ReactionResponse>.BadRequest(null, "Cannot reaction this post");
            }
            var reaction = new Reaction()
            {
                Type = request.Type,
                Creator = _currentUser,
                DateCreated = DateTime.Now,
                Post = post
            };

            post.Reactions.Add(reaction);
            await _context.SaveChangesAsync();

            if (reaction.Id < 0)
            {
                return ApiResult<ReactionResponse>.ServerError(null, "Cannot react. Something went wrong!");
            }
            var result = new ReactionResponse()
            {
                Reaction = _mapper.Map<ReactionViewModel>(reaction),
                PostId = post.Id,
                RecipientUserNames = post.Creator.Followers.Select(x => x.UserName).ToList()
            };

            return ApiResult<ReactionResponse>.Created(result);
        }

        public async Task<ApiResult<ReactionResponse>> UpdateAsync(int postId, int reactionId, ReactionRequest request)
        {
            var post = await _context.Posts
                .Where(x => x.Id == postId && x.DateDeleted == null)
                .Include(x => x.Reactions)
                .Include(x => x.Creator)
                .ThenInclude(x => x.Followers)
                .AsSplitQuery()
                .FirstOrDefaultAsync();

            if (post == null)
            {
                return ApiResult<ReactionResponse>.NotFound(null, "Not found this post");
            }

            if (IsBlocked(post.Creator))
            {
                return ApiResult<ReactionResponse>.BadRequest(null, "Cannot reaction this post");
            }

            var reaction = post.Reactions.FirstOrDefault(x => x.Id == reactionId);
            if (reaction == null)
            {
                return ApiResult<ReactionResponse>.NotFound(null, "Not found this reaction");
            }
            if (!IsHavePermissionToAccessReactionAsync(reaction))
            {
                return ApiResult<ReactionResponse>.ForBid(null);
            }

            reaction.Type = request.Type;
            reaction.DateModified = DateTime.Now;

            await _context.SaveChangesAsync();

            var result = new ReactionResponse()
            {
                Reaction = _mapper.Map<ReactionViewModel>(reaction),
                PostId = post.Id,
                RecipientUserNames = post.Creator.Followers.Select(x => x.UserName).ToList()
            };

            return ApiResult<ReactionResponse>.Ok(result);
        }

        public async Task<ApiResult<ReactionResponse>> DeleteAsync(int postId, int reactionId)
        {
            var post = await _context.Posts
                .Where(x => x.Id == postId && x.DateDeleted == null)
                .Include(x => x.Reactions)
                .Include(x => x.Creator)
                .ThenInclude(x => x.Followers)
                .AsSplitQuery()
                .FirstOrDefaultAsync();

            if (post == null)
            {
                return ApiResult<ReactionResponse>.NotFound(null, "Not found this post");
            }

            if (IsBlocked(post.Creator))
            {
                return ApiResult<ReactionResponse>.BadRequest(null, "Cannot reaction this post");
            }

            var reaction = post.Reactions.FirstOrDefault(x => x.Id == reactionId);
            if (reaction == null)
            {
                return ApiResult<ReactionResponse>.NotFound(null, "Not found this reaction");
            }
            if (!IsHavePermissionToAccessReactionAsync(reaction))
            {
                return ApiResult<ReactionResponse>.ForBid(null);
            }

            _context.Reactions.Remove(reaction);

            await _context.SaveChangesAsync();

            var result = new ReactionResponse()
            {
                Reaction = new ReactionViewModel() { Id = reactionId },
                PostId = post.Id,
                RecipientUserNames = post.Creator.Followers.Select(x => x.UserName).ToList()
            };

            return ApiResult<ReactionResponse>.Ok(result);
        }
    }
}