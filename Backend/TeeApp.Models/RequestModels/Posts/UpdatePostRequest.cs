using TeeApp.Models.Common.Enums;

namespace TeeApp.Models.RequestModels.Posts
{
    public class UpdatePostRequest
    {
        public int Id { get; set; }
        public string Content { get; set; }
        public PrivacyType Privacy { get; set; }
    }
}