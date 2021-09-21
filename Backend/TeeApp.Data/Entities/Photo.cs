namespace TeeApp.Data.Entities
{
    public class Photo : EntityBase
    {
        public string Caption { get; set; }
        public string ImageFileName { get; set; }
        public Post Post { get; set; }
    }
}