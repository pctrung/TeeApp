using System;
using System.Collections.Generic;
using TeeApp.Models.Common;
using TeeApp.Utilities.Enums.Types;

namespace TeeApp.Models.ViewModels
{
    public class ChatViewModel : PagedResultBase
    {
        public int Id { get; set; }
        public string GroupAvatarUrl { get; set; }
        public string Name { get; set; }
        public ChatType Type { get; set; }
        public string CreatorUserName { get; set; }
        public string CreatorFullName { get; set; }
        public virtual List<UserViewModel> Participants { get; set; }
        public virtual List<MessageViewModel> Messages { get; set; }
        public DateTime DateCreated { get; set; }
        public int NumOfUnreadMessages { get; set; }
        public List<string> ReadByUserNames { get; set; }
    }
}