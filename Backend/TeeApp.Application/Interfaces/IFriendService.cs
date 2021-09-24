using System.Collections.Generic;
using System.Threading.Tasks;
using TeeApp.Models.Common;
using TeeApp.Models.RequestModels.Common;
using TeeApp.Models.ViewModels;

namespace TeeApp.Application.Interfaces
{
    public interface IFriendService
    {
        Task<PagedResult<FriendshipViewModel>> GetFriendsPaginationAsync(PaginationRequestBase request);

        Task<PagedResult<FriendshipViewModel>> GetFriendRequestsPaginationAsync(PaginationRequestBase request);

        Task<PagedResult<FriendshipViewModel>> GetRequestedPaginationAsync(PaginationRequestBase request);

        PagedResult<UserViewModel> GetBlockedPagination(PaginationRequestBase request);

        PagedResult<UserViewModel> GetFollowingPagination(PaginationRequestBase request);

        PagedResult<UserViewModel> GetFollowersPagination(PaginationRequestBase request);

        Task<ApiResult<string>> AddFriendAsync(string userName);

        Task<ApiResult<string>> DeleteFriendshipAsync(string userName);

        Task<ApiResult<string>> AcceptFriendRequestAsync(string userName);

        Task<ApiResult<string>> BlockFriendAsync(string userName);

        Task<ApiResult<string>> UnBlockFriendAsync(string userName);

        Task<ApiResult<string>> FollowFriendAsync(string userName);

        Task<ApiResult<string>> UnFollowFriendAsync(string userName);
    }
}