using System.ComponentModel.DataAnnotations;

namespace TeeApp.Models.RequestModels.Comments
{
    public class CommentRequest
    {
        [Required(AllowEmptyStrings = false, ErrorMessage = "Please enter comment")]
        public string Content { get; set; }
    }
}