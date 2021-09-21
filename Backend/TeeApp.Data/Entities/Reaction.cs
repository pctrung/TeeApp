using TeeApp.Models.Common.Enums;

namespace TeeApp.Data.Entities
{
    public class Reaction : EntityBase
    {
        public ReactionType Type { get; set; }
        public User Creator { get; set; }
        public Post Post { get; set; }
    }
}