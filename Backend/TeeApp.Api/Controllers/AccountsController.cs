using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using TeeApp.Application.Interfaces;
using TeeApp.Models.RequestModels.Users;

namespace TeeApp.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [AllowAnonymous]
    public class AccountsController : ControllerBase
    {
        private readonly IAccountService _accountService;

        public AccountsController(IAccountService accountService)
        {
            _accountService = accountService;
        }

        [HttpGet("{userName}/isExists")]
        public async Task<IActionResult> CheckUserExistsAsync(string userName)
        {
            var result = await _accountService.IsUserNameExistsAsync(userName);

            return Ok(new { isExists = result });
        }

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

        [HttpPost("login")]
        public async Task<IActionResult> Login(LoginRequest request)
        {
            var result = await _accountService.LoginAsync(request);
            if (result != null)
            {
                return Ok(result);
            }
            else
            {
                return BadRequest("Username or password is incorrect!");
            }
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