using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using TeeApp.Application.Interfaces;
using TeeApp.Models.RequestModels.Common;

namespace TeeApp.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class FriendsController : ControllerBase
    {
        private readonly IFriendService _friendService;

        public FriendsController(IFriendService friendService)
        {
            _friendService = friendService;
        }

        [HttpGet]
        public async Task<IActionResult> Get([FromQuery] PaginationRequestBase request)
        {
            var result = await _friendService.GetFriendListAsync(request);

            return result.StatusCode switch
            {
                200 => Ok(result.Data),
                403 => Forbid(),
                404 => NotFound(result.Message),
                _ => BadRequest(result.Message),
            };
        }

        [HttpGet("block")]
        public IActionResult GetBlockedFriendList([FromQuery] PaginationRequestBase request)
        {
            var result = _friendService.GetBlockedListAsync(request);

            return result.StatusCode switch
            {
                200 => Ok(result.Data),
                403 => Forbid(),
                404 => NotFound(result.Message),
                _ => BadRequest(result.Message),
            };
        }

        [HttpGet("follow")]
        public IActionResult GetFollowingList([FromQuery] PaginationRequestBase request)
        {
            var result = _friendService.GetFollowingListAsync(request);

            return result.StatusCode switch
            {
                200 => Ok(result.Data),
                403 => Forbid(),
                404 => NotFound(result.Message),
                _ => BadRequest(result.Message),
            };
        }

        [HttpPost("{userName}")]
        public async Task<IActionResult> Post(string userName)
        {
            var result = await _friendService.AddFriendAsync(userName);

            return result.StatusCode switch
            {
                201 => Created("", result.Message),
                403 => Forbid(),
                404 => NotFound(result.Message),
                _ => BadRequest(result.Message),
            };
        }

        [HttpPut("{userName}")]
        public async Task<IActionResult> Put(string userName)
        {
            var result = await _friendService.AcceptFriendRequestAsync(userName);

            return result.StatusCode switch
            {
                200 => Ok(result.Message),
                403 => Forbid(),
                404 => NotFound(result.Message),
                _ => BadRequest(result.Message),
            };
        }

        [HttpPost("{userName}/block")]
        public async Task<IActionResult> Block(string userName)
        {
            var result = await _friendService.BlockFriendAsync(userName);

            return result.StatusCode switch
            {
                200 => Ok(result.Message),
                403 => Forbid(),
                404 => NotFound(result.Message),
                _ => BadRequest(result.Message),
            };
        }

        [HttpDelete("{userName}/block")]
        public async Task<IActionResult> UnBlock(string userName)
        {
            var result = await _friendService.UnBlockFriendAsync(userName);

            return result.StatusCode switch
            {
                200 => Ok(result.Message),
                403 => Forbid(),
                404 => NotFound(result.Message),
                _ => BadRequest(result.Message),
            };
        }

        [HttpPost("{userName}/follow")]
        public async Task<IActionResult> Follow(string userName)
        {
            var result = await _friendService.FollowFriendAsync(userName);

            return result.StatusCode switch
            {
                200 => Ok(result.Message),
                403 => Forbid(),
                404 => NotFound(result.Message),
                _ => BadRequest(result.Message),
            };
        }

        [HttpDelete("{userName}/follow")]
        public async Task<IActionResult> UnFollow(string userName)
        {
            var result = await _friendService.UnFollowFriendAsync(userName);

            return result.StatusCode switch
            {
                200 => Ok(result.Message),
                403 => Forbid(),
                404 => NotFound(result.Message),
                _ => BadRequest(result.Message),
            };
        }

        [HttpDelete("{userName}")]
        public async Task<IActionResult> Delete(string userName)
        {
            var result = await _friendService.DeleteFriendshipAsync(userName);

            return result.StatusCode switch
            {
                200 => Ok(result.Message),
                403 => Forbid(),
                404 => NotFound(result.Message),
                _ => BadRequest(result.Message),
            };
        }
    }
}