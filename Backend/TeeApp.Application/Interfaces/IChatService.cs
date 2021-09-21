using System.Collections.Generic;
using System.Threading.Tasks;
using TeeApp.Models.Common;
using TeeApp.Models.RequestModels.Chats;
using TeeApp.Models.RequestModels.Messages;
using TeeApp.Models.ResponseModels.Chats;
using TeeApp.Models.ResponseModels.Messages;
using TeeApp.Models.ViewModels;

namespace TeeApp.Application.Interfaces
{
    public interface IChatService
    {
        Task<ApiResult<SendMessageResponse>> AddMessageAsync(int chatId, SendMessageRequest request);

        Task<ApiResult<SendMessageResponse>> AddImageAsync(int chatId, SendImageRequest request);

        Task<ApiResult<CreateChatResponse>> CreateGroupChatAsync(CreateGroupChatRequest request);

        Task<ApiResult<CreateChatResponse>> UpdateGroupChatAsync(int chatId, UpdateGroupChatRequest request);

        Task<ApiResult<UpdateGroupAvatarResponse>> UpdateGroupAvatarAsync(int chatId, UpdateGroupAvatarRequest request);

        Task<ApiResult<CreateChatResponse>> CreatePrivateChatAsync(CreatePrivateChatRequest request);

        Task<ApiResult<List<ChatViewModel>>> GetAllAsync();

        Task<ApiResult<ChatViewModel>> GetByIdAsync(int chatId, GetChatRequest request);

        Task<ApiResult<ReadChatResponse>> ReadChatAsync(int chatId);
    }
}