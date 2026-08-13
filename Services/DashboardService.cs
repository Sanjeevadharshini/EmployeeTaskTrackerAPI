using EmployeeTaskTrackerAPI.DAL.Interfaces;
using EmployeeTaskTrackerAPI.DTOs.Dashboard;
using EmployeeTaskTrackerAPI.Services.Interfaces;

namespace EmployeeTaskTrackerAPI.Services
{
    public class DashboardService : IDashboardService
    {
        private readonly IDashboardDAL _dashboardDAL;

        public DashboardService(IDashboardDAL dashboardDAL)
        {
            _dashboardDAL = dashboardDAL;
        }

        public async Task<DashboardResponse> GetDashboardAsync(int currentUserId, string currentUserRole)
        {
            int? assignedTo = null;

            if (!currentUserRole.Equals("Admin", StringComparison.OrdinalIgnoreCase))
            {
                assignedTo = currentUserId;
            }

            var statistics = await _dashboardDAL.GetStatisticsAsync(assignedTo);

            var recentTasks = await _dashboardDAL.GetRecentTasksAsync(assignedTo);

            return new DashboardResponse
            {
                Statistics = statistics,
                RecentTasks = recentTasks
            };
        }
    }
}
