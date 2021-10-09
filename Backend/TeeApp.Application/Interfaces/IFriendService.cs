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

        Task<ApiResult<RelationViewModel>> GetRelationAsync(string userName);

        Task<PagedResult<FriendshipViewModel>> GetFriendRequestsPaginationAsync(PaginationRequestBase request);

        Task<PagedResult<FriendshipViewModel>> GetRequestedPaginationAsync(PaginationRequestBase request);

        PagedResult<UserViewModel> GetBlockedPagination(PaginationRequestBase request);

        PagedResult<UserViewModel> GetFollowingPagination(PaginationRequestBase request);

        PagedResult<UserViewModel> GetFollowersPagination(PaginationRequestBase request);

        Task<ApiResult> AddFriendAsync(string userName);

        Task<ApiResult> DeleteFriendshipAsync(string userName);

        Task<ApiResult> AcceptFriendRequestAsync(string userName);

        Task<ApiResult> BlockFriendAsync(string userName);

        Task<ApiResult> UnblockFriendAsync(string userName);

        Task<ApiResult> FollowFriendAsync(string userName);

        Task<ApiResult> UnFollowFriendAsync(string userName);
    }
}