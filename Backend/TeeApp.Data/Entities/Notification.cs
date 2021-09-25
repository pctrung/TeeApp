using System.Collections.Generic;
using TeeApp.Utilities.Enums.Types;

namespace TeeApp.Data.Entities
{
    public class Notification : EntityBase
    {
        public User Creator { get; set; }
        public List<User> Notifiers { get; set; }
        public NotificationType Type { get; set; }
        public Post Post { get; set; }
        public bool IsRead { get; set; }
    }
}