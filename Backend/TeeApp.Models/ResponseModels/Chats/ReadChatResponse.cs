using System;
using TeeApp.Models.ResponseModels.Common;

namespace TeeApp.Models.ResponseModels.Chats
{
    public class ReadChatResponse : HubResponseBase
    {
        public int ChatId { get; set; }
        public string ReadByUserName { get; set; }
    }
}