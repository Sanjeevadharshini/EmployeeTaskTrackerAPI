using System.ComponentModel.DataAnnotations;

namespace EmployeeTaskTrackerAPI.DTOs.Task
{
    public class CreateTaskRequest
    {
        [Required]
        [StringLength(200)]
        public string Title { get; set; } = string.Empty;

        public string? Description { get; set; }

        [Range(1, int.MaxValue)]
        public int AssignedTo { get; set; }

        [Required]
        public string Priority { get; set; } = string.Empty;

        public DateTime? DueDate { get; set; }
    }
}
