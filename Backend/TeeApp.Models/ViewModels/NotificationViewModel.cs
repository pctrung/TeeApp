using TeeApp.Utilities.Enums.Types;

namespace TeeApp.Models.ViewModels
{
    public class NotificationViewModel : ViewModelBase
    {
        public UserViewModel Notifier { get; set; }
        public NotificationType Type { get; set; }
        public PostViewModel Post { get; set; }
        public bool IsRead { get; set; }
        public string NotificationContent { get; set; }
    }
}