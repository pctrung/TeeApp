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
using TeeApp.Utilities.Constants;
using TeeApp.Utilities.Enums.Types;
using TeeApp.Utilities.Extentions;

namespace TeeApp.Application.Services
{
    public class PostService : IPostService
    {
        private readonly TeeAppDbContext _context;
        private readonly IMapper _mapper;
        private readonly User _currentUserModel;
        private readonly ICurrentUser _currentUser;
        private readonly IStorageService _storageService;

        public PostService(IMapper mapper, TeeAppDbContext context, ICurrentUser currentUser, IStorageService storageService)
        {
            _context = context;
            _mapper = mapper;
            _storageService = storageService;
            _currentUser = currentUser;
            
            _currentUserModel = _context.Users
                .Include(x => x.Following)
                .Include(x => x.Followers)
                .Include(x => x.BlockedByUsers)
                .Include(x => x.BlockedUsers)
                .AsSplitQuery()
                .OrderBy(x => x.DateCreated)
                .FirstOrDefault(x => x.Id.Equals(currentUser.UserId));

            if (_currentUserModel == null)
            {
                throw new Exception("Unable to identify user. Please login and try again!");
            }
        }

        private bool IsBlocked(User user)
        {
            return _currentUserModel.BlockedByUsers.Contains(user) || _currentUserModel.BlockedUsers.Contains(user);
        }

        private Friendship GetFriendship(User user)
        {
            return _context.Friendships
                .FirstOrDefault(
                x =>
                    x.RequestedUserId.Equals(user.Id) && x.RecievedUserId.Equals(_currentUserModel.Id) ||
                    x.RequestedUserId.Equals(_currentUserModel.Id) && x.RecievedUserId.Equals(user.Id));
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

        private bool IsHavePermissionToAccessPostAsync(Post post)
        {
            var result = post.Creator.Id.Equals(_currentUserModel.Id);
            return result;
        }

        public async Task<PagedResult<PostViewModel>> GetAllPaginationAsync(PaginationRequestBase request)
        {
            var posts = await _context.Posts
                .Where(x => x.DateDeleted == null && !x.IsHideByAdmin)
                .FilterBlockedAndRequestWithoutPagination(_currentUserModel, request)
                .Include(x => x.Comments)
                    .ThenInclude(x => x.Creator)
                .Include(x => x.Reactions)
                    .ThenInclude(x => x.Creator)
                .Include(x => x.Photos)
                .Include(x => x.Creator)
                .OrderByDescending(x => x.DateCreated)
                .AsSplitQuery()
                .ToListAsync();

            posts.ToList().ForEach(post =>
            {
                if (!post.Creator.Id.Equals(_currentUserModel.Id))
                {
                    if (post.IsHideByAdmin)
                    {
                        posts.Remove(post);
                        return;
                    }
                    switch (post.Privacy)
                    {
                        case PrivacyType.Private:
                            posts.Remove(post);
                            return;

                        case PrivacyType.Friend:
                            if (!IsMyFriend(post.Creator))
                            {
                                posts.Remove(post);
                                return;
                            }
                            break;
                    }
                }
            });

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
        
        public async Task<PagedResult<PostViewModel>> GetAllAdminPaginationAsync(PaginationRequestBase request)
        {
            if (!_currentUser.IsAdmin())
            {
                return null;
            }

            var posts = await _context.Posts
                .Where(x => x.DateDeleted == null)
                .Include(x => x.Comments)
                .ThenInclude(x => x.Creator)
                .Include(x => x.Reactions)
                .ThenInclude(x => x.Creator)
                .Include(x => x.Photos)
                .Include(x => x.Creator)
                .OrderByDescending(x => x.DateCreated)
                .AsSplitQuery()
                .ToListAsync();
            
            var keyword = request.Keyword ?? "";

            posts = posts
                .Where(x => x.Content.ToLower().Contains(keyword, StringComparison.OrdinalIgnoreCase) 
                                     || x.Creator.FullName.ToLower().Contains(keyword, StringComparison.OrdinalIgnoreCase))
                .ToList();

            posts.RemoveAll(post => post.Privacy == PrivacyType.Private);

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
        public async Task<ApiResult<bool>> HidePost(int postId, string note)
        {
            if (!_currentUser.IsAdmin())
            {
                return ApiResult<bool>.Forbid(false,"You do not have permission to hide post");
            }
            
            var post = await _context.Posts.FirstOrDefaultAsync(post => post.Id == postId);
            if (post == null)
            {
                return ApiResult<bool>.NotFound(false, "Not found post.");
            }

            post.HideByAdminNote = note;
            post.IsHideByAdmin = true;
            await _context.SaveChangesAsync();

            return ApiResult<bool>.Ok(true);
        }
        public async Task<ApiResult<bool>> UnHidePost(int postId)
        {
            if (!_currentUser.IsAdmin())
            {
                return ApiResult<bool>.Forbid(false, "You do not have permission to unhide post");
            }
            
            var post = await _context.Posts.FirstOrDefaultAsync(post => post.Id == postId);
            if (post == null)
            {
                return ApiResult<bool>.NotFound(false, "Not found post.");
            }
            
            post.IsHideByAdmin = false;
            post.HideByAdminNote = "";
            await _context.SaveChangesAsync();

            return ApiResult<bool>.Ok(true);
        }

        public async Task<PagedResult<PostViewModel>> GetNewsFeedPaginationAsync(PaginationRequestBase request)
        {
            var posts = await _context.Posts
                .Where(x => (_currentUserModel.Id.Equals(x.Creator.Id) || _currentUserModel.Following.Contains(x.Creator)) && x.DateDeleted == null && !x.IsHideByAdmin)
                .FilterBlockedAndRequestWithoutPagination(_currentUserModel, request)
                .Include(x => x.Comments)
                    .ThenInclude(x => x.Creator)
                .Include(x => x.Reactions)
                    .ThenInclude(x => x.Creator)
                .Include(x => x.Photos)
                .Include(x => x.Creator)
                .OrderByDescending(x => x.DateCreated)
                .AsSplitQuery()
                .ToListAsync();

            posts.ToList().ForEach(post =>
            {
                if (!post.Creator.Id.Equals(_currentUserModel.Id))
                {
                    if (post.IsHideByAdmin)
                    {
                        posts.Remove(post);
                        return;
                    }
                    switch (post.Privacy)
                    {
                        case PrivacyType.Private:
                            posts.Remove(post);
                            return;

                        case PrivacyType.Friend:
                            if (!IsMyFriend(post.Creator))
                            {
                                posts.Remove(post);
                                return;
                            }
                            break;
                    }
                }
            });

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

        public async Task<ApiResult<PagedResult<PostViewModel>>> GetByUserNameAsync(string userName, PaginationRequestBase request)
        {
            var user = await _context.Users.FirstOrDefaultAsync(x => x.UserName.Equals(userName));
            if (user == null || IsBlocked(user))
            {
                return ApiResult<PagedResult<PostViewModel>>.NotFound(null, "Not found user.");
            }
            var posts = await _context.Posts
            .Where(x => user.Id.Equals(x.Creator.Id) 
                        && x.DateDeleted == null 
                        && x.Content.ToLower().Contains(request.Keyword.ToLower()))
            .Include(x => x.Comments)
                .ThenInclude(x => x.Creator)
            .Include(x => x.Reactions)
                .ThenInclude(x => x.Creator)
            .Include(x => x.Photos)
            .Include(x => x.Creator)
            .OrderByDescending(x => x.DateCreated)
            .AsSplitQuery()
            .ToListAsync();

            posts.ToList().ForEach(post =>
            {
                if (!post.Creator.Id.Equals(_currentUserModel.Id))
                {
                    if (post.IsHideByAdmin)
                    {
                        posts.Remove(post);
                        return;
                    }
                    switch (post.Privacy)
                    {
                        case PrivacyType.Private:
                            posts.Remove(post);
                            return;

                        case PrivacyType.Friend:
                            if (!IsMyFriend(post.Creator))
                            {
                                posts.Remove(post);
                                return;
                            }
                            break;
                    }
                }
            });

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
            return ApiResult<PagedResult<PostViewModel>>.Ok(result);
        }

        public async Task<ApiResult<PostViewModel>> GetByIdAsync(int postId)
        {
            var post = await _context.Posts
                .Where(x => x.DateDeleted == null)
                .Include(x => x.Reactions)
                    .ThenInclude(x => x.Creator)
                .Include(x => x.Comments)
                    .ThenInclude(x => x.Creator)
                .Include(x => x.Photos)
                .Include(x => x.Creator)
                .AsSplitQuery()
                .FirstOrDefaultAsync(x => x.Id.Equals(postId));

            if (post == null)
            {
                return ApiResult<PostViewModel>.NotFound(null, "Not found this post.");
            }

            if (!post.Creator.Id.Equals(_currentUserModel.Id))
            {
                if (post.IsHideByAdmin && !_currentUser.IsAdmin())
                {
                    return ApiResult<PostViewModel>.NotFound(null);
                }
                switch (post.Privacy)
                {
                    case PrivacyType.Private:
                        return ApiResult<PostViewModel>.NotFound(null);

                    case PrivacyType.Friend:
                        if (!IsMyFriend(post.Creator))
                        {
                            return ApiResult<PostViewModel>.NotFound(null);
                        }
                        break;
                }
            }

            var result = _mapper.Map<PostViewModel>(post);

            return ApiResult<PostViewModel>.Ok(result, $"Get post {postId} successfully!");
        }

        public async Task<ApiResult<PostResponse>> CreateAsync(CreatePostRequest request)
        {
            var blockedKeywords = new List<string>(); 
            await _context.BlockedKeywordGroups.ForEachAsync(group =>
            {
                blockedKeywords.AddRange(group.Keywords?.Split(SystemConstants.BLOCKED_KEYWORDS_SEPARATOR) ?? Array.Empty<string>());
            });

            var keywords = new List<string>();
            blockedKeywords.ForEach(x =>
            {
                if (!string.IsNullOrWhiteSpace(x) && request?.Content?.ToLower().Contains(x.ToLower()) == true)
                {
                    keywords.Add(x);
                }
            });
            if (keywords.Count > 0)
            {
                return ApiResult<PostResponse>.BadRequest(null, $"Cannot create post. Content includes blocked keywords: {string.Join(", ", keywords)}.");
            }

            var post = new Post()
            {
                Content = request.Content,
                Privacy = request.Privacy,
                DateCreated = DateTime.UtcNow.ToVNTimeZone(),
                Creator = _currentUserModel,
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

            var recipients = GetRecipientList(post);
            var result = new PostResponse()
            {
                Post = postViewModel,
                RecipientUserNames = recipients
            };

            return ApiResult<PostResponse>.Created(result, "Create post successfully!");
        }

        public async Task<ApiResult<PostResponse>> UpdateAsync(int postId, UpdatePostRequest request)
        {
            var post = await _context.Posts
                .Where(x => x.Id.Equals(postId) && x.DateDeleted == null)
                .Include(x => x.Photos)
                .AsSplitQuery()
                .FirstOrDefaultAsync();

            if (post == null)
            {
                return ApiResult<PostResponse>.NotFound(null, "Not found this post.");
            }

            if (!IsHavePermissionToAccessPostAsync(post))
            {
                return ApiResult<PostResponse>.Forbid(null);
            }
            
            var blockedKeywords = new List<string>(); 
            await _context.BlockedKeywordGroups.ForEachAsync(group =>
            {
                blockedKeywords.AddRange(group.Keywords?.Split(SystemConstants.BLOCKED_KEYWORDS_SEPARATOR) ?? Array.Empty<string>());
            });

            var keywords = new List<string>();
            blockedKeywords.ForEach(x =>
            {
                if (!string.IsNullOrWhiteSpace(x) && request?.Content?.ToLower().Contains(x.ToLower()) == true)
                {
                    keywords.Add(x);
                }
            });
            if (keywords.Count > 0)
            {
                return ApiResult<PostResponse>.BadRequest(null, $"Cannot update. Content includes blocked keywords: {string.Join(", ", keywords)}.");
            }

            post.Content = request.Content;
            post.Privacy = request.Privacy;
            post.DateModified = DateTime.UtcNow.ToVNTimeZone();

            await _context.SaveChangesAsync();

            var postViewModel = _mapper.Map<PostViewModel>(post);

            var recipients = GetRecipientList(post);
            var result = new PostResponse()
            {
                Post = postViewModel,
                RecipientUserNames = recipients
            };

            return ApiResult<PostResponse>.Ok(result, "Update post successfully!");
        }

        public async Task<ApiResult<PostResponse>> DeleteAsync(int postId)
        {
            var post = await _context.Posts
                .Where(x => x.Id.Equals(postId) && x.DateDeleted == null)
                .Include(x => x.Photos)
                .AsSplitQuery()
                .FirstOrDefaultAsync();

            if (post == null)
            {
                return ApiResult<PostResponse>.NotFound(null, "Not found this post.");
            }

            if (!IsHavePermissionToAccessPostAsync(post))
            {
                return ApiResult<PostResponse>.Forbid(null);
            }

            post.DateDeleted = DateTime.UtcNow.ToVNTimeZone();
            if (post.Photos != null)
            {
                post.Photos.ForEach(x => _storageService.DeleteFileAsync(x.ImageFileName));
            }
            await _context.SaveChangesAsync();

            var recipients = GetRecipientList(post);
            var result = new PostResponse()
            {
                Post = new() { Id = post.Id },
                RecipientUserNames = recipients
            };

            return ApiResult<PostResponse>.Ok(result, "Delete post successfully!");
        }
    }
}