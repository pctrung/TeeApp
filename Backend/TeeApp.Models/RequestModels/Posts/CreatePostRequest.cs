using System.ComponentModel;
using TeeApp.Utilities.Enums.Types;

namespace TeeApp.Models.RequestModels.Posts
{
    public class CreatePostRequest
    {
        public string Content { get; set; }

        public PrivacyType Privacy { get; set; }
    }
}