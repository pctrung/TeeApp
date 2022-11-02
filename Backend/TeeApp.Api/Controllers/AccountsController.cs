using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using TeeApp.Application.Interfaces;
using TeeApp.Models.RequestModels.Users;

namespace TeeApp.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountsController : ControllerBase
    {
        private readonly IAccountService _accountService;

        public AccountsController(IAccountService accountService)
        {
            _accountService = accountService;
        }

        [AllowAnonymous]
        [HttpGet("{userName}/isExists")]
        public async Task<IActionResult> CheckUserExistsAsync(string userName)
        {
            var result = await _accountService.IsUserNameExistsAsync(userName);

            return Ok(new { isExists = result });
        }

        [AllowAnonymous]
        [HttpPost("register")]
        public async Task<IActionResult> Register(RegisterRequest request)
        {
            var result = await _accountService.RegisterAsync(request);
            if (result.Succeeded)
            {
                return Ok(result);
            }
            else
            {
                var message = "";
                foreach (var error in result.Errors)
                {
                    message = error.Description;
                    break;
                }
                return BadRequest(message);
            }
        }

        [Authorize]
        [HttpPost("changePassword")]
        public async Task<IActionResult> ChangePassword(ChangePasswordRequest request)
        {
            var result = await _accountService.ChangePasswordAsync(request);
            if (result.Succeeded)
            {
                return Ok(result);
            }
            else
            {
                var message = "";
                foreach (var error in result.Errors)
                {
                    message = error.Description;
                    break;
                }
                return BadRequest(message);
            }
        }
        
        [Authorize]
        [HttpPost("lockout/{userName}")]
        public async Task<IActionResult> Lock(string userName)
        {
            var result = await _accountService.LockoutAsync(userName);
            return result.StatusCode switch
            {
                200 => Ok(result.Message),
                403 => Forbid(),
                404 => NotFound(result.Message),
                _ => BadRequest(result.Message),
            };
        }
        [Authorize]
        [HttpPost("unlock/{userName}")]
        public async Task<IActionResult> Unlock(string userName)
        {
            var result = await _accountService.UnlockAsync(userName);
            return result.StatusCode switch
            {
                200 => Ok(result.Message),
                403 => Forbid(),
                404 => NotFound(result.Message),
                _ => BadRequest(result.Message),
            };
        }
        [AllowAnonymous]
        [HttpPost("login")]
        public async Task<IActionResult> Login(LoginRequest request)
        {
            var result = await _accountService.LoginAsync(request);
            return result.StatusCode switch
            {
                403 => Forbid(),
                _ => Ok(result)
            };
        }

        [Authorize]
        [HttpPost("logout")]
        public async Task<IActionResult> Logout()
        {
            await _accountService.LogoutAsync();
            return NoContent();
        }
    }
}