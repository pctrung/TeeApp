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
using TeeApp.Models.RequestModels.Users;
using TeeApp.Models.ViewModels;
using TeeApp.Utilities.Extentions;

namespace TeeApp.Application.Services
{
    public class UserService : IUserService
    {
        private readonly TeeAppDbContext _context;
        private readonly User _currentUser;
        private readonly IMapper _mapper;
        private readonly IStorageService _storageService;

        public UserService(TeeAppDbContext context, IMapper mapper, ICurrentUser currentUser, IStorageService storageService)
        {
            _storageService = storageService;
            _context = context;
            _mapper = mapper;

            _currentUser = _context.Users
                .Include(x => x.BlockedUsers)
                .Include(x => x.BlockedByUsers)
                .AsSplitQuery()
                .OrderBy(x => x.DateCreated)
                .FirstOrDefault(x => x.Id.Equals(currentUser.UserId));

            if (_currentUser == null)
            {
                throw new Exception("Unable to identify user. Please login and try again!");
            }
        }

        public async Task<PagedResult<UserViewModel>> GetUserListPaginationAsync(PaginationRequestBase request)
        {
            var users = await _context.Users
                .FilterBlockedAndRequestWithoutPagination(_currentUser, request)
                .AsSplitQuery()
                .ToListAsync();

            var totalRecords = users.Count;
            var pagedUsers = users.Paged(request.Page, request.Limit);
            var pagedUserViewModels = _mapper.Map<List<UserViewModel>>(pagedUsers);

            var result = new PagedResult<UserViewModel>()
            {
                Items = pagedUserViewModels,
                Keyword = request.Keyword,
                Limit = request.Limit,
                Page = request.Page,
                TotalRecords = totalRecords
            };

            return result;
        }

        public async Task<ApiResult<UserViewModel>> UpdateUserAsync(UpdateUserRequest request)
        {
            var user = await _context.Users.FindAsync(_currentUser.Id);
            if (user == null)
            {
                return ApiResult<UserViewModel>.BadRequest(null, "Something went wrong. Not found user: " + _currentUser.UserName);
            }

            if (request.Avatar != null)
            {
                try
                {
                    var fileName = await _storageService.SaveImageAsync(request.Avatar);

                    if (!string.IsNullOrWhiteSpace(fileName))
                    {
                        if (!string.IsNullOrWhiteSpace(user.AvatarFileName))
                        {
                            var currentFileName = user.AvatarFileName;
                            await _storageService.DeleteFileAsync(currentFileName);
                        }
                        user.AvatarFileName = fileName;
                    }
                }
                catch (Exception e)
                {
                    return ApiResult<UserViewModel>.BadRequest(null, e.Message);
                }
            }
            user.FirstName = request.FirstName?.Trim() ?? user.FirstName;
            user.LastName = request.LastName?.Trim() ?? user.LastName;
            user.AboutMe = request.AboutMe?.Trim() ?? user.AboutMe;
            user.Gender = request.Gender;
            user.DateOfBirth = request.DateOfBirth;

            await _context.SaveChangesAsync();

            var responseUser = _mapper.Map<UserViewModel>(user);

            return ApiResult<UserViewModel>.Ok(responseUser, "Update info successfully!");
        }

        public UserViewModel GetCurrentUser()
        {
            return _mapper.Map<UserViewModel>(_currentUser);
        }

        public async Task<UserViewModel> GetByUserName(string userName)
        {
            var user = await _context.Users.FirstOrDefaultAsync(x => x.UserName.Equals(userName));
            if (user == null || IsBlocked(user))
            {
                return null;
            }
            var responseUser = _mapper.Map<UserViewModel>(user);

            return responseUser;
        }

        private bool IsBlocked(User user)
        {
            return _currentUser.BlockedByUsers.Contains(user) || _currentUser.BlockedUsers.Contains(user);
        }
    }
}