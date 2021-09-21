using System.Collections.Generic;
using System.Threading.Tasks;
using TeeApp.Models.ResponseModels.Chats;
using TeeApp.Models.ResponseModels.Messages;
using TeeApp.Models.ViewModels;

namespace TeeApp.Hubs.Interfaces
{
    public interface IChatClient
    {
        Task ReceiveMessage(SendMessageResponse message);

        Task ReceiveChat(ChatViewModel chat);

        Task ReceiveUpdatedChat(ChatViewModel chat);

        Task ReceiveUpdatedGroupAvatar(UpdateGroupAvatarResponse response);

        Task ReceiveAddReadByUserName(ReadChatResponse response);

        Task ReceiveUpdatedOnlineUserNameList(List<string> onlineUserNameList);
    }
}