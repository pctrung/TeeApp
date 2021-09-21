using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using TeeApp.Application.Interfaces;
using TeeApp.Models.RequestModels.Posts;

namespace TeeApp.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class PostsController : ControllerBase
    {
        private readonly IPostService _postService;

        public PostsController(IPostService postService)
        {
            _postService = postService;
        }

        [HttpPost]
        public async Task<IActionResult> Create(CreatePostRequest request)
        {
            var result = await _postService.CreateAsync(request);

            switch (result.StatusCode)
            {
                case 201:
                    {
                        return Created("", result.Data.Post);
                    }
                case 200: return Ok(result);
                case 403: return Forbid();
                case 404: return NotFound(result.Message);
                default: return BadRequest(result.Message);
            }
        }

        [HttpPut("{postId:int}")]
        public async Task<IActionResult> Update(int postId, UpdatePostRequest request)
        {
            var result = await _postService.UpdateAsync(postId, request);

            switch (result.StatusCode)
            {
                case 200:
                    {
                        return Ok(result.Data.Post);
                    }
                case 403: return Forbid();
                case 404: return NotFound(result.Message);
                default: return BadRequest(result.Message);
            }
        }

        [HttpDelete("{postId:int}")]
        public async Task<IActionResult> Delete(int postId)
        {
            var result = await _postService.DeleteAsync(postId);

            switch (result.StatusCode)
            {
                case 200:
                    {
                        return Ok(result.Message);
                    }
                case 403: return Forbid();
                case 404: return NotFound(result.Message);
                default: return BadRequest(result.Message);
            }
        }
    }
}