using System;

namespace TeeApp.Models.ViewModels
{
    public class FriendshipViewModel
    {
        public UserViewModel User { get; set; }
        public DateTime RequestedDate { get; set; }
        public DateTime ResponsedDate { get; set; }
    }
}