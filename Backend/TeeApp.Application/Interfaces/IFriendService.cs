using System.Threading.Tasks;
using TeeApp.Models.Common;
using TeeApp.Models.RequestModels.Friends;

namespace TeeApp.Application.Interfaces
{
    public interface IFriendService
    {
        Task<ApiResult<bool>> AddFriendAsync(string userName);

        Task<ApiResult<bool>> UnfriendAsync(string userName);

        Task<ApiResult<bool>> BlockfriendAsync(string userName);

        Task<ApiResult<bool>> ResponseFriendRequestAsync(int id);
    }
}