using Microsoft.AspNetCore.Http;
using System.ComponentModel.DataAnnotations;

namespace TeeApp.Models.RequestModels.PostPhotos
{
    public class CreatePostPhotoRequest
    {
        [Required(ErrorMessage = "Please enter Post Id")]
        public int PostId { get; set; }

        [Required(ErrorMessage = "Image cannot be null")]
        public IFormFile Image { get; set; }

        public string Caption { get; set; }
    }
}