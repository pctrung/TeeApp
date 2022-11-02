using Microsoft.AspNetCore.Identity;
using System.Threading.Tasks;
using TeeApp.Models.Common;
using TeeApp.Models.RequestModels.Users;

namespace TeeApp.Application.Interfaces
{
    public interface IAccountService
    {
        Task<IdentityResult> RegisterAsync(RegisterRequest request);

        Task<ApiResult<string>> LoginAsync(LoginRequest request);

        Task LogoutAsync();

        Task<bool> IsUserNameExistsAsync(string userName);

        Task<IdentityResult> ChangePasswordAsync(ChangePasswordRequest request);
        Task<ApiResult<bool>> LockoutAsync(string userName);
        Task<ApiResult<bool>> UnlockAsync(string userName);
    }
}