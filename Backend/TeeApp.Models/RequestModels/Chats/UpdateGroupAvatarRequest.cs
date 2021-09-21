using Microsoft.AspNetCore.Http;
using System.ComponentModel.DataAnnotations;

namespace TeeApp.Models.RequestModels.Chats
{
    public class UpdateGroupAvatarRequest
    {
        [Required(ErrorMessage = "Please upload avatar file")]
        public IFormFile Avatar { get; set; }
    }
}