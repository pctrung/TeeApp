using System.Collections.Generic;

namespace TeeApp.Models.RequestModels.BlockedKeywords
{
    public class BlockedKeywordGroupRequest
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public List<string> Keywords { get; set; }
    }
}