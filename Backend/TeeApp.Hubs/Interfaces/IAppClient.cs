using System.Threading.Tasks;
using TeeApp.Models.ResponseModels.Comments;
using TeeApp.Models.ResponseModels.Reactions;
using TeeApp.Models.ViewModels;

namespace TeeApp.Hubs.Interfaces
{
    public interface IAppClient
    {
        Task ReceivePost(PostViewModel post);

        Task ReceiveUpdatedPost(PostViewModel post);

        Task DeletePost(int postId);

        Task ReceiveComment(CommentResponse comment);

        Task ReceiveUpdatedComment(CommentResponse comment);

        Task DeleteComment(int postId, int commentId);

        Task ReceiveReaction(ReactionResponse reaction);

        Task ReceiveUpdatedReaction(ReactionResponse reaction);

        Task DeleteReaction(int postId, int reactionId);

        Task ReceiveNotification(NotificationViewModel notification);
    }
}