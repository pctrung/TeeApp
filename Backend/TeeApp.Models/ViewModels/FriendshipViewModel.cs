using System;
using TeeApp.Utilities.Enums.Types;

namespace TeeApp.Models.ViewModels
{
    public class FriendshipViewModel
    {
        public UserViewModel User { get; set; }
        public DateTime RequestedDate { get; set; }
        public DateTime RespondedDate { get; set; }
        public FriendshipType Type { get; set; }
        public bool IsFollowing { get; set; }
    }
}