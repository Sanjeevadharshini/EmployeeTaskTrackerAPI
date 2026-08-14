using EmployeeTaskTrackerAPI.DTOs.Task;
using EmployeeTaskTrackerAPI.Models;

namespace EmployeeTaskTrackerAPI.Services.Interfaces
{
    public interface ITaskService
    {
        Task<int> CreateAsync(CreateTaskRequest request, int createdBy);

        Task<PagedResult<TaskModel>> GetAllAsync(TaskFilterRequest request, int currentUserId, string currentUserRole);

        Task<TaskModel?> GetByIdAsync(int taskId, int currentUserId, string currentUserRole);

        Task<int> UpdateAsync(int taskId, UpdateTaskRequest request, int updatedBy);

        Task<int> UpdateStatusAsync(int taskId, UpdateTaskStatusRequest request, int updatedBy, string currentUserRole);

        Task<int> DeleteAsync(int taskId, int deletedBy);
    }
}
