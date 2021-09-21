namespace TeeApp.Data.Entities
{
    public class Comment : EntityBase
    {
        public string Content { get; set; }
        public User Creator { get; set; }
        public Post Post { get; set; }
    }
}