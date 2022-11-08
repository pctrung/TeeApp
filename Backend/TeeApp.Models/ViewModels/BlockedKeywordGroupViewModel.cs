using System.Collections.Generic;

namespace TeeApp.Models.ViewModels
{
    public class BlockedKeywordGroupViewModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public List<string> Keywords { get; set; }
    }
}