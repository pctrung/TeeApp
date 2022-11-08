using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace TeeApp.Data.Entities
{
    public class BlockedKeywordGroup : EntityBase
    {
        public string Name { get; set; }
        public string Keywords { get; set; }
    }
}