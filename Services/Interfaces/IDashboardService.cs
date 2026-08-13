using EmployeeTaskTrackerAPI.DTOs.Dashboard;

namespace EmployeeTaskTrackerAPI.Services.Interfaces
{
    public interface IDashboardService
    {
        Task<DashboardResponse> GetDashboardAsync(int currentUserId, string currentUserRole);
    }
}
