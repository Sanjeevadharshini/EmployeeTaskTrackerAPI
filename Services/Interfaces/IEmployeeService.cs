using EmployeeTaskTrackerAPI.DTOs.Employee;
using EmployeeTaskTrackerAPI.Models;

namespace EmployeeTaskTrackerAPI.Services.Interfaces
{
    public interface IEmployeeService
    {
        Task<int> CreateAsync(CreateEmployeeRequest request, int createdBy);

        Task<PagedResult<User>> GetAllAsync(EmployeeFilterRequest request);

        Task<User?> GetByIdAsync(int userId);

        Task<int> UpdateAsync(int userId, UpdateEmployeeRequest request, int updatedBy);
    }
}
