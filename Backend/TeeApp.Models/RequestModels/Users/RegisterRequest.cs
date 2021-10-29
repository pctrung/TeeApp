using System;
using System.ComponentModel.DataAnnotations;
using TeeApp.Utilities.Enums.Common;

namespace TeeApp.Models.RequestModels.Users
{
    public class RegisterRequest
    {
        [Required(ErrorMessage = "Please enter username")]
        [RegularExpression("^(?=[a-zA-Z0-9._]{6,20}$)(?!.*[_.]{2})[^_.].*[^_.]$",
            ErrorMessage = "Username must be 6-20 characters long, does not contain special characters")]
        public string Username { get; set; }

        [Required(ErrorMessage = "Please enter password")]
        [DataType(DataType.Password)]
        [RegularExpression("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[A-Za-z\\d@$!%*?&]{8,}$",
            ErrorMessage = "Password must be at least 8 characters with an uppercase letter and a number")]
        public string Password { get; set; }

        [Required(ErrorMessage = "Please enter confirmation password")]
        [Compare("Password", ErrorMessage = "Password and Confirmation Password must match")]
        [DataType(DataType.Password)]
        public string ConfirmPassword { get; set; }

        [Required(AllowEmptyStrings = false, ErrorMessage = "Please enter your first name")]
        [MaxLength(50, ErrorMessage = "Maximum character for first name is {1} character")]
        public string FirstName { get; set; }

        [Required(AllowEmptyStrings = false, ErrorMessage = "Please enter your last name")]
        [MaxLength(50, ErrorMessage = "Maximum character for last name is {1} character")]
        public string LastName { get; set; }

        [Required(ErrorMessage = "Please enter email")]
        [DataType(DataType.EmailAddress)]
        [RegularExpression("^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$", ErrorMessage = "Email is invalid")]
        public string Email { get; set; }

        public Gender Gender { get; set; }
        public DateTime DateOfBirth { get; set; }
    }
}