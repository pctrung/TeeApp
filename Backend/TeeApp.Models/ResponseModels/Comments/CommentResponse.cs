using TeeApp.Models.ResponseModels.Common;
using TeeApp.Models.ViewModels;

namespace TeeApp.Models.ResponseModels.Comments
{
    public class CommentResponse : HubResponseBase
    {
        public int PostId { get; set; }
        public string PostCreatorUserName { get; set; }
        public CommentViewModel Comment { get; set; }
    }
}