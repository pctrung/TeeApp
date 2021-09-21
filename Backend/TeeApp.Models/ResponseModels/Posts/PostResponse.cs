using TeeApp.Models.ResponseModels.Common;
using TeeApp.Models.ViewModels;

namespace TeeApp.Models.ResponseModels.Posts
{
    public class PostResponse : HubResponseBase
    {
        public PostViewModel Post { get; set; }
    }
}