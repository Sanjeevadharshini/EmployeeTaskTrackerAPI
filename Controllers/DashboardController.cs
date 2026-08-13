using EmployeeTaskTrackerAPI.Helpers;
using EmployeeTaskTrackerAPI.Services.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace EmployeeTaskTrackerAPI.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class DashboardController : ControllerBase
    {
        private readonly IDashboardService _dashboardService;
        private readonly CurrentUserHelper _currentUser;

        public DashboardController(IDashboardService dashboardService, CurrentUserHelper currentUser)
        {
            _dashboardService = dashboardService;
            _currentUser = currentUser;
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            int currentUserId = _currentUser.UserId;

            string currentUserRole = _currentUser.Role ?? string.Empty;

            var dashboard = await _dashboardService.GetDashboardAsync(currentUserId, currentUserRole);

            return Ok(new
            {
                success = true,
                data = dashboard
            });
        }
    }
}
