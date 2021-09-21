using System.Collections.Generic;
using TeeApp.Models.Common.Enums;

namespace TeeApp.Data.Entities
{
    public class Post : EntityBase
    {
        public string Content { get; set; }
        public User Creator { get; set; }
        public List<Comment> Comments { get; set; }
        public List<Reaction> Reactions { get; set; }
        public List<Photo> Photos { get; set; }
        public PrivacyType Privacy { get; set; }
    }
}