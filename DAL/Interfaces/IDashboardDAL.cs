using EmployeeTaskTrackerAPI.DTOs.Dashboard;

namespace EmployeeTaskTrackerAPI.DAL.Interfaces
{
    public interface IDashboardDAL
    {
        Task<DashboardStatisticsResponse> GetStatisticsAsync(int? assignedTo);

        Task<List<RecentTaskResponse>> GetRecentTasksAsync(int? assignedTo);
    }
}
