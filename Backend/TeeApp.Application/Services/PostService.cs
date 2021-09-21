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
using TeeApp.Models.RequestModels.Posts;
using TeeApp.Models.ResponseModels.Posts;
using TeeApp.Models.ViewModels;

namespace TeeApp.Application.Services
{
    public class PostService : IPostService
    {
        private readonly TeeAppDbContext _context;
        private readonly IMapper _mapper;
        private readonly User _currentUser;

        public PostService(IMapper mapper, TeeAppDbContext context, ICurrentUser currentUser)
        {
            _context = context;
            _mapper = mapper;

            _currentUser = _context.Users.Include(x => x.Followers).FirstOrDefault(x => x.Id.Equals(currentUser.UserId));

            if (_currentUser == null)
            {
                throw new Exception("Cannot get current user. Something went wrong!");
            }
        }

        private bool IsHavePermissionToAccessPostAsync(Post post)
        {
            var result = post.Creator.Id.Equals(_currentUser.Id);
            return result;
        }

        public async Task<ApiResult<PostViewModel>> GetByIdAsync(int postId)
        {
            var post = await _context.Posts
                .Include(x => x.Reactions)
                .Include(x => x.Comments)
                .FirstOrDefaultAsync(x => x.Id == postId);

            if (post == null)
            {
                return ApiResult<PostViewModel>.NotFound(null);
            }

            var result = _mapper.Map<PostViewModel>(post);

            return ApiResult<PostViewModel>.Ok(result, $"Get post {postId} successfully!");
        }

        public async Task<ApiResult<PostResponse>> CreateAsync(CreatePostRequest request)
        {
            var post = new Post()
            {
                Content = request.Content,
                Privacy = request.Privacy,
                DateCreated = DateTime.Now,
                Creator = _currentUser,
                Comments = new(),
                Photos = new(),
                Reactions = new()
            };

            await _context.Posts.AddAsync(post);
            await _context.SaveChangesAsync();

            if (post.Id < 0)
            {
                return ApiResult<PostResponse>.BadRequest(null, "Cannot create post. Something went wrong!");
            }

            var postViewModel = _mapper.Map<PostViewModel>(post);

            var result = new PostResponse()
            {
                Post = postViewModel,
                RecipientUserNames = _currentUser.Followers.Select(x => x.UserName).ToList()
            };

            return ApiResult<PostResponse>.Created(result, "Create post successfully!");
        }

        public async Task<ApiResult<PostResponse>> UpdateAsync(int postId, UpdatePostRequest request)
        {
            var post = await _context.Posts.FindAsync(postId);

            if (post == null)
            {
                return ApiResult<PostResponse>.NotFound(null);
            }

            if (!IsHavePermissionToAccessPostAsync(post))
            {
                return ApiResult<PostResponse>.ForBid(null);
            }

            post.Content = request.Content;
            post.Privacy = request.Privacy;
            post.DateModified = DateTime.Now;

            await _context.SaveChangesAsync();

            var postViewModel = _mapper.Map<PostViewModel>(post);

            var result = new PostResponse()
            {
                Post = postViewModel,
                RecipientUserNames = _currentUser.Followers.Select(x => x.UserName).ToList()
            };

            return ApiResult<PostResponse>.Ok(result, "Update post successfully!");
        }

        public async Task<ApiResult<PostResponse>> DeleteAsync(int postId)
        {
            var post = await _context.Posts.FindAsync(postId);

            if (post == null)
            {
                return ApiResult<PostResponse>.NotFound(null);
            }

            if (!IsHavePermissionToAccessPostAsync(post))
            {
                return ApiResult<PostResponse>.ForBid(null);
            }

            post.DateDeleted = DateTime.Now;
            await _context.SaveChangesAsync();

            var result = new PostResponse()
            {
                Post = new PostViewModel() { Id = post.Id },
                RecipientUserNames = _currentUser.Followers.Select(x => x.UserName).ToList()
            };

            return ApiResult<PostResponse>.Ok(result, "Delete post successfully!");
        }
    }
}