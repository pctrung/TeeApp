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
using TeeApp.Models.RequestModels.PostPhotos;

namespace TeeApp.Application.Services
{
    public class PostPhotoService : IPostPhotoService
    {
        private readonly TeeAppDbContext _context;
        private readonly User _currentUser;
        private readonly IStorageService _storageService;

        public PostPhotoService(TeeAppDbContext context, ICurrentUser currentUser, IStorageService storageService)
        {
            _context = context;
            _storageService = storageService;

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

        private bool IsHavePermissionToAccessPostAsync(Post post)
        {
            var result = post.Creator.Id.Equals(_currentUser.Id);
            return result;
        }

        public async Task<ApiResult> CreateAsync(int postId, PostPhotoRequest request)
        {
            var post = await _context.Posts
                .Where(x => x.Id == postId && x.DateDeleted == null)
                .Include(x => x.Photos)
                .Include(x => x.Creator)
                .ThenInclude(x => x.Followers)
                .AsSplitQuery()
                .FirstOrDefaultAsync();

            if (post == null)
            {
                return ApiResult.NotFound("Not found this post");
            }
            if (!IsHavePermissionToAccessPostAsync(post))
            {
                return ApiResult.ForBid();
            }
            if (request.Image != null)
            {
                try
                {
                    var fileName = await _storageService.SaveImageAsync(request.Image);

                    if (!string.IsNullOrWhiteSpace(fileName))
                    {
                        var photo = new Photo()
                        {
                            Caption = request.Caption,
                            ImageFileName = fileName,
                            DateCreated = DateTime.Now,
                        };
                        post.Photos.Add(photo);
                        await _context.SaveChangesAsync();
                        return ApiResult.Created("Add photo successfully!");
                    }
                }
                catch (Exception e)
                {
                    return ApiResult.BadRequest(e.Message);
                }
            }
            return ApiResult.BadRequest();
        }

        public async Task<ApiResult> DeleteAsync(int postId, int postPhotoId)
        {
            var post = await _context.Posts
                .Where(x => x.Id == postId && x.DateDeleted == null)
                .Include(x => x.Photos)
                .Include(x => x.Creator)
                .ThenInclude(x => x.Followers)
                .AsSplitQuery()
                .FirstOrDefaultAsync();

            if (post == null)
            {
                return ApiResult.NotFound("Not found this post");
            }
            if (!IsHavePermissionToAccessPostAsync(post))
            {
                return ApiResult.ForBid();
            }

            var photo = post.Photos.FirstOrDefault(x => x.Id == postPhotoId);
            if (photo == null)
            {
                return ApiResult.NotFound("Not found this photo");
            }
            try
            {
                await _storageService.DeleteFileAsync(photo.ImageFileName);
                _context.Photos.Remove(photo);
                await _context.SaveChangesAsync();
                return ApiResult.Ok("Delete photo successfully!");
            }
            catch (Exception e)
            {
                return ApiResult.BadRequest(e.Message);
            }
        }
    }
}