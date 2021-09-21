﻿using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using TeeApp.Models.Common.Enums;

namespace TeeApp.Models.RequestModels.Reactions
{
    public class CreateReactionRequest
    {
        [Required(ErrorMessage = "Please enter Post Id")]
        public int PostId { get; set; }

        [DefaultValue(ReactionType.Like)]
        public ReactionType Type { get; set; }
    }
}