using System.ComponentModel.DataAnnotations;

namespace TeeApp.Models.RequestModels.Messages
{
    public class SendMessageRequest
    {
        [Required(AllowEmptyStrings = false, ErrorMessage = "Please enter message content!")]
        public string Content { get; set; }
    }
}