using EmployeeTaskTrackerAPI.DTOs.Auth;

namespace EmployeeTaskTrackerAPI.Services.Interfaces
{
    public interface IAuthService
    {
        Task<LoginResponse> LoginAsync(LoginRequest request);
    }
}
