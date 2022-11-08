using System;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
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
        private readonly IPostService _postService;

        public UsersController(IUserService userService, IPostService postService)
        {
            _userService = userService;
            _postService = postService;
        }

        [HttpGet]
        public async Task<IActionResult> GetUserList([FromQuery] PaginationRequestBase request)
        {
            var result = await _userService.GetUserListPaginationAsync(request);
            return Ok(result);
        }

        [HttpGet("{userName}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult<UserViewModel>> GetByUserName(string userName)
        {
            var result = await _userService.GetByUserNameAsync(userName);
            if (result != null)
            {
                return Ok(result);
            }
            return NotFound("Not found user.");
        }

        [HttpGet("{userName}/posts")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> GetPostsByUserName(string userName, [FromQuery] PaginationRequestBase request)
        {
            var result = await _postService.GetByUserNameAsync(userName, request);
            return result.StatusCode switch
            {
                200 => Ok(result.Data),
                _ => NotFound(result.Message),
            };
        }

        [HttpGet("current")]
        public ActionResult<UserViewModel> GetCurrentUser()
        {
            var result = _userService.GetCurrentUser();
            if (DateTime.Compare(DateTime.Now, result.LockoutEnd.DateTime) < 0)
            {
                return Unauthorized("Please login and try again!");
            }
            return Ok(result);
        }

        [HttpPut]
        public async Task<IActionResult> UpdateInformation(UpdateUserRequest request)
        {
            var result = await _userService.UpdateInformationAsync(request);

            return result.StatusCode switch
            {
                200 => Ok(result.Data),
                _ => BadRequest(result.Message),
            };
        }

        [HttpPatch("avatar")]
        public async Task<IActionResult> UpdateAvatar([FromForm] FileRequest request)
        {
            var result = await _userService.UpdateAvatarAsync(request);

            return result.StatusCode switch
            {
                200 => Ok(result.Data),
                _ => BadRequest(result.Message),
            };
        }

        [HttpPatch("cover")]
        public async Task<IActionResult> UpdateCover([FromForm] FileRequest request)
        {
            var result = await _userService.UpdateCoverAsync(request);

            return result.StatusCode switch
            {
                200 => Ok(result.Data),
                _ => BadRequest(result.Message),
            };
        }
    }
}