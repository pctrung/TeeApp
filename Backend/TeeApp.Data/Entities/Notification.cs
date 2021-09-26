using TeeApp.Utilities.Enums.Types;

namespace TeeApp.Data.Entities
{
    public class Notification : EntityBase
    {
        public User Creator { get; set; }
        public User Recipient { get; set; }
        public NotificationType Type { get; set; }
        public Post Post { get; set; }
        public bool IsRead { get; set; }
        public ReactionType ReactionType { get; set; }
    }
}