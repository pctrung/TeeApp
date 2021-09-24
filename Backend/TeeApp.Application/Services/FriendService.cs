﻿using AutoMapper;
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
using TeeApp.Models.Common.Enums;
using TeeApp.Models.RequestModels.Common;
using TeeApp.Models.ViewModels;
using TeeApp.Utilities.Extentions;

namespace TeeApp.Application.Services
{
    public class FriendService : IFriendService
    {
        private readonly TeeAppDbContext _context;
        private readonly IMapper _mapper;
        private readonly User _currentUser;
        private const int DEFAULT_LIMIT = 50;

        public FriendService(IMapper mapper, TeeAppDbContext context, ICurrentUser currentUser)
        {
            _context = context;
            _mapper = mapper;

            _currentUser = _context.Users
                .Include(x => x.Following)
                .Include(x => x.Followers)
                .Include(x => x.BlockedUsers)
                .Include(x => x.BlockedByUsers)
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

        private Task<Friendship> GetFriendshipAsync(User user)
        {
            return _context.Friendships
                .FirstOrDefaultAsync(
                x =>
                    x.RequestedUserId.Equals(user.Id) && x.RecievedUserId.Equals(_currentUser.Id) ||
                    x.RequestedUserId.Equals(_currentUser.Id) && x.RecievedUserId.Equals(user.Id));
        }

        private Task<Friendship> GetFriendRequestFromAsync(User user)
        {
            return _context.Friendships
                .FirstOrDefaultAsync(x => x.RequestedUserId.Equals(user.Id) && x.RecievedUserId.Equals(_currentUser.Id));
        }

        public async Task<PagedResult<FriendshipViewModel>> GetFriendPaginationAsync(PaginationRequestBase request)
        {
            request.Limit = request.Limit > 0 ? request.Limit : DEFAULT_LIMIT;

            // Filter friend contain keyword on first, last, user name
            var friendships = await _context.Friendships
                .Include(x => x.RequestedUser)
                .Include(x => x.RecievedUser)
                .AsQueryable()
                .FilterBlockedAndKeyword(_currentUser, request.Keyword)
                .Where(x => x.Type == FriendshipType.Accepted)
                .AsSplitQuery()
                .ToListAsync();

            var totalRecords = friendships.Count;
            var pagedFriendships = friendships.Paged(request.Page, request.Limit);
            var pagedFriendshipViewModels = _mapper.Map<List<FriendshipViewModel>>(pagedFriendships);

            var result = new PagedResult<FriendshipViewModel>()
            {
                Items = pagedFriendshipViewModels,
                Keyword = request.Keyword,
                Limit = request.Limit,
                Page = request.Page,
                TotalRecords = totalRecords
            };
            return result;
        }

        public async Task<PagedResult<FriendshipViewModel>> GetFriendRequestPaginationAsync(PaginationRequestBase request)
        {
            request.Limit = request.Limit > 0 ? request.Limit : DEFAULT_LIMIT;

            // Filter friend contain keyword on first, last, user name
            var friendships = await _context.Friendships
                .Include(x => x.RequestedUser)
                .Include(x => x.RecievedUser)
                .AsQueryable()
                .FilterBlockedAndKeyword(_currentUser, request.Keyword)
                .Where(x => !x.RequestedUserId.Equals(_currentUser.Id) && x.Type == FriendshipType.Pending)
                .AsSplitQuery()
                .ToListAsync();

            var totalRecords = friendships.Count;
            var pagedFriendships = friendships.Paged(request.Page, request.Limit);
            var pagedFriendshipViewModels = _mapper.Map<List<FriendshipViewModel>>(pagedFriendships);

            var result = new PagedResult<FriendshipViewModel>()
            {
                Items = pagedFriendshipViewModels,
                Keyword = request.Keyword,
                Limit = request.Limit,
                Page = request.Page,
                TotalRecords = totalRecords
            };
            return result;
        }

        public async Task<PagedResult<FriendshipViewModel>> GetRequestedPaginationAsync(PaginationRequestBase request)
        {
            request.Limit = request.Limit > 0 ? request.Limit : DEFAULT_LIMIT;

            // Filter friend contain keyword on first, last, user name
            var friendships = await _context.Friendships
                .Include(x => x.RequestedUser)
                .Include(x => x.RecievedUser)
                .AsQueryable()
                .FilterBlockedAndKeyword(_currentUser, request.Keyword)
                .Where(x => x.RequestedUserId.Equals(_currentUser.Id) && x.Type == FriendshipType.Pending)
                .AsSplitQuery()
                .ToListAsync();

            var totalRecords = friendships.Count;
            var pagedFriendships = friendships.Paged(request.Page, request.Limit);
            var pagedFriendshipViewModels = _mapper.Map<List<FriendshipViewModel>>(pagedFriendships);

            var result = new PagedResult<FriendshipViewModel>()
            {
                Items = pagedFriendshipViewModels,
                Keyword = request.Keyword,
                Limit = request.Limit,
                Page = request.Page,
                TotalRecords = totalRecords
            };
            return result;
        }

        public PagedResult<UserViewModel> GetBlockedPaginationAsync(PaginationRequestBase request)
        {
            request.Limit = request.Limit > 0 ? request.Limit : DEFAULT_LIMIT;
            request.Keyword = string.IsNullOrEmpty(request.Keyword) ? "" : request.Keyword.ToLower();

            var pagedBlockedUsers = _currentUser.BlockedUsers
                .Where(x => x.UserName.ToLower().Contains(request.Keyword) || x.FullName.ToLower().Contains(request.Keyword))
                .OrderByDescending(x => x.FullName)
                .Paged(request.Page, request.Limit);

            var pagedBlockedUserViewModels = _mapper.Map<List<UserViewModel>>(pagedBlockedUsers);
            var result = new PagedResult<UserViewModel>()
            {
                Items = pagedBlockedUserViewModels,
                Keyword = request.Keyword,
                Limit = request.Limit,
                Page = request.Page,
                TotalRecords = _currentUser.BlockedUsers.Count
            };
            return result;
        }

        public PagedResult<UserViewModel> GetFollowingPaginationAsync(PaginationRequestBase request)
        {
            request.Limit = request.Limit > 0 ? request.Limit : DEFAULT_LIMIT;

            var pagedFollowingUsers = _currentUser.Following
                .FilterBlockedAndKeyword(_currentUser, request.Keyword)
                .Paged(request.Page, request.Limit);

            var pagedFollowingUserViewModels = _mapper.Map<List<UserViewModel>>(pagedFollowingUsers);
            var result = new PagedResult<UserViewModel>()
            {
                Items = pagedFollowingUserViewModels,
                Keyword = request.Keyword,
                Limit = request.Limit,
                Page = request.Page,
                TotalRecords = _currentUser.Following.Count
            };
            return result;
        }

        public PagedResult<UserViewModel> GetFollowerPaginationAsync(PaginationRequestBase request)
        {
            request.Limit = request.Limit > 0 ? request.Limit : DEFAULT_LIMIT;

            var pagedFollowerUsers = _currentUser.Followers
                .FilterBlockedAndKeyword(_currentUser, request.Keyword)
                .Paged(request.Page, request.Limit);

            var pagedFollowerUserViewModels = _mapper.Map<List<UserViewModel>>(pagedFollowerUsers);
            var result = new PagedResult<UserViewModel>()
            {
                Items = pagedFollowerUserViewModels,
                Keyword = request.Keyword,
                Limit = request.Limit,
                Page = request.Page,
                TotalRecords = _currentUser.Followers.Count
            };
            return result;
        }

        public async Task<ApiResult<string>> AddFriendAsync(string userName)
        {
            var friend = await _context.Users.FirstOrDefaultAsync(x => x.UserName.Equals(userName) && !x.UserName.Equals(_currentUser.UserName));
            if (friend == null)
            {
                return ApiResult<string>.NotFound(null, "Not found user " + userName);
            }
            if (IsBlocked(friend))
            {
                return ApiResult<string>.BadRequest(null, "Cannot send friend request to " + friend.FullName);
            }

            var friendship = await GetFriendshipAsync(friend);

            if (friendship == null)
            {
                friendship = new Friendship()
                {
                    RequestedUser = _currentUser,
                    RecievedUser = friend,
                    Type = FriendshipType.Pending,
                    RequestedDate = DateTime.Now
                };

                if (!_currentUser.Following.Contains(friend))
                {
                    _currentUser.Following.Add(friend);
                }

                await _context.Friendships.AddAsync(friendship);
                await _context.SaveChangesAsync();

                return ApiResult<string>.Created(null, "Friend request has been sent");
            }
            if (friendship.Type == FriendshipType.Accepted)
            {
                return ApiResult<string>.BadRequest(null, "You are already a friend of " + friend.FullName);
            }
            if (friendship.RequestedUserId.Equals(friend.Id))
            {
                friendship.Type = FriendshipType.Accepted;
                friendship.ResponsedDate = DateTime.Now;

                if (!_currentUser.Following.Contains(friend))
                {
                    _currentUser.Following.Add(friend);
                }

                await _context.SaveChangesAsync();
                return ApiResult<string>.Ok(null, "Accepted friend request from " + friend.FullName);
            }
            return ApiResult<string>.BadRequest(null, "Friend request has already been sent");
        }

        public async Task<ApiResult<string>> AcceptFriendRequestAsync(string userName)
        {
            var friend = await _context.Users.FirstOrDefaultAsync(x => x.UserName.Equals(userName) && !x.UserName.Equals(_currentUser.UserName));
            if (friend == null)
            {
                return ApiResult<string>.NotFound(null, "Not found user " + userName);
            }
            if (IsBlocked(friend))
            {
                return ApiResult<string>.BadRequest(null, "Cannot accept friend request from " + friend.FullName);
            }

            var friendRequest = await GetFriendRequestFromAsync(friend);

            if (friendRequest == null)
            {
                return ApiResult<string>.NotFound(null, "Not found friend request of " + friend.FullName);
            }

            if (friendRequest.Type == FriendshipType.Accepted)
            {
                return ApiResult<string>.BadRequest(null, "You are already a friend of " + friend.FullName);
            }

            friendRequest.Type = FriendshipType.Accepted;
            friendRequest.ResponsedDate = DateTime.Now;

            if (!_currentUser.Following.Contains(friend))
            {
                _currentUser.Following.Add(friend);
            }

            await _context.SaveChangesAsync();

            return ApiResult<string>.Ok(null, "Accepted friend request from " + friend.FullName);
        }

        public async Task<ApiResult<string>> DeleteFriendshipAsync(string userName)
        {
            var friend = await _context.Users
                .Include(x => x.Following)
                .AsSplitQuery()
                .FirstOrDefaultAsync(x => x.UserName.Equals(userName) && !x.UserName.Equals(_currentUser.UserName));
            if (friend == null)
            {
                return ApiResult<string>.NotFound(null, "Not found user " + userName);
            }

            var friendship = await GetFriendshipAsync(friend);

            if (friendship == null)
            {
                return ApiResult<string>.NotFound(null, "Not found friendship with " + friend.FullName);
            }

            _context.Friendships.Remove(friendship);
            _currentUser.Following.Remove(friend);
            friend.Following.Remove(_currentUser);

            await _context.SaveChangesAsync();

            return ApiResult<string>.Ok(null, "Delete friendship successfully");
        }

        public async Task<ApiResult<string>> BlockFriendAsync(string userName)
        {
            var friend = await _context.Users.FirstOrDefaultAsync(x => x.UserName.Equals(userName) && !x.UserName.Equals(_currentUser.UserName));
            if (friend == null)
            {
                return ApiResult<string>.NotFound(null, "Not found user " + userName);
            }

            if (_currentUser.BlockedUsers.Contains(friend))
            {
                return ApiResult<string>.BadRequest(null, "Already blocked " + friend.FullName);
            }

            var friendship = await GetFriendshipAsync(friend);
            if (friendship != null)
            {
                _context.Friendships.Remove(friendship);
            }

            _currentUser.Following.Remove(friend);
            _currentUser.BlockedUsers.Add(friend);
            await _context.SaveChangesAsync();

            return ApiResult<string>.Ok(null, "Blocked " + friend.FullName);
        }

        public async Task<ApiResult<string>> UnBlockFriendAsync(string userName)
        {
            var friend = await _context.Users.FirstOrDefaultAsync(x => x.UserName.Equals(userName) && !x.UserName.Equals(_currentUser.UserName));
            if (friend == null)
            {
                return ApiResult<string>.NotFound(null, "Not found user " + userName);
            }

            if (!_currentUser.BlockedUsers.Contains(friend))
            {
                return ApiResult<string>.BadRequest(null, friend.FullName + " has not been blocked");
            }

            _currentUser.BlockedUsers.Remove(friend);
            await _context.SaveChangesAsync();

            return ApiResult<string>.Ok(null, "Unblocked " + friend.FullName);
        }

        public async Task<ApiResult<string>> FollowFriendAsync(string userName)
        {
            var friend = await _context.Users.FirstOrDefaultAsync(x => x.UserName.Equals(userName) && !x.UserName.Equals(_currentUser.UserName));
            if (friend == null)
            {
                return ApiResult<string>.NotFound(null, "Not found user " + userName);
            }

            if (IsBlocked(friend))
            {
                return ApiResult<string>.BadRequest(null, "Cannot follow " + friend.FullName);
            }

            if (_currentUser.Following.Contains(friend))
            {
                return ApiResult<string>.BadRequest(null, "Already followed " + friend.FullName);
            }

            _currentUser.Following.Add(friend);
            await _context.SaveChangesAsync();

            return ApiResult<string>.Ok(null, "Followed " + friend.FullName);
        }

        public async Task<ApiResult<string>> UnFollowFriendAsync(string userName)
        {
            var friend = await _context.Users.FirstOrDefaultAsync(x => x.UserName.Equals(userName) && !x.UserName.Equals(_currentUser.UserName));
            if (friend == null)
            {
                return ApiResult<string>.NotFound(null, "Not found user " + userName);
            }

            if (!_currentUser.Following.Contains(friend))
            {
                return ApiResult<string>.BadRequest(null, friend.FullName + " has not been followed");
            }

            _currentUser.Following.Remove(friend);
            await _context.SaveChangesAsync();

            return ApiResult<string>.Ok(null, "Unfollowed " + friend.FullName);
        }
    }
}