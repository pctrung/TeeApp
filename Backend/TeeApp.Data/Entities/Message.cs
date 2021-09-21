using System;
using System.Collections.Generic;

namespace TeeApp.Data.Entities
{
    public class Message : EntityBase
    {
        public string Content { get; set; }
        public string ImageFileName { get; set; }
        public User Sender { get; set; }
        public Chat Chat { get; set; }
        public List<User> ReadByUsers { get; set; }
    }
}