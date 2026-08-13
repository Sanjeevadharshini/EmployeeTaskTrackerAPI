using EmployeeTaskTrackerAPI.DAL.Interfaces;
using EmployeeTaskTrackerAPI.DTOs.Auth;
using EmployeeTaskTrackerAPI.Helpers;
using EmployeeTaskTrackerAPI.Services.Interfaces;

namespace EmployeeTaskTrackerAPI.Services
{
    public class AuthService : IAuthService
    {
        private readonly IAuthDAL _authDAL;
        private readonly PasswordHelper _passwordHelper;
        private readonly JwtHelper _jwtHelper;

        public AuthService(IAuthDAL authDAL, PasswordHelper passwordHelper, JwtHelper jwtHelper)
        {
            _authDAL = authDAL;
            _passwordHelper = passwordHelper;
            _jwtHelper = jwtHelper;
        }

        public async Task<LoginResponse> LoginAsync(LoginRequest request)
        {
            var user = await _authDAL.LoginAsync(request.Email);

            if (user == null)
            {
                return new LoginResponse
                {
                    Success = false,
                    Message = "Invalid email or password."
                };
            }

            bool passwordValid = _passwordHelper.VerifyPassword(request.Password, user.PasswordHash);

            if (!passwordValid)
            {
                return new LoginResponse
                {
                    Success = false,
                    Message = "Invalid email or password."
                };
            }

            string token = _jwtHelper.GenerateToken(user);

            return new LoginResponse
            {
                Success = true,
                Message = "Login successful.",
                Token = token,
                UserId = user.UserId,
                Name = user.Name,
                Email = user.Email,
                Role = user.Role
            };
        }
    }
}
