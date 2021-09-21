using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace TeeApp.Models.RequestModels.Common
{
    public class PaginationRequestBase
    { 
        [DefaultValue(1)]
        [Range(0, int.MaxValue, ErrorMessage = "Only positive number allowed")]
        public virtual int Page { get; set; }

        [DefaultValue(0)]
        [Range(0, int.MaxValue, ErrorMessage = "Only positive number allowed")]
        public int Limit { get; set; }

        [DefaultValue("")]
        public string Keyword { get; set; }
    }
}