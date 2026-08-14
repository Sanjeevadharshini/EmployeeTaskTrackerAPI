using EmployeeTaskTrackerAPI.Models;

namespace EmployeeTaskTrackerAPI.DAL.Interfaces
{
    public interface ITaskDAL
    {
        Task<int> CreateAsync(string title, string? description, int assignedTo, string priority, DateTime? dueDate, int createdBy);

        Task<PagedResult<TaskModel>> GetAllAsync(string? search, string? status, string? priority, int? assignedTo, int pageNumber, int pageSize);

        Task<TaskModel?> GetByIdAsync(int taskId);

        Task<int> UpdateAsync(int taskId, string title, string? description, int assignedTo, string priority, DateTime? dueDate, int updatedBy);

        Task<int> UpdateStatusAsync(int taskId, string status, int updatedBy);

        Task<int> DeleteAsync(int taskId, int deletedBy);
    }
}
