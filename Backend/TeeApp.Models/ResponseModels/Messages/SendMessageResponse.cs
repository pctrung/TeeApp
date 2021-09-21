using TeeApp.Models.ResponseModels.Common;
using TeeApp.Models.ViewModels;

namespace TeeApp.Models.ResponseModels.Messages
{
    public class SendMessageResponse : HubResponseBase
    {
        public int ChatId { get; set; }
        public MessageViewModel Message { get; set; }
    }
}