using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Threading.Tasks;
using TeeApp.Application.Interfaces;
using TeeApp.Models.Common;
using TeeApp.Models.RequestModels.Common;
using TeeApp.Models.ViewModels;

namespace TeeApp.Api.Controllers
{
    [Authorize]
    [ApiController]
    [Route("api/[controller]")]
    public class FriendsController : ControllerBase
    {
        private readonly IFriendService _friendService;
        private readonly INotificationService _notificationService;

        public FriendsController(IFriendService friendService, INotificationService notificationService)
        {
            _friendService = friendService;
            _notificationService = notificationService;
        }

        [HttpGet("/friends")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<ActionResult<PagedResult<FriendshipViewModel>>> GetFriend([FromQuery] PaginationRequestBase request)
        {
            var result = await _friendService.GetFriendsPaginationAsync(request);
            return Ok(result);
        }

        [HttpGet("/friendRequests")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<ActionResult<PagedResult<FriendshipViewModel>>> GetFriendRequest([FromQuery] PaginationRequestBase request)
        {
            var result = await _friendService.GetFriendRequestsPaginationAsync(request);
            return Ok(result);
        }

        [HttpGet("/myRequests")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<ActionResult<PagedResult<FriendshipViewModel>>> GetRequested([FromQuery] PaginationRequestBase request)
        {
            var result = await _friendService.GetRequestedPaginationAsync(request);
            return Ok(result);
        }

        [HttpGet("/blocked")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public ActionResult<List<FriendshipViewModel>> GetBlocked([FromQuery] PaginationRequestBase request)
        {
            var result = _friendService.GetBlockedPagination(request);
            return Ok(result);
        }

        [HttpGet("/following")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public ActionResult<List<FriendshipViewModel>> GetFollowing([FromQuery] PaginationRequestBase request)
        {
            var result = _friendService.GetFollowingPagination(request);
            return Ok(result);
        }

        [HttpGet("/followers")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public ActionResult<List<FriendshipViewModel>> GetFollowers([FromQuery] PaginationRequestBase request)
        {
            var result = _friendService.GetFollowersPagination(request);
            return Ok(result);
        }

        [HttpPatch("{userName}/addFriend")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> AddFriend(string userName)
        {
            var result = await _friendService.AddFriendAsync(userName);

            switch (result.StatusCode)
            {
                case 200:
                    {
                        var notification = _notificationService.CreateFriendRequestNotificationAsync(userName);
                        return Ok(result.Message);
                    }
                case 404: return NotFound(result.Message);
                default: return BadRequest(result.Message);
            };
        }

        [HttpPatch("{userName}/unfriend")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> Unfriend(string userName)
        {
            var result = await _friendService.DeleteFriendshipAsync(userName);

            return result.StatusCode switch
            {
                200 => Ok(result.Message),
                404 => NotFound(result.Message),
                _ => BadRequest(result.Message),
            };
        }

        [HttpPatch("{userName}/accept")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> AcceptFriendRequest(string userName)
        {
            var result = await _friendService.AcceptFriendRequestAsync(userName);

            return result.StatusCode switch
            {
                200 => Ok(result.Message),
                404 => NotFound(result.Message),
                _ => BadRequest(result.Message),
            };
        }

        [HttpPatch("{userName}/block")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> Block(string userName)
        {
            var result = await _friendService.BlockFriendAsync(userName);

            return result.StatusCode switch
            {
                200 => Ok(result.Message),
                404 => NotFound(result.Message),
                _ => BadRequest(result.Message),
            };
        }

        [HttpPatch("{userName}/unblock")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> UnBlock(string userName)
        {
            var result = await _friendService.UnBlockFriendAsync(userName);

            return result.StatusCode switch
            {
                200 => Ok(result.Message),
                404 => NotFound(result.Message),
                _ => BadRequest(result.Message),
            };
        }

        [HttpPatch("{userName}/follow")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> Follow(string userName)
        {
            var result = await _friendService.FollowFriendAsync(userName);

            switch (result.StatusCode)
            {
                case 200:
                    {
                        var notification = _notificationService.CreateFollowNotificationAsync(userName);
                        return Ok(result.Message);
                    }
                case 404: return NotFound(result.Message);
                default: return BadRequest(result.Message);
            };
        }

        [HttpPatch("{userName}/unfollow")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> UnFollow(string userName)
        {
            var result = await _friendService.UnFollowFriendAsync(userName);

            return result.StatusCode switch
            {
                200 => Ok(result.Message),
                404 => NotFound(result.Message),
                _ => BadRequest(result.Message),
            };
        }
    }
}