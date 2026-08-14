using EmployeeTaskTrackerAPI.Models;

namespace EmployeeTaskTrackerAPI.DAL.Interfaces
{
    public interface IEmployeeDAL
    {
        Task<User?> GetByEmailAsync(string email, int userId);
        Task<int> CreateAsync(string name, string email, string passwordHash, int createdBy);

        Task<PagedResult<User>> GetAllAsync(int pageNumber, int pageSize);

        Task<User?> GetByIdAsync(int userId);

        Task<int> UpdateAsync(int userId, string name, string email, bool isActive, int updatedBy);
    }
}
