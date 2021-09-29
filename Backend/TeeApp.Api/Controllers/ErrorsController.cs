using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Diagnostics;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using TeeApp.Utilities.Exceptions;

namespace TeeApp.Api.Controllers
{
    [AllowAnonymous]
    [ApiExplorerSettings(IgnoreApi = true)]
    public class ErrorsController : ControllerBase
    {
        [Route("error")]
        public ActionResult Error()
        {
            var context = HttpContext.Features.Get<IExceptionHandlerFeature>();
            var exception = context.Error; // Your exception

            return exception switch
            {
                TeeAppNotFoundException => NotFound(exception.Message),
                TeeAppUnauthException => Unauthorized(exception.Message),
                TeeAppForBidException => Forbid(),
                TeeAppException => BadRequest(exception.Message),
                _ => StatusCode(StatusCodes.Status500InternalServerError, exception.Message)
            };
        }
    }
}