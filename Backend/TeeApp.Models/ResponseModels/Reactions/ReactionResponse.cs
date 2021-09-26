using TeeApp.Models.ResponseModels.Common;
using TeeApp.Models.ViewModels;

namespace TeeApp.Models.ResponseModels.Reactions
{
    public class ReactionResponse : HubResponseBase
    {
        public int PostId { get; set; }
        public string PostCreatorUserName { get; set; }
        public ReactionViewModel Reaction { get; set; }
    }
}