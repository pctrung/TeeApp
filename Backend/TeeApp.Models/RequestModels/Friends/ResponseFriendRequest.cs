using System.ComponentModel.DataAnnotations;
using TeeApp.Models.Common.Enums;

namespace TeeApp.Models.RequestModels.Friends
{
    public class ResponseFriendRequest
    {
        [Required(ErrorMessage = "UserName cannot be null")]
        public string UserName { get; set; }

        public FriendshipType Type { get; set; }
    }
}