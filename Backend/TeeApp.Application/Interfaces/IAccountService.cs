using Microsoft.AspNetCore.Identity;
using System.Threading.Tasks;
using TeeApp.Models.RequestModels.Users;

namespace TeeApp.Application.Interfaces
{
    public interface IAccountService
    {
        Task<IdentityResult> RegisterAsync(RegisterRequest request);

        Task<string> LoginAsync(LoginRequest request);

        Task LogoutAsync();

        Task<bool> IsUserNameExistsAsync(string userName);
    }
}