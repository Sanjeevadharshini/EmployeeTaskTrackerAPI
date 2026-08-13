namespace EmployeeTaskTrackerAPI.DTOs.Task
{
    public class TaskFilterRequest
    {
        public string? Search { get; set; }

        public string? Status { get; set; }

        public string? Priority { get; set; }
    }
}
