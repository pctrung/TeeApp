using TeeApp.Models.ResponseModels.Common;
using TeeApp.Models.ViewModels;

namespace TeeApp.Models.ResponseModels.Chats
{
    public class CreateChatResponse : HubResponseBase
    {
        public ChatViewModel Chat { get; set; }
    }
}