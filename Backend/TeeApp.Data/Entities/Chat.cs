using System.Collections.Generic;
using TeeApp.Utilities.Enums.Types;

namespace TeeApp.Data.Entities
{
    public class Chat : EntityBase
    {
        public string Name { get; set; }
        public User Creator { get; set; }
        public string AvatarFileName { get; set; }
        public ChatType Type { get; set; }
        public List<User> Participants { get; set; }
        public List<Message> Messages { get; set; }
    }
}