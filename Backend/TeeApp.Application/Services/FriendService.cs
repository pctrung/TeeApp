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
using TeeApp.Models.ViewModels;
using TeeApp.Utilities.Constants;
using TeeApp.Utilities.Enums.Types;
using TeeApp.Utilities.Extentions;

namespace TeeApp.Application.Services
{
    public class FriendService : IFriendService
    {
        private readonly TeeAppDbContext _context;
        private readonly IMapper _mapper;
        private readonly User _currentUser;

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
                throw new Exception("Unable to identify user. Please login and try again!");
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

        public async Task<ApiResult<RelationViewModel>> GetRelationAsync(string userName)
        {
            var friend = await _context.Users.FirstOrDefaultAsync(x => x.UserName.Equals(userName));
            if (friend == null || IsBlocked(friend))
            {
                return ApiResult<RelationViewModel>.NotFound(null, "Not found user.");
            }
            var friendship = await GetFriendshipAsync(friend);

            var relation = new RelationViewModel()
            {
                IsFollowing = _currentUser.Following.Contains(friend),
            };
            if (friendship == null)
            {
                relation.RelationType = RelationType.NotFriend;
            }
            else
            {
                if (friendship.Type == FriendshipType.Pending)
                {
                    if (friendship.RequestedUserId.Equals(_currentUser.Id))
                    {
                        relation.RelationType = RelationType.FriendRequestByMe;
                    }
                    else
                    {
                        relation.RelationType = RelationType.FriendRequestToMe;
                    }
                }
                else
                {
                    relation.RelationType = RelationType.Friend;
                }
            }
            return ApiResult<RelationViewModel>.Ok(relation);
        }

        public async Task<PagedResult<FriendshipViewModel>> GetFriendsPaginationAsync(PaginationRequestBase request)
        {
            // Filter friend contain keyword on first, last, user name
            var friendships = await _context.Friendships
                .FilterBlockedAndRequestWithoutPagination(_currentUser, request)
                .Include(x => x.RequestedUser)
                .Include(x => x.RecievedUser)
                .Where(x => x.Type == FriendshipType.Accepted)
                .AsSplitQuery()
                .ToListAsync();

            var totalRecords = friendships.Count;
            var pagedFriendships = friendships.Paged(request.Page, request.Limit);
            var pagedFriendshipViewModels = _mapper.Map<List<FriendshipViewModel>>(pagedFriendships);

            var following = _currentUser.Following.Select(x => x.UserName);
            pagedFriendshipViewModels.ForEach(friendship => { friendship.IsFollowing = following.Contains(friendship.User.UserName); });

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

        public async Task<PagedResult<FriendshipViewModel>> GetFriendRequestsPaginationAsync(PaginationRequestBase request)
        {
            // Filter friend contain keyword on first, last, user name
            var friendships = await _context.Friendships
                .FilterBlockedAndRequestWithoutPagination(_currentUser, request)
                .Include(x => x.RequestedUser)
                .Include(x => x.RecievedUser)
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
            // Filter friend contain keyword on first, last, user name
            var friendships = await _context.Friendships
                .FilterBlockedAndRequestWithoutPagination(_currentUser, request)
                .Include(x => x.RequestedUser)
                .Include(x => x.RecievedUser)
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

        public PagedResult<UserViewModel> GetBlockedPagination(PaginationRequestBase request)
        {
            var pagedBlockedUsers = _currentUser.BlockedUsers
                .Where(x => x.UserName.Contains(request.Keyword, StringComparison.OrdinalIgnoreCase) || x.FullName.Contains(request.Keyword, StringComparison.OrdinalIgnoreCase))
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

        public PagedResult<UserViewModel> GetFollowingPagination(PaginationRequestBase request)
        {
            var pagedFollowingUsers = _currentUser.Following
                .FilterBlockedAndRequestWithoutPagination(_currentUser, request)
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

        public PagedResult<UserViewModel> GetFollowersPagination(PaginationRequestBase request)
        {
            var pagedFollowerUsers = _currentUser.Followers
                .FilterBlockedAndRequestWithoutPagination(_currentUser, request)
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

        public async Task<ApiResult> AddFriendAsync(string userName)
        {
            var friend = await _context.Users.FirstOrDefaultAsync(x => x.UserName.Equals(userName) && !x.UserName.Equals(_currentUser.UserName));
            if (friend == null)
            {
                return ApiResult.NotFound("Not found user " + userName);
            }
            if (IsBlocked(friend))
            {
                return ApiResult.BadRequest("Cannot send friend request to " + friend.FullName);
            }

            var friendship = await GetFriendshipAsync(friend);

            if (friendship == null)
            {
                friendship = new Friendship()
                {
                    RequestedUser = _currentUser,
                    RecievedUser = friend,
                    Type = FriendshipType.Pending,
                    RequestedDate = DateTime.UtcNow.ToVNTimeZone()
                };

                if (!_currentUser.Following.Contains(friend))
                {
                    _currentUser.Following.Add(friend);
                }

                await _context.Friendships.AddAsync(friendship);
                await _context.SaveChangesAsync();

                return ApiResult.Ok("Friend request has been sent!");
            }
            if (friendship.Type == FriendshipType.Accepted)
            {
                return ApiResult.BadRequest("You are already a friend of " + friend.FullName);
            }
            if (friendship.RequestedUserId.Equals(friend.Id))
            {
                friendship.Type = FriendshipType.Accepted;
                friendship.RespondedDate = DateTime.UtcNow.ToVNTimeZone();

                if (!_currentUser.Following.Contains(friend))
                {
                    _currentUser.Following.Add(friend);
                }

                await _context.SaveChangesAsync();
                return new ApiResult()
                {
                    Message = "Accepted friend request from " + friend.FullName,
                    StatusCode = 2001
                };
            }
            return ApiResult.BadRequest("Friend request has already been sent!");
        }

        public async Task<ApiResult> AcceptFriendRequestAsync(string userName)
        {
            var friend = await _context.Users.FirstOrDefaultAsync(x => x.UserName.Equals(userName) && !x.UserName.Equals(_currentUser.UserName));
            if (friend == null)
            {
                return ApiResult.NotFound("Not found user " + userName);
            }
            if (IsBlocked(friend))
            {
                return ApiResult.BadRequest("Cannot accept friend request from " + friend.FullName);
            }

            var friendRequest = await GetFriendRequestFromAsync(friend);

            if (friendRequest == null)
            {
                return ApiResult.NotFound("Not found friend request from " + friend.FullName);
            }

            if (friendRequest.Type == FriendshipType.Accepted)
            {
                return ApiResult.BadRequest("You are already a friend of " + friend.FullName);
            }

            friendRequest.Type = FriendshipType.Accepted;
            friendRequest.RespondedDate = DateTime.UtcNow.ToVNTimeZone();

            if (!_currentUser.Following.Contains(friend))
            {
                _currentUser.Following.Add(friend);
            }

            await _context.SaveChangesAsync();

            return ApiResult.Ok("Accepted friend request from " + friend.FullName);
        }

        public async Task<ApiResult> DeleteFriendshipAsync(string userName)
        {
            if (userName.Equals(SystemConstants.ADMIN_USERNAME, StringComparison.OrdinalIgnoreCase))
            {
                return ApiResult.BadRequest("Sorry! You cannot unfriend Trung because he is the most handsome developer in the universe!");
            }
            var friend = await _context.Users
                .Include(x => x.Following)
                .AsSplitQuery()
                .FirstOrDefaultAsync(x => x.UserName.Equals(userName) && !x.UserName.Equals(_currentUser.UserName));
            if (friend == null)
            {
                return ApiResult.NotFound("Not found user " + userName);
            }

            var friendship = await GetFriendshipAsync(friend);

            if (friendship == null)
            {
                return ApiResult.Ok("Not found friendship with " + friend.FullName);
            }

            _context.Friendships.Remove(friendship);
            _currentUser.Following.Remove(friend);
            friend.Following.Remove(_currentUser);

            await _context.SaveChangesAsync();

            return ApiResult.Ok("Delete friendship successfully!");
        }

        public async Task<ApiResult> BlockFriendAsync(string userName)
        {
            if (userName.Equals(SystemConstants.ADMIN_USERNAME, StringComparison.OrdinalIgnoreCase))
            {
                return ApiResult.BadRequest("Sorry! You cannot block Trung because he is the most handsome developer in the universe!");
            }
            var friend = await _context.Users.FirstOrDefaultAsync(x => x.UserName.Equals(userName) && !x.UserName.Equals(_currentUser.UserName));
            if (friend == null)
            {
                return ApiResult.NotFound("Not found user " + userName);
            }

            if (_currentUser.BlockedUsers.Contains(friend))
            {
                return ApiResult.BadRequest("Already blocked " + friend.FullName);
            }

            var friendship = await GetFriendshipAsync(friend);
            if (friendship != null)
            {
                _context.Friendships.Remove(friendship);
            }

            _currentUser.Following.Remove(friend);
            _currentUser.BlockedUsers.Add(friend);
            await _context.SaveChangesAsync();

            return ApiResult.Ok("Blocked " + friend.FullName);
        }

        public async Task<ApiResult> UnblockFriendAsync(string userName)
        {
            if (userName.Equals(SystemConstants.ADMIN_USERNAME, StringComparison.OrdinalIgnoreCase))
            {
                return ApiResult.BadRequest("Sorry! You cannot block Trung because he is the most handsome developer in the universe!");
            }
            var friend = await _context.Users.FirstOrDefaultAsync(x => x.UserName.Equals(userName) && !x.UserName.Equals(_currentUser.UserName));
            if (friend == null)
            {
                return ApiResult.NotFound("Not found user " + userName);
            }

            if (!_currentUser.BlockedUsers.Contains(friend))
            {
                return ApiResult.BadRequest(friend.FullName + " has not been blocked.");
            }

            _currentUser.BlockedUsers.Remove(friend);
            await _context.SaveChangesAsync();

            return ApiResult.Ok("Unblocked " + friend.FullName);
        }

        public async Task<ApiResult> FollowFriendAsync(string userName)
        {
            var friend = await _context.Users.FirstOrDefaultAsync(x => x.UserName.Equals(userName) && !x.UserName.Equals(_currentUser.UserName));
            if (friend == null)
            {
                return ApiResult.NotFound("Not found user " + userName);
            }

            if (IsBlocked(friend))
            {
                return ApiResult.BadRequest("Cannot follow " + friend.FullName);
            }

            if (_currentUser.Following.Contains(friend))
            {
                return ApiResult.BadRequest("Already followed " + friend.FullName);
            }

            _currentUser.Following.Add(friend);
            await _context.SaveChangesAsync();

            return ApiResult.Ok("Followed " + friend.FullName);
        }

        public async Task<ApiResult> UnFollowFriendAsync(string userName)
        {
            if (userName.Equals(SystemConstants.ADMIN_USERNAME, StringComparison.OrdinalIgnoreCase))
            {
                return ApiResult.BadRequest("Sorry! You cannot unfollow Trung because he is the most handsome developer in the universe!");
            }
            var friend = await _context.Users.FirstOrDefaultAsync(x => x.UserName.Equals(userName) && !x.UserName.Equals(_currentUser.UserName));
            if (friend == null)
            {
                return ApiResult.NotFound("Not found user " + userName);
            }

            if (!_currentUser.Following.Contains(friend))
            {
                return ApiResult.BadRequest(friend.FullName + " has not been followed.");
            }

            _currentUser.Following.Remove(friend);
            await _context.SaveChangesAsync();

            return ApiResult.Ok("Unfollowed " + friend.FullName);
        }
    }
}