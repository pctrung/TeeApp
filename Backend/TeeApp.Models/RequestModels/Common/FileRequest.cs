using Microsoft.AspNetCore.Http;

namespace TeeApp.Models.RequestModels.Common
{
    public class FileRequest
    {
        public IFormFile File { get; set; }
    }
}