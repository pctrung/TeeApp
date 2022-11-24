using System.Collections.Generic;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using TeeApp.Application.Interfaces;
using TeeApp.Models.Common;
using TeeApp.Models.RequestModels.BlockedKeywords;
using TeeApp.Models.RequestModels.PostReport;
using TeeApp.Models.ViewModels;

namespace TeeApp.Api.Controllers
{
    [Authorize]
    [ApiController]
    [Route("api/[controller]")]
    public class PostReportsController : ControllerBase
    {
        private readonly IPostReportService _postReportService;

        public PostReportsController(IPostReportService postReportService)
        {
            _postReportService = postReportService;

        }
        
        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<ActionResult<List<BlockedKeywordGroupViewModel>>> GetAll()
        {
            var result = await _postReportService.GetAllAsync();
            return Ok(JsonConvert.SerializeObject(result, Formatting.Indented,
                new JsonSerializerSettings
                {
                    ReferenceLoopHandling = ReferenceLoopHandling.Ignore,
                    ContractResolver = new CamelCasePropertyNamesContractResolver()
                }
            ));
        }
        
        [HttpPost]
        public async Task<IActionResult> Add(ReportPostRequest request)
        {
            var result = await _postReportService.AddAsync(request);

            switch (result.StatusCode)
            {
                case 200: return Ok(result.Data);
                case 403: return Forbid();
                case 404: return NotFound(result.Message);
                default: return BadRequest(result.Message);
            }
        }

        [HttpPut]
        public async Task<IActionResult> Update(UpdatePostReportRequest request)
        {
            var result = await _postReportService.UpdateAsync(request);

            switch (result.StatusCode)
            {
                case 200: return Ok(result.Data);
                case 403: return Forbid();
                case 404: return NotFound(result.Message);
                default: return BadRequest(result.Message);
            }
        }
    }
}