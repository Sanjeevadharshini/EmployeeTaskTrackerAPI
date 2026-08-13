using EmployeeTaskTrackerAPI.DAL.Interfaces;
using EmployeeTaskTrackerAPI.DTOs.Employee;
using EmployeeTaskTrackerAPI.Helpers;
using EmployeeTaskTrackerAPI.Models;
using EmployeeTaskTrackerAPI.Services.Interfaces;

namespace EmployeeTaskTrackerAPI.Services
{
    public class EmployeeService : IEmployeeService
    {
        private readonly IEmployeeDAL _employeeDAL;
        private readonly PasswordHelper _passwordHelper;

        public EmployeeService(IEmployeeDAL employeeDAL, PasswordHelper passwordHelper)
        {
            _employeeDAL = employeeDAL;
            _passwordHelper = passwordHelper;
        }

        public async Task<int> CreateAsync(CreateEmployeeRequest request, int createdBy)
        {
            string passwordHash = _passwordHelper.HashPassword(request.Password);

            var existingEmployee = await _employeeDAL.GetByEmailAsync(request.Email, 0);

            if (existingEmployee != null)
            {
                throw new BusinessException("An employee with this email already exists.");
            }

            return await _employeeDAL.CreateAsync(request.Name, request.Email, passwordHash, createdBy);
        }

        public async Task<List<User>> GetAllAsync()
        {
            return await _employeeDAL.GetAllAsync();
        }

        public async Task<User?> GetByIdAsync(int userId)
        {
            return await _employeeDAL.GetByIdAsync(userId);
        }

        public async Task<int> UpdateAsync(int userId, UpdateEmployeeRequest request, int updatedBy)
        {
            var existingEmployee = await _employeeDAL.GetByEmailAsync(request.Email, userId);

            if (existingEmployee != null)
            {
                throw new BusinessException("An employee with this email already exists.");
            }
            return await _employeeDAL.UpdateAsync(userId, request.Name, request.Email, request.IsActive, updatedBy);
        }
    }
}
