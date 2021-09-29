using System.Threading.Tasks;
using TeeApp.Models.Common;
using TeeApp.Models.RequestModels.Common;
using TeeApp.Models.ViewModels;
using TeeApp.Utilities.Enums.Types;

namespace TeeApp.Application.Interfaces
{
    public interface INotificationService
    {
        Task<PagedResult<NotificationViewModel>> GetAllAsync(PaginationRequestBase request);

        Task ReadByIdAsync(int id);

        Task ReadAllAsync();

        Task<NotificationViewModel> CreateFriendRequestNotificationAsync(string userName);

        Task<NotificationViewModel> CreateAcceptedFriendRequestNotificationAsync(string userName);

        Task<NotificationViewModel> CreateFollowNotificationAsync(string userName);

        Task<NotificationViewModel> CreateCommentNotificationAsync(int postId);

        Task<NotificationViewModel> CreateReactionNotificationAsync(int postId, ReactionType reactionType);
    }
}