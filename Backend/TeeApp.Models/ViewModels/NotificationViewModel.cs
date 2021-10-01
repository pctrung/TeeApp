using TeeApp.Utilities.Enums.Types;

namespace TeeApp.Models.ViewModels
{
    public class NotificationViewModel : ViewModelBase
    { 
        public NotificationType Type { get; set; }
        public string RecipientUserName { get; set; }
        public int PostId { get; set; }
        public bool IsRead { get; set; }
        public string Content { get; set; }
        public ReactionType ReactionType { get; set; }
    }
}