namespace EmployeeTaskTrackerAPI.DTOs.Dashboard
{
    public class DashboardStatisticsResponse
    {
        public int TotalTasks { get; set; }

        public int PendingTasks { get; set; }

        public int CompletedTasks { get; set; }

        public int HighPriorityTasks { get; set; }
    }
}
