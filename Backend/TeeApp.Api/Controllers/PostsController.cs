using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using System.Threading.Tasks;
using TeeApp.Application.Interfaces;
using TeeApp.Hubs.Hubs;
using TeeApp.Hubs.Interfaces;
using TeeApp.Models.Common;
using TeeApp.Models.RequestModels.Comments;
using TeeApp.Models.RequestModels.Common;
using TeeApp.Models.RequestModels.PostPhotos;
using TeeApp.Models.RequestModels.Posts;
using TeeApp.Models.RequestModels.Reactions;
using TeeApp.Models.ViewModels;

namespace TeeApp.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class PostsController : ControllerBase
    {
        private readonly IPostService _postService;
        private readonly IPostPhotoService _postPhotoService;
        private readonly ICommentService _commentService;
        private readonly IReactionService _reactionService;
        private readonly INotificationService _notificationService;
        private readonly IHubContext<AppHub, IAppClient> _appHub;

        public PostsController(IHubContext<AppHub, IAppClient> appHub, IPostService postService, IPostPhotoService postPhotoService, ICommentService commentService, IReactionService reactionService, INotificationService notificationService)
        {
            _appHub = appHub;
            _postService = postService;
            _postPhotoService = postPhotoService;
            _commentService = commentService;
            _reactionService = reactionService;
            _notificationService = notificationService;
        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<ActionResult<PagedResult<PostViewModel>>> GetAll([FromQuery] PaginationRequestBase request)
        {
            var result = await _postService.GetAllPaginationAsync(request);
            return Ok(result);
        }

        [HttpGet("newsFeed")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<ActionResult<PagedResult<PostViewModel>>> GetNewFeed([FromQuery] PaginationRequestBase request)
        {
            var result = await _postService.GetNewsFeedPaginationAsync(request);
            return Ok(result);
        }
        
        [HttpGet("admin")]
        [Authorize]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<ActionResult<PagedResult<PostViewModel>>> GetAllAdmin([FromQuery] PaginationRequestBase request)
        {
            var result = await _postService.GetAllAdminPaginationAsync(request);
            return Ok(result);
        }

        [HttpGet("{postId:int}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult<PagedResult<PostViewModel>>> GetById(int postId)
        {
            var result = await _postService.GetByIdAsync(postId);
            return result.StatusCode switch
            {
                200 => Ok(result.Data),
                _ => NotFound(result.Message)
            };
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<IActionResult> Create(CreatePostRequest request)
        {
            var result = await _postService.CreateAsync(request);

            switch (result.StatusCode)
            {
                case 201:
                    {
                        await _appHub.Clients.Users(result.Data.RecipientUserNames).ReceivePost(result.Data.Post);
                        return Created("", result.Data.Post);
                    }
                default: return BadRequest(result.Message);
            }
        }
        
        [HttpPost("{postId:int}/hide")]
        [Authorize]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<IActionResult> HidePost(int postId, [FromBody] HidePostRequest request)
        {
            var result = await _postService.HidePost(postId, request.Note);

            switch (result.StatusCode)
            {
                case 200:
                {
                    return Ok();
                }
                default: return BadRequest(result.Message);
            }
        }
        [HttpPost("{postId:int}/show")]
        [Authorize]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<IActionResult> UnHidePost(int postId)
        {
            var result = await _postService.UnHidePost(postId);

            switch (result.StatusCode)
            {
                case 200:
                {
                    return Ok();
                }
                default: return BadRequest(result.Message);
            }
        }

        [HttpPut("{postId:int}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status403Forbidden)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> Update(int postId, UpdatePostRequest request)
        {
            var result = await _postService.UpdateAsync(postId, request);

            switch (result.StatusCode)
            {
                case 200:
                    {
                        await _appHub.Clients.All.ReceiveUpdatedPost(result.Data.Post);
                        //await _appHub.Clients.Users(result.Data.RecipientUserNames).ReceiveUpdatedPost(result.Data.Post);
                        return Ok(result.Data.Post);
                    }
                case 403: return Forbid();
                default: return NotFound(result.Message);
            }
        }

        [HttpDelete("{postId:int}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status403Forbidden)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> Delete(int postId)
        {
            var result = await _postService.DeleteAsync(postId);

            switch (result.StatusCode)
            {
                case 200:
                    {
                        await _appHub.Clients.All.DeletePost(postId);
                        //await _appHub.Clients.Users(result.Data.RecipientUserNames).DeletePost(postId);
                        return Ok(result.Message);
                    }
                case 403: return Forbid();
                default: return NotFound(result.Message);
            }
        }

        [HttpPost("{postId:int}/photos")]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> CreatePhoto(int postId, [FromForm] PostPhotoRequest request)
        {
            var result = await _postPhotoService.CreateAsync(postId, request);

            switch (result.StatusCode)
            {
                case 201:
                    {
                        await _appHub.Clients.All.ReceiveUpdatedPost(result.Data.Post);
                        //await _appHub.Clients.Users(result.Data.RecipientUserNames).ReceiveUpdatedPost(result.Data.Post);
                        return Created("", result.Message);
                    }
                case 404: return NotFound(result.Message);
                default: return BadRequest(result.Message);
            }
        }

        [HttpDelete("{postId:int}/photos/{photoId:int}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status403Forbidden)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> DeletePhoto(int postId, int photoId)
        {
            var result = await _postPhotoService.DeleteAsync(postId, photoId);

            switch (result.StatusCode)
            {
                case 200:
                    {
                        await _appHub.Clients.All.ReceiveUpdatedPost(result.Data.Post);
                        //await _appHub.Clients.Users(result.Data.RecipientUserNames).ReceiveUpdatedPost(result.Data.Post);
                        return Ok(result.Message);
                    }
                case 403: return Forbid();
                default: return NotFound(result.Message);
            }
        }

        [HttpPost("{postId:int}/comments")]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> CreateComment(int postId, CommentRequest request)
        {
            var result = await _commentService.CreateAsync(postId, request);

            switch (result.StatusCode)
            {
                case 201:
                    {
                        var notification = await _notificationService.CreateCommentNotificationAsync(postId);

                        await _appHub.Clients.User(notification.RecipientUserName).ReceiveNotification(notification);
                        
                        result.Data.Comment.DateCreated = result.Data.Comment.DateCreated.AddHours(-7);
                        await _appHub.Clients.All.ReceiveComment(result.Data);
                        //await _appHub.Clients.Users(result.Data.RecipientUserNames).ReceiveComment(result.Data);

                        return Created("", result.Data);
                    }
                case 404: return NotFound(result.Message);
                default: return BadRequest(result.Message);
            }
        }

        [HttpPut("{postId:int}/comments/{commentId:int}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status403Forbidden)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> UpdateComment(int postId, int commentId, CommentRequest request)
        {
            var result = await _commentService.UpdateAsync(postId, commentId, request);

            switch (result.StatusCode)
            {
                case 200:
                {
                    result.Data.Comment.DateCreated = result.Data.Comment.DateCreated.AddHours(-7); 
                    await _appHub.Clients.All.ReceiveUpdatedComment(result.Data);
                    //await _appHub.Clients.Users(result.Data.RecipientUserNames).ReceiveUpdatedComment(result.Data);
                    return Ok(result.Data);
                }
                case 403: return Forbid();
                default: return NotFound(result.Message);
            }
        }

        [HttpDelete("{postId:int}/comments/{commentId:int}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status403Forbidden)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> DeleteComment(int postId, int commentId)
        {
            var result = await _commentService.DeleteAsync(postId, commentId);

            switch (result.StatusCode)
            {
                case 200:
                    {
                        await _appHub.Clients.All.DeleteComment(postId, commentId);
                        //await _appHub.Clients.Users(result.Data.RecipientUserNames).DeleteComment(postId, commentId);
                        return Ok(result.Message);
                    }
                case 403: return Forbid();
                default: return NotFound(result.Message);
            }
        }

        [HttpPost("{postId:int}/reactions")]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> CreateReaction(int postId, ReactionRequest request)
        {
            var result = await _reactionService.CreateAsync(postId, request);

            switch (result.StatusCode)
            {
                case 201:
                    {
                        var notification = await _notificationService.CreateReactionNotificationAsync(postId, result.Data.Reaction.Type);

                        await _appHub.Clients.User(notification.RecipientUserName).ReceiveNotification(notification);
                        await _appHub.Clients.All.ReceiveReaction(result.Data);
                        //await _appHub.Clients.Users(result.Data.RecipientUserNames).ReceiveReaction(result.Data);

                        return Created("", result.Data);
                    }
                case 404: return NotFound(result.Message);
                default: return BadRequest(result.Message);
            }
        }

        [HttpPut("{postId:int}/reactions")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status403Forbidden)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> UpdateReaction(int postId, ReactionRequest request)
        {
            var result = await _reactionService.UpdateAsync(postId, request);

            switch (result.StatusCode)
            {
                case 200:
                    {
                        await _appHub.Clients.All.ReceiveUpdatedReaction(result.Data);
                        //await _appHub.Clients.Users(result.Data.RecipientUserNames).ReceiveUpdatedReaction(result.Data);

                        return Ok(result.Data);
                    }
                case 403: return Forbid();
                default: return NotFound(result.Message);
            }
        }

        [HttpDelete("{postId:int}/reactions")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status403Forbidden)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> DeleteReaction(int postId)
        {
            var result = await _reactionService.DeleteAsync(postId);

            switch (result.StatusCode)
            {
                case 200:
                    {
                        await _appHub.Clients.All.DeleteReaction(postId, result.Data.Reaction.Id);
                        //await _appHub.Clients.Users(result.Data.RecipientUserNames).DeleteReaction(postId, result.Data.Reaction.Id);

                        return Ok(result.Message);
                    }
                case 403: return Forbid();
                default: return NotFound(result.Message);
            }
        }
    }
}