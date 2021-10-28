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
using TeeApp.Models.RequestModels.PostPhotos;
using TeeApp.Models.ResponseModels.Posts;
using TeeApp.Models.ViewModels;
using TeeApp.Utilities.Enums.Types;
using TeeApp.Utilities.Extentions;

namespace TeeApp.Application.Services
{
    public class PostPhotoService : IPostPhotoService
    {
        private readonly TeeAppDbContext _context;
        private readonly User _currentUser;
        private readonly IStorageService _storageService;
        private readonly IMapper _mapper;
        private const int MAX_IMAGES_PER_POST = 10;

        public PostPhotoService(IMapper mapper, TeeAppDbContext context, ICurrentUser currentUser, IStorageService storageService)
        {
            _context = context;
            _storageService = storageService;
            _mapper = mapper;

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

        public async Task<ApiResult<PostResponse>> CreateAsync(int postId, PostPhotoRequest request)
        {
            var post = await _context.Posts
                .Where(x => x.Id.Equals(postId) && x.DateDeleted == null)
                .Include(x => x.Photos)
                .Include(x => x.Creator)
                .ThenInclude(x => x.Followers)
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
            if (request.Image != null)
            {
                try
                {
                    if (post.Photos.Count >= MAX_IMAGES_PER_POST)
                    {
                        return ApiResult<PostResponse>.BadRequest(null, $"Please select maximum {MAX_IMAGES_PER_POST} images");
                    }
                    var fileName = await _storageService.SaveImageAsync(request.Image);

                    if (!string.IsNullOrWhiteSpace(fileName))
                    {
                        var photo = new Photo()
                        {
                            Caption = request.Caption,
                            ImageFileName = fileName,
                            DateCreated = DateTime.UtcNow.ToVNTimeZone(),
                        };
                        post.Photos.Add(photo);
                        await _context.SaveChangesAsync();

                        var postViewModel = _mapper.Map<PostViewModel>(post);

                        var recipients = GetRecipientList(post);
                        var result = new PostResponse()
                        {
                            Post = postViewModel,
                            RecipientUserNames = recipients
                        };
                        return ApiResult<PostResponse>.Created(result, "Add photo successfully!");
                    }
                }
                catch (Exception e)
                {
                    return ApiResult<PostResponse>.BadRequest(null, e.Message);
                }
            }
            return ApiResult<PostResponse>.BadRequest(null);
        }

        public async Task<ApiResult<PostResponse>> DeleteAsync(int postId, int postPhotoId)
        {
            var post = await _context.Posts
                .Where(x => x.Id.Equals(postId) && x.DateDeleted == null)
                .Include(x => x.Photos)
                .Include(x => x.Creator)
                .ThenInclude(x => x.Followers)
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

            var photo = post.Photos.FirstOrDefault(x => x.Id.Equals(postPhotoId));
            if (photo == null)
            {
                return ApiResult<PostResponse>.NotFound(null, "Not found this photo.");
            }
            try
            {
                await _storageService.DeleteFileAsync(photo.ImageFileName);
                _context.Photos.Remove(photo);
                await _context.SaveChangesAsync();

                var postViewModel = _mapper.Map<PostViewModel>(post);

                var recipients = GetRecipientList(post);
                var result = new PostResponse()
                {
                    Post = postViewModel,
                    RecipientUserNames = recipients
                };
                return ApiResult<PostResponse>.Ok(result, "Delete photo successfully!");
            }
            catch (Exception e)
            {
                return ApiResult<PostResponse>.BadRequest(null, e.Message);
            }
        }
    }
}