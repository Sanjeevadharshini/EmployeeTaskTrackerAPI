using System.ComponentModel.DataAnnotations;

namespace EmployeeTaskTrackerAPI.DTOs.Auth
{
    public class LoginRequest
    {
        [Required]
        [EmailAddress]
        [StringLength(150)]
        public string Email { get; set; } = string.Empty;

        [Required]
        public string Password { get; set; } = string.Empty;
    }
}
