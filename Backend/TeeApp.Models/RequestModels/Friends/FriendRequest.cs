using System.ComponentModel.DataAnnotations;

namespace TeeApp.Models.RequestModels.Friends
{
    public class FriendRequest
    {
        [Required(ErrorMessage = "UserName cannot be null")]
        public string UserName { get; set; }
    }
}