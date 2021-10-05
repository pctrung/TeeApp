using System.Threading.Tasks;
using TeeApp.Models.Common;
using TeeApp.Models.RequestModels.Common;
using TeeApp.Models.RequestModels.Users;
using TeeApp.Models.ViewModels;

namespace TeeApp.Application.Interfaces
{
    public interface IUserService
    {
        Task<PagedResult<UserViewModel>> GetUserListPaginationAsync(PaginationRequestBase request);

        Task<UserViewModel> GetByUserNameAsync(string userName);

        UserViewModel GetCurrentUser();

        Task<ApiResult<UserViewModel>> UpdateInformationAsync(UpdateUserRequest request);

        Task<ApiResult<UserViewModel>> UpdateAvatarAsync(FileRequest request);

        Task<ApiResult<UserViewModel>> UpdateCoverAsync(FileRequest request);
    }
}