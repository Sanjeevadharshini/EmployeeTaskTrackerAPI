using System.ComponentModel.DataAnnotations;

namespace EmployeeTaskTrackerAPI.DTOs.Employee
{
    public class UpdateEmployeeRequest
    {
        [Required]
        [StringLength(100)]
        public string Name { get; set; } = string.Empty;

        [Required]
        [EmailAddress]
        [StringLength(150)]
        public string Email { get; set; } = string.Empty;

        public bool IsActive { get; set; }
    }
}
