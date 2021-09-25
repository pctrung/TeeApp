using Microsoft.AspNetCore.Http;
using System;
using System.ComponentModel.DataAnnotations;
using TeeApp.Utilities.Enums.Common;

namespace TeeApp.Models.RequestModels.Users
{
    public class UpdateUserRequest
    {
        [MaxLength(50, ErrorMessage = "Maximum character for first name is {1} character")]
        public string FirstName { get; set; }

        [MaxLength(50, ErrorMessage = "Maximum character for last name is {1} character")]
        public string LastName { get; set; }

        public IFormFile Avatar { get; set; }
        public string AboutMe { get; set; }
        public Gender Gender { get; set; }
        public DateTime DateOfBirth { get; set; }
    }
}