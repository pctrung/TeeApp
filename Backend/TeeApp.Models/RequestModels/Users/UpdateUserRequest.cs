using Microsoft.AspNetCore.Http;
using System;
using System.ComponentModel.DataAnnotations;
using TeeApp.Utilities.Enums.Common;

namespace TeeApp.Models.RequestModels.Users
{
    public class UpdateUserRequest
    {
        [MaxLength(30, ErrorMessage = "Maximum character for first name is {1} character")]
        public string FirstName { get; set; }

        [MaxLength(30, ErrorMessage = "Maximum character for last name is {1} character")]
        public string LastName { get; set; }

        [MaxLength(20, ErrorMessage = "Maximum character for nickname is {1} character")]
        public string NickName { get; set; }

        [MaxLength(150, ErrorMessage = "Maximum character for about me is {1} character")]
        public string AboutMe { get; set; }

        [MaxLength(10, ErrorMessage = "Maximum character for phone number is {1} character")]
        public string PhoneNumber { get; set; }

        [DataType(DataType.EmailAddress)]
        [RegularExpression("^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$", ErrorMessage = "Email is invalid")]
        public string Email { get; set; }

        public Gender Gender { get; set; }
        public DateTime DateOfBirth { get; set; }
    }
}