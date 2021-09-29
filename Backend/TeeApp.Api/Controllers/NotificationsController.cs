using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
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
    public class NotificationsController : ControllerBase
    {
        private readonly INotificationService _notificationService;

        public NotificationsController(INotificationService notificationService)
        {
            _notificationService = notificationService;
        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<ActionResult<PagedResult<FriendshipViewModel>>> GetAll([FromQuery] PaginationRequestBase request)
        {
            var result = await _notificationService.GetAllAsync(request);
            return Ok(result);
        }

        [HttpPatch("{id:int}/read")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<ActionResult<PagedResult<FriendshipViewModel>>> ReadNotification(int id)
        {
            await _notificationService.ReadByIdAsync(id);
            return NoContent();
        }

        [HttpPatch("read")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<ActionResult<PagedResult<FriendshipViewModel>>> ReadAllNotification()
        {
            await _notificationService.ReadAllAsync();
            return NoContent();
        }
    }
}