using System.ComponentModel.DataAnnotations;

namespace TeeApp.Models.RequestModels.Chats
{
    public class CreatePrivateChatRequest
    {
        [Required(ErrorMessage = "Please select a member to start!")]
        public string ParticipantUserName { get; set; }
    }
}