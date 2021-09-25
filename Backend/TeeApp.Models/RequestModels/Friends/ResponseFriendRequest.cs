using System.ComponentModel.DataAnnotations;
using TeeApp.Utilities.Enums.Types;

namespace TeeApp.Models.RequestModels.Friends
{
    public class ResponseFriendRequest
    {
        [Required(ErrorMessage = "UserName cannot be null")]
        public string UserName { get; set; }

        public FriendshipType Type { get; set; }
    }
}