using System.Threading.Tasks;
using TeeApp.Data.Entities;
using TeeApp.Models.Common;
using TeeApp.Models.ViewModels;
using TeeApp.Utilities.Enums.Types;

namespace TeeApp.Application.Interfaces
{
    public interface INotificationService
    {
        Task<PagedResult<NotificationViewModel>> GetAllAsync(PagedResultBase request);

        Task ReadNotificationAsync(int id);

        Task<NotificationViewModel> CreateFriendRequestNotificationAsync(string userName);

        Task<NotificationViewModel> CreateFollowNotificationAsync(string userName);

        Task<NotificationViewModel> CreateCommentNotificationAsync(int postId);

        Task<NotificationViewModel> CreateReactionNotificationAsync(int postId, ReactionType reactionType);
    }
}