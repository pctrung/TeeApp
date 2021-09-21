﻿using System.Collections.Generic;
using TeeApp.Models.Common.Enums;

namespace TeeApp.Models.ViewModels
{
    public class PostViewModel : ViewModelBase
    {
        public string Content { get; set; }
        public List<CommentViewModel> Comments { get; set; }
        public List<ReactionViewModel> Reactions { get; set; }
        public List<PhotoViewModel> Photos { get; set; }
        public PrivacyType Privacy { get; set; }
    }
}