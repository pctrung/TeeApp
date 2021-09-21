using Microsoft.AspNetCore.Identity;
using System.Collections.Generic;
using System.Threading.Tasks;
using TeeApp.Models.Common;
using TeeApp.Models.RequestModels.Users;
using TeeApp.Models.ViewModels;

namespace TeeApp.Application.Interfaces
{
    public interface IUserService
    {
        Task<IdentityResult> RegisterAsync(RegisterRequest request);

        Task<List<UserViewModel>> GetFriendListAsync();

        Task<ApiResult<UserViewModel>> GetCurrentUserAsync();

        Task<string> LoginAsync(LoginRequest request);

        Task LogoutAsync();

        Task<bool> CheckUserNameExistsAsync(string userName);

        Task<ApiResult<UserViewModel>> UpdateUserAsync(UpdateUserRequest request);
    }
}