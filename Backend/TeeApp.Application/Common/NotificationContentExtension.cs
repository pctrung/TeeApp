using TeeApp.Data.Entities;
using TeeApp.Utilities.Enums.Types;

namespace TeeApp.Application.Common
{
    public static class NotificationContentExtension
    {
        public static string GetNotificationContent(this Notification source)
        {
            string content = source.Type switch
            {
                NotificationType.Follow => $"{source.Creator.FullName} has started following you.",
                NotificationType.FriendRequest => $"{source.Creator.FullName} sent you a friend request.",
                NotificationType.AcceptedFriendRequest => $"{source.Creator.FullName} accepted your friend request.",
                NotificationType.Comment => (source.Creator.Id.Equals(source.Recipient.Id) ? "You" : source.Creator.FullName) + " commented on your post.",
                _ => (source.Creator.Id.Equals(source.Recipient.Id) ? "You" : source.Creator.FullName) + " reacted to your post.",
            };

            return content;
        }
    }
}