using AutoMapper;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TeeApp.Application.Common;
using TeeApp.Application.Identity;
using TeeApp.Application.Interfaces;
using TeeApp.Data.EF;
using TeeApp.Data.Entities;
using TeeApp.Models.Common;
using TeeApp.Models.RequestModels.Common;
using TeeApp.Models.RequestModels.Posts;
using TeeApp.Models.ResponseModels.Posts;
using TeeApp.Models.ViewModels;
using TeeApp.Utilities.Extentions;

namespace TeeApp.Application.Services
{
    public class PostService : IPostService
    {
        private readonly TeeAppDbContext _context;
        private readonly IMapper _mapper;
        private readonly User _currentUser;
        private readonly IStorageService _storageService;

        public PostService(IMapper mapper, TeeAppDbContext context, ICurrentUser currentUser, IStorageService storageService)
        {
            _context = context;
            _mapper = mapper;
            _storageService = storageService;

            _currentUser = _context.Users
                .Include(x => x.Following)
                .Include(x => x.Followers)
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

        private bool IsHavePermissionToAccessPostAsync(Post post)
        {
            var result = post.Creator.Id.Equals(_currentUser.Id);
            return result;
        }

        public async Task<PagedResult<PostViewModel>> GetAllPaginationAsync(PaginationRequestBase request)
        {
            var posts = await _context.Posts
                .Where(x => (_currentUser.Id.Equals(x.Creator.Id) || _currentUser.Following.Contains(x.Creator)) && x.DateDeleted == null)
                .FilterBlockedAndRequestWithoutPagination(_currentUser, request)
                .Include(x => x.Comments)
                .Include(x => x.Reactions)
                .Include(x => x.Photos)
                .OrderByDescending(x => x.DateCreated)
                .AsSplitQuery()
                .ToListAsync();

            var totalRecords = posts.Count;
            var pagedPosts = posts.Paged(request.Page, request.Limit);
            var pagedPostsViewModels = _mapper.Map<List<PostViewModel>>(pagedPosts);

            var result = new PagedResult<PostViewModel>()
            {
                Items = pagedPostsViewModels,
                Keyword = request.Keyword,
                Limit = request.Limit,
                Page = request.Page,
                TotalRecords = totalRecords
            };
            return result;
        }

        public async Task<PagedResult<PostViewModel>> GetMyPostsPaginationAsync(PaginationRequestBase request)
        {
            var posts = await _context.Posts
                .Where(x => _currentUser.Id.Equals(x.Creator.Id) && x.DateDeleted == null)
                .Include(x => x.Comments)
                .Include(x => x.Reactions)
                .Include(x => x.Photos)
                .OrderByDescending(x => x.DateCreated)
                .AsSplitQuery()
                .ToListAsync();

            var totalRecords = posts.Count;
            var pagedPosts = posts.Paged(request.Page, request.Limit);
            var pagedPostsViewModels = _mapper.Map<List<PostViewModel>>(pagedPosts);

            var result = new PagedResult<PostViewModel>()
            {
                Items = pagedPostsViewModels,
                Keyword = request.Keyword,
                Limit = request.Limit,
                Page = request.Page,
                TotalRecords = totalRecords
            };
            return result;
        }

        public async Task<ApiResult<PostViewModel>> GetByIdAsync(int postId)
        {
            var post = await _context.Posts
                .Where(x => x.DateDeleted == null)
                .Include(x => x.Reactions)
                .Include(x => x.Comments)
                .Include(x => x.Photos)
                .FirstOrDefaultAsync(x => x.Id == postId);

            if (post == null)
            {
                return ApiResult<PostViewModel>.NotFound(null, "Not found this post.");
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
                return ApiResult<PostResponse>.ServerError(null, "Cannot create post. Something went wrong!");
            }

            var postViewModel = _mapper.Map<PostViewModel>(post);

            var recipients = post.Creator.Followers.Select(x => x.UserName).ToList();
            recipients.Add(post.Creator.UserName);
            var result = new PostResponse()
            {
                Post = postViewModel,
                RecipientUserNames = recipients
            };

            return ApiResult<PostResponse>.Created(result, "Create post successfully!");
        }

        public async Task<ApiResult<PostResponse>> UpdateAsync(int postId, UpdatePostRequest request)
        {
            var post = await _context.Posts.Where(x => x.Id == postId && x.DateDeleted == null).FirstOrDefaultAsync();

            if (post == null)
            {
                return ApiResult<PostResponse>.NotFound(null, "Not found this post.");
            }

            if (!IsHavePermissionToAccessPostAsync(post))
            {
                return ApiResult<PostResponse>.Forbid(null);
            }

            post.Content = request.Content;
            post.Privacy = request.Privacy;
            post.DateModified = DateTime.Now;

            await _context.SaveChangesAsync();

            var postViewModel = _mapper.Map<PostViewModel>(post);

            var recipients = post.Creator.Followers.Select(x => x.UserName).ToList();
            recipients.Add(post.Creator.UserName);
            var result = new PostResponse()
            {
                Post = postViewModel,
                RecipientUserNames = recipients
            };

            return ApiResult<PostResponse>.Ok(result, "Update post successfully!");
        }

        public async Task<ApiResult<PostResponse>> DeleteAsync(int postId)
        {
            var post = await _context.Posts.Where(x => x.Id == postId && x.DateDeleted == null).FirstOrDefaultAsync();

            if (post == null)
            {
                return ApiResult<PostResponse>.NotFound(null, "Not found this post.");
            }

            if (!IsHavePermissionToAccessPostAsync(post))
            {
                return ApiResult<PostResponse>.Forbid(null);
            }

            post.DateDeleted = DateTime.Now;
            if (post.Photos != null)
            {
                post.Photos.ForEach(x => _storageService.DeleteFileAsync(x.ImageFileName));
            }
            await _context.SaveChangesAsync();

            var recipients = post.Creator.Followers.Select(x => x.UserName).ToList();
            recipients.Add(post.Creator.UserName);
            var result = new PostResponse()
            {
                Post = new() { Id = post.Id },
                RecipientUserNames = recipients
            };

            return ApiResult<PostResponse>.Ok(result, "Delete post successfully!");
        }
    }
}