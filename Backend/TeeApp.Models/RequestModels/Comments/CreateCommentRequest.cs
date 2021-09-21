using System.ComponentModel.DataAnnotations;

namespace TeeApp.Models.RequestModels.Comments
{
    public class CreateCommentRequest
    {
        [Required(ErrorMessage = "Please enter Post Id")]
        public int PostId { get; set; }

        [Required(AllowEmptyStrings = false, ErrorMessage = "Please enter Post Id")]
        public string Content { get; set; }
    }
}