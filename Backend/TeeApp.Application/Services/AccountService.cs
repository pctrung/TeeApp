using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using System;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using TeeApp.Application.Identity;
using TeeApp.Application.Interfaces;
using TeeApp.Data.EF;
using TeeApp.Data.Entities;
using TeeApp.Models.Common;
using TeeApp.Models.RequestModels.Users;
using TeeApp.Utilities.Constants;
using TeeApp.Utilities.Extentions;

namespace TeeApp.Application.Services
{
    public class AccountService : IAccountService
    {
        private readonly TeeAppDbContext _context;
        private readonly UserManager<User> _userManager;
        private readonly SignInManager<User> _signInManager;
        private readonly IConfiguration _configuration;
        private readonly ICurrentUser _currentUser;

        public AccountService(TeeAppDbContext context, UserManager<User> userManager, SignInManager<User> signInManager, IConfiguration configuration, ICurrentUser currentUser)
        {
            _context = context;
            _userManager = userManager;
            _signInManager = signInManager;
            _configuration = configuration;
            _currentUser = currentUser;
        }

        public async Task<bool> IsUserNameExistsAsync(string userName)
        {
            if (!string.IsNullOrWhiteSpace(userName))
            {
                return await _context.Users.AnyAsync(x => x.UserName.Equals(userName));
            }
            return false;
        }

        public async Task<ApiResult<string>> LoginAsync(LoginRequest request)
        {
            var username = request.Username;

            // check email is match if user type email
            var emailCheck = await _context.Users.FirstOrDefaultAsync(x => x.Email.ToLower().Equals(request.Username.ToLower()));
            if (emailCheck != null)
            {
                username = emailCheck.UserName;
            }

            var user = await _userManager.FindByNameAsync(username);

            if (user == null)
            {
                return ApiResult<string>.NotFound(null,"Username or password is incorrect!");
            }

            var result = await _signInManager.PasswordSignInAsync(user.UserName, request.Password, request.RememberMe, false);

            if (result.IsLockedOut)
            {
                return ApiResult<string>.BadRequest(null,"Your account has been locked! Please contact administration for more detail.");
            } 
            if (result.IsNotAllowed || result.RequiresTwoFactor || !result.Succeeded)
            {
                return ApiResult<string>.BadRequest(null,"Username or password is incorrect!");
            } 

            var claims = await _userManager.GetClaimsAsync(user);

            string issuer = _configuration["Tokens:Issuer"];
            string signingKey = _configuration["Tokens:Key"];

            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["Tokens:Key"]));
            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var token = new JwtSecurityToken(issuer,
                issuer,
                claims,
                expires: DateTime.Now.AddDays(300),
                signingCredentials: creds);

            return ApiResult<string>.Ok(new JwtSecurityTokenHandler().WriteToken(token));
        }

        public async Task<IdentityResult> ChangePasswordAsync(ChangePasswordRequest request)
        {
            var user = await _userManager.FindByNameAsync(_currentUser.UserName);

            if (user == null)
            {
                return IdentityResult.Failed(
                    new IdentityError()
                    {
                        Description = "Cannot identify current user.",
                        Code = "500"
                    });
            }

            return await _userManager.ChangePasswordAsync(user, request.CurrentPassword, request.NewPassword);
        }

        public async Task<IdentityResult> RegisterAsync(RegisterRequest request)
        {
            if (string.Compare(request.Password, request.ConfirmPassword) != 0)
            {
                return IdentityResult.Failed(
                    new IdentityError()
                    {
                        Description = "Password and confirm password must be same.",
                        Code = "400"
                    });
            }
            if (request.DateOfBirth > DateTime.UtcNow.ToVNTimeZone())
            {
                return IdentityResult.Failed(
                    new IdentityError()
                    {
                        Description = "Please select date of birth smaller than today.",
                        Code = "400"
                    });
            }
            var user = new User()
            {
                FirstName = request.FirstName.Trim(),
                LastName = request.LastName.Trim(),
                UserName = request.Username.Trim(),
                DateCreated = DateTime.UtcNow.ToVNTimeZone(),
                Email = request.Email,
                Gender = request.Gender,
                DateOfBirth = request.DateOfBirth,
                Following = new()
            };

            // follow admin when register
            var admin = await _context.Users.FirstOrDefaultAsync(x => x.UserName.Equals(SystemConstants.ADMIN_USERNAME));
            if (admin != null)
            {
                user.Following.Add(admin);
            }

            var result = await _userManager.CreateAsync(user, request.Password);
            await _userManager.AddClaimAsync(user, new Claim("id", user.Id));
            await _userManager.AddClaimAsync(user, new Claim("userName", user.UserName));
            await _userManager.AddClaimAsync(user, new Claim("firstName", user.FirstName));
            await _userManager.AddClaimAsync(user, new Claim("lastName", user.LastName));
            await _userManager.AddClaimAsync(user, new Claim("fullName", user.FullName));
            await _userManager.AddClaimAsync(user, new Claim("email", user.Email));
            await _userManager.AddClaimAsync(user, new Claim(ClaimTypes.NameIdentifier, user.UserName));
            await _userManager.AddClaimAsync(user, new Claim(ClaimTypes.Name, user.FullName));
            await _userManager.AddClaimAsync(user, new Claim(ClaimTypes.Email, user.Email));
            return result;
        }

        public async Task LogoutAsync()
        {
            await _signInManager.SignOutAsync();
        }

        public async Task<ApiResult<bool>> LockoutAsync(string userName)
        {
            if (!_currentUser.IsAdmin())
            {
                return ApiResult<bool>.Forbid(false,"You do not have permission.");
            }

            if (userName.Equals(SystemConstants.ADMIN_USERNAME))
            {
                return ApiResult<bool>.BadRequest(false, "You cannot lock admin account.");
            }
            
            var user = await _context.Users.FirstOrDefaultAsync(x => x.UserName.Equals(userName));
            if (user == null)
            {
                return ApiResult<bool>.NotFound(false, "Not found user.");
            }
            var lockoutResult = await _userManager.SetLockoutEndDateAsync(user, DateTimeOffset.MaxValue);

            if (!lockoutResult.Succeeded)
            {
                return ApiResult<bool>.BadRequest(false, lockoutResult.Errors?.FirstOrDefault()?.Description);    
            }
            return ApiResult<bool>.Ok(true, "Lockout user succeeded.");
        }
        
        public async Task<ApiResult<bool>> UnlockAsync(string userName)
        {
            if (!_currentUser.IsAdmin())
            {
                return ApiResult<bool>.Forbid(false,"You do not have permission");
            }
            
            var user = await _context.Users.FirstOrDefaultAsync(x => x.UserName.Equals(userName));
            if (user == null)
            {
                return ApiResult<bool>.NotFound(false, "Not found user.");
            }
            var lockoutResult = await _userManager.SetLockoutEndDateAsync(user, DateTimeOffset.MinValue);

            if (!lockoutResult.Succeeded)
            {
                return ApiResult<bool>.NotFound(false, lockoutResult.Errors?.FirstOrDefault()?.Description);    
            }
            return ApiResult<bool>.Ok(true, "Unlock user succeeded.");
        }
    }
}