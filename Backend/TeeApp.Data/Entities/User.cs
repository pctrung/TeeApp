using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using TeeApp.Utilities.Enums.Common;

namespace TeeApp.Data.Entities
{
    public class User : IdentityUser
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string FullName { get => $"{LastName} {FirstName}"; }
        public string AvatarFileName { get; set; }
        public string CoverFileName { get; set; }
        public string AboutMe { get; set; }
        public string NickName { get; set; } 
        public Gender Gender { get; set; }
        public DateTime DateOfBirth { get; set; }
        public DateTime DateCreated { get; set; }
        public List<Chat> CreatedChats { get; set; }
        public List<Chat> JoinedChats { get; set; }
        public List<Message> SentMessages { get; set; }
        public List<Message> ReadMessages { get; set; }
        public List<Post> Posts { get; set; }
        public List<Comment> Comments { get; set; }
        public List<Reaction> Reactions { get; set; }
        public List<User> Followers { get; set; }
        public List<User> Following { get; set; }
        public List<User> BlockedUsers { get; set; }
        public List<User> BlockedByUsers { get; set; }
        public List<Notification> Notifications { get; set; }
    }
}