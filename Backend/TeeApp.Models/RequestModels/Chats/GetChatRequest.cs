using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using TeeApp.Models.RequestModels.Common;

namespace TeeApp.Models.RequestModels.Chats
{
    public class GetChatRequest : PaginationRequestBase
    {
        [Required]
        [DefaultValue(2)]
        [Range(1, int.MaxValue, ErrorMessage = "Only positive number allowed")]
        public override int Page { get; set; }
    }
}