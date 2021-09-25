using TeeApp.Utilities.Enums.Types;

namespace TeeApp.Models.RequestModels.Posts
{
    public class UpdatePostRequest
    {
        public string Content { get; set; }
        public PrivacyType Privacy { get; set; }
    }
}