using System.Security.Claims;

namespace EmployeeTaskTrackerAPI.Helpers
{
    public class CurrentUserHelper
    {
        private readonly IHttpContextAccessor _httpContextAccessor;

        public CurrentUserHelper(IHttpContextAccessor httpContextAccessor)
        {
            _httpContextAccessor = httpContextAccessor;
        }

        public int UserId
        {
            get
            {
                string? userId = _httpContextAccessor.HttpContext?.User.FindFirstValue(ClaimTypes.NameIdentifier);

                if (!int.TryParse(userId, out int id))
                {
                    throw new UnauthorizedAccessException("User identity could not be determined.");
                }

                return id;
            }
        }

        public string? Role
        {
            get
            {
                return _httpContextAccessor.HttpContext?.User.FindFirstValue(ClaimTypes.Role);
            }
        }
    }
}
