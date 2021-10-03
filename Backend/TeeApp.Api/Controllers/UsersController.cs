using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using TeeApp.Application.Interfaces;
using TeeApp.Models.RequestModels.Common;
using TeeApp.Models.RequestModels.Users;
using TeeApp.Models.ViewModels;

namespace TeeApp.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class UsersController : ControllerBase
    {
        private readonly IUserService _userService;

        public UsersController(IUserService userService)
        {
            _userService = userService;
        }

        [HttpGet]
        [Authorize]
        public async Task<IActionResult> GetUserList([FromQuery] PaginationRequestBase request)
        {
            var result = await _userService.GetUserListPaginationAsync(request);
            return Ok(result);
        }

        [HttpGet("{userName}")]
        [Authorize]
        public async Task<ActionResult<UserViewModel>> GetByUserName(string userName)
        {
            var result = await _userService.GetByUserName(userName);
            return Ok(result);
        }

        [HttpGet("current")]
        [Authorize]
        public ActionResult<UserViewModel> GetCurrentUser()
        {
            var result = _userService.GetCurrentUser();
            return Ok(result);
        }

        [HttpPut]
        [Authorize]
        public async Task<IActionResult> UpdateUser([FromForm] UpdateUserRequest request)
        {
            var result = await _userService.UpdateUserAsync(request);

            return result.StatusCode switch
            {
                200 => Ok(result.Data),
                _ => BadRequest(result.Message),
            };
        }
    }
}