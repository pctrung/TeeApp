using System;
using TeeApp.Utilities.Enums.Types;

namespace TeeApp.Data.Entities
{
    public class Friendship
    {
        public User RequestedUser { get; set; }
        public string RequestedUserId { get; set; }
        public User RecievedUser { get; set; }
        public string RecievedUserId { get; set; }
        public FriendshipType Type { get; set; }
        public DateTime RequestedDate { get; set; }
        public DateTime RespondedDate { get; set; }
    }
}