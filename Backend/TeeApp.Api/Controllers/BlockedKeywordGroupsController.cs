using System.Collections.Generic;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using TeeApp.Application.Interfaces;
using TeeApp.Models.Common;
using TeeApp.Models.RequestModels.BlockedKeywords;
using TeeApp.Models.ViewModels;

namespace TeeApp.Api.Controllers
{
    [Authorize]
    [ApiController]
    [Route("api/[controller]")]
    public class BlockedKeywordGroupsController : ControllerBase
    {
        private readonly IBlockedKeywordGroupService _blockedKeywordGroupService;

        public BlockedKeywordGroupsController(IBlockedKeywordGroupService blockedKeywordGroupService)
        {
            _blockedKeywordGroupService = blockedKeywordGroupService;

        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<ActionResult<List<BlockedKeywordGroupViewModel>>> GetAll()
        {
            var result = await _blockedKeywordGroupService.GetAllAsync();
            return Ok(result);
        }

        [HttpPut]
        public async Task<IActionResult> Update(BlockedKeywordGroupRequest request)
        {
            var result = await _blockedKeywordGroupService.UpdateAsync(request);

            switch (result.StatusCode)
            {
                case 200: return Ok(result.Data);
                case 403: return Forbid();
                case 404: return NotFound(result.Message);
                default: return BadRequest(result.Message);
            }
        }
        [HttpDelete("{id:int}")]
        public async Task<IActionResult> Delete(int id)
        {
            var result = await _blockedKeywordGroupService.DeleteAsync(id);

            switch (result.StatusCode)
            {
                case 200: return Ok();
                case 403: return Forbid();
                case 404: return NotFound(result.Message);
                default: return BadRequest(result.Message);
            }
        }
    }
}