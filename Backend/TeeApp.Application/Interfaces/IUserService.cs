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

        Task<UserViewModel> GetByUserName(string userName);

        UserViewModel GetCurrentUser();

        Task<ApiResult<UserViewModel>> UpdateUserAsync(UpdateUserRequest request);
    }
}