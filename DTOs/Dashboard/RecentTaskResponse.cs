namespace EmployeeTaskTrackerAPI.DTOs.Dashboard
{
    public class RecentTaskResponse
    {
        public int TaskId { get; set; }

        public string Title { get; set; } = string.Empty;

        public string AssignedEmployee { get; set; } = string.Empty;

        public string Priority { get; set; } = string.Empty;

        public string Status { get; set; } = string.Empty;

        public DateTime? DueDate { get; set; }

        public DateTime CreatedOn { get; set; }
        public DateTime? StatusUpdatedOn { get; set; }
    }
}
