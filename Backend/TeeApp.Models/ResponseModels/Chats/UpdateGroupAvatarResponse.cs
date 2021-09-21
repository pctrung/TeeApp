using TeeApp.Models.ResponseModels.Common;

namespace TeeApp.Models.ResponseModels.Chats
{
    public class UpdateGroupAvatarResponse : HubResponseBase
    {
        public string GroupAvatarUrl { get; set; }
        public int ChatId { get; set; }
    }
}