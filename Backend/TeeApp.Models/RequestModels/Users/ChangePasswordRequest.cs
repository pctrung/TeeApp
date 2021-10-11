using System;
using System.ComponentModel.DataAnnotations;
using TeeApp.Utilities.Enums.Common;

namespace TeeApp.Models.RequestModels.Users
{
    public class ChangePasswordRequest
    {
        [Required(ErrorMessage = "Please enter password")]
        public string CurrentPassword { get; set; }

        [Required(ErrorMessage = "Please enter password")]
        [DataType(DataType.Password)]
        // old regex, now use easier regex
        //[RegularExpression("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[#$^+=!*()@%&]).{8,}$",
        //    ErrorMessage = "Passwords must be at least 8 characters, one digit, one uppercase, one non alphanumeric character")]
        [RegularExpression("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{6,}$",
            ErrorMessage = "Passwords must be at least 6 characters, 1 uppercase letter, 1 lowercase letter and 1 number")]
        public string NewPassword { get; set; }

        [Required(ErrorMessage = "Please enter confirmation password")]
        [Compare("NewPassword", ErrorMessage = "Password and Confirmation Password must match")]
        [DataType(DataType.Password)]
        public string ConfirmPassword { get; set; }
    }
}