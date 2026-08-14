using EmployeeTaskTrackerAPI.DAL.Interfaces;
using EmployeeTaskTrackerAPI.DTOs.Task;
using EmployeeTaskTrackerAPI.Helpers;
using EmployeeTaskTrackerAPI.Models;
using EmployeeTaskTrackerAPI.Services.Interfaces;

namespace EmployeeTaskTrackerAPI.Services
{
    public class TaskService : ITaskService
    {
        private readonly ITaskDAL _taskDAL;

        public TaskService(ITaskDAL taskDAL)
        {
            _taskDAL = taskDAL;
        }

        public async Task<int> CreateAsync(CreateTaskRequest request, int createdBy)
        {
            ValidatePriority(request.Priority);

            return await _taskDAL.CreateAsync(request.Title, request.Description, request.AssignedTo, request.Priority, request.DueDate, createdBy);
        }

        public async Task<PagedResult<TaskModel>> GetAllAsync(TaskFilterRequest request, int currentUserId, string currentUserRole)
        {
            ValidateFilters(request);

            int? assignedTo = null;

            if (!currentUserRole.Equals("Admin", StringComparison.OrdinalIgnoreCase))
            {
                assignedTo = currentUserId;
            }

            int pageNumber = request.PageNumber < 1 ? 1 : request.PageNumber;

            int pageSize = request.PageSize < 1 ? 10 : Math.Min(request.PageSize, 100);

            return await _taskDAL.GetAllAsync(request.Search, request.Status, request.Priority, assignedTo, pageNumber, pageSize);
        }

        public async Task<TaskModel?> GetByIdAsync(int taskId, int currentUserId, string currentUserRole)
        {
            var task = await _taskDAL.GetByIdAsync(taskId);

            if (task == null)
            {
                return null;
            }

            bool isAdmin = currentUserRole.Equals("Admin", StringComparison.OrdinalIgnoreCase);

            if (!isAdmin && task.AssignedTo != currentUserId)
            {
                throw new ForbiddenException("You are not authorized to view this task.");
            }

            return task;
        }

        public async Task<int> UpdateAsync(int taskId, UpdateTaskRequest request, int updatedBy)
        {
            ValidatePriority(request.Priority);

            return await _taskDAL.UpdateAsync(taskId, request.Title, request.Description, request.AssignedTo, request.Priority, request.DueDate, updatedBy);
        }

        public async Task<int> UpdateStatusAsync(int taskId, UpdateTaskStatusRequest request, int updatedBy, string currentUserRole)
        {
            ValidateStatus(request.Status);

            return await _taskDAL.UpdateStatusAsync(taskId, request.Status, updatedBy);
        }

        public async Task<int> DeleteAsync(int taskId, int deletedBy)
        {
            return await _taskDAL.DeleteAsync(taskId, deletedBy);
        }

        private static void ValidatePriority(string priority)
        {
            if (string.IsNullOrWhiteSpace(priority))
            {
                throw new BusinessException("Priority is required.");
            }

            if (!priority.Equals("Low", StringComparison.OrdinalIgnoreCase) &&
                !priority.Equals("High", StringComparison.OrdinalIgnoreCase))
            {
                throw new BusinessException("Priority must be Low or High.");
            }
        }

        private static void ValidateStatus(string status)
        {
            if (string.IsNullOrWhiteSpace(status))
            {
                throw new BusinessException("Status is required.");
            }

            if (!status.Equals("Pending", StringComparison.OrdinalIgnoreCase) &&
                !status.Equals("Completed", StringComparison.OrdinalIgnoreCase))
            {
                throw new BusinessException("Status must be Pending or Completed.");
            }
        }

        private static void ValidateFilters(TaskFilterRequest request)
        {
            if (!string.IsNullOrWhiteSpace(request.Status) &&
                !request.Status.Equals("Pending", StringComparison.OrdinalIgnoreCase) &&
                !request.Status.Equals("Completed", StringComparison.OrdinalIgnoreCase))
            {
                throw new BusinessException("Status must be Pending or Completed.");
            }

            if (!string.IsNullOrWhiteSpace(request.Priority) &&
                !request.Priority.Equals("Low", StringComparison.OrdinalIgnoreCase) &&
                !request.Priority.Equals("High", StringComparison.OrdinalIgnoreCase))
            {
                throw new BusinessException("Priority must be Low or High.");
            }
        }
    }
}
