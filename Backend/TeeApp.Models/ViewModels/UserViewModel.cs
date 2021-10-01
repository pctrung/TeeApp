using System;
using TeeApp.Utilities.Enums.Common;

namespace TeeApp.Models.ViewModels
{
    public class UserViewModel
    {
        public string Id { get; set; }
        public string AvatarUrl { get; set; }
        public string UserName { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string FullName { get; set; }
        public string AboutMe { get; set; }
        public Gender Gender { get; set; }
        public DateTime DateOfBirth { get; set; }
    }
}