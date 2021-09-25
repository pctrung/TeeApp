using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using TeeApp.Utilities.Enums.Types;

namespace TeeApp.Models.RequestModels.Reactions
{
    public class ReactionRequest
    {
        [DefaultValue(ReactionType.Like)]
        public ReactionType Type { get; set; }
    }
}