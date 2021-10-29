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
        [RegularExpression("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[A-Za-z\\d@$!%*?&]{8,}$",
            ErrorMessage = "Password must be at least 8 characters with an uppercase letter and a number")]
        public string NewPassword { get; set; }

        [Required(ErrorMessage = "Please enter confirmation password")]
        [Compare("NewPassword", ErrorMessage = "Password and Confirmation Password must match")]
        [DataType(DataType.Password)]
        public string ConfirmPassword { get; set; }
    }
}