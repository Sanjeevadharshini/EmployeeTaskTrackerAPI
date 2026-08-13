namespace EmployeeTaskTrackerAPI.Models
{
    public class TaskModel
    {
        public int TaskId { get; set; }

        public string Title { get; set; } = string.Empty;

        public string? Description { get; set; }

        public int AssignedTo { get; set; }

        public string AssignedEmployee { get; set; } = string.Empty;

        public string Priority { get; set; } = string.Empty;

        public string Status { get; set; } = string.Empty;

        public DateTime? DueDate { get; set; }

        public bool IsActive { get; set; }

        public DateTime CreatedOn { get; set; }

        public int CreatedBy { get; set; }

        public DateTime? StatusUpdatedOn { get; set; }

        public DateTime? UpdatedOn { get; set; }

        public int? UpdatedBy { get; set; }
    }
}
