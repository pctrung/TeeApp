using System;
using TeeApp.Utilities.Enums.Common;

namespace TeeApp.Models.ViewModels
{
    public class UserViewModel
    {
        public string Id { get; set; }
        public string AvatarUrl { get; set; }
        public string CoverUrl { get; set; }
        public string UserName { get; set; }
        public string NickName { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string FullName { get; set; }
        public string PhoneNumber { get; set; }
        public string Email { get; set; }
        public string AboutMe { get; set; }
        public Gender Gender { get; set; }
        public DateTime DateOfBirth { get; set; }
        public DateTime DateCreated { get; set; }
        public DateTimeOffset LockoutEnd { get; set; }
    }
}