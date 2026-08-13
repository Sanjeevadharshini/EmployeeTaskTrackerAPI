using System.ComponentModel.DataAnnotations;

namespace EmployeeTaskTrackerAPI.DTOs.Task
{
    public class UpdateTaskStatusRequest
    {
        [Required]
        public string Status { get; set; } = string.Empty;
    }
}
