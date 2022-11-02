using System.Security.Claims;

namespace TeeApp.Application.Identity
{
    public interface ICurrentUser
    {
        string UserName { get; }

        string UserId { get; }

        string Email { get; }

        string FirstName { get; }

        string LastName { get; }

        string FullName { get; }

        ClaimsPrincipal User { get; }
        bool IsAdmin();
    }
}