namespace TeeApp.Data.Entities
{
    public class PostReport : EntityBase
    {
        public Post ReportedPost { get; set; }
        public string Content { get; set; }
        public bool IsHandled { get; set; }
    }
}