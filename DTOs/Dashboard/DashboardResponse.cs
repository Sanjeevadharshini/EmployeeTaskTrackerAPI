namespace EmployeeTaskTrackerAPI.DTOs.Dashboard
{
    public class DashboardResponse
    {

        public DashboardStatisticsResponse Statistics { get; set; }
            = new();

        public List<RecentTaskResponse> RecentTasks { get; set; }
            = new();
    }
}
