using EmployeeTaskTrackerAPI.DTOs.Task;
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
    public class TasksController : ControllerBase
    {
        private readonly ITaskService _taskService;
        private readonly CurrentUserHelper _currentUser;

        public TasksController(ITaskService taskService, CurrentUserHelper currentUser)
        {
            _taskService = taskService;
            _currentUser = currentUser;
        }

        [HttpPost]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Create([FromBody] CreateTaskRequest request)
        {
            int createdBy = _currentUser.UserId;

            int taskId =
                await _taskService.CreateAsync(request, createdBy);

            return Ok(new
            {
                success = true,
                message = "Task created successfully.",
                taskId
            });
        }

        [HttpGet]
        public async Task<IActionResult> GetAll([FromQuery] TaskFilterRequest request)
        {
            int currentUserId = _currentUser.UserId;

            string currentUserRole = _currentUser.Role ?? string.Empty;

            var result = await _taskService.GetAllAsync(request, currentUserId, currentUserRole);

            return Ok(new
            {
                success = true,
                data = result.Items,
                totalCount = result.TotalCount,
                pageNumber = result.PageNumber,
                pageSize = result.PageSize,
                totalPages = result.TotalPages
            });
        }

        [HttpGet("{id:int}")]
        public async Task<IActionResult> GetById(int id)
        {
            int currentUserId = _currentUser.UserId;

            string currentUserRole = _currentUser.Role ?? string.Empty;

            var task = await _taskService.GetByIdAsync(id, currentUserId, currentUserRole);

            if (task == null)
            {
                return NotFound(new
                {
                    success = false,
                    message = "Task not found."
                });
            }

            return Ok(new
            {
                success = true,
                data = task
            });
        }

        [HttpPut("{id:int}")]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Update(int id, [FromBody] UpdateTaskRequest request)
        {
            int updatedBy = _currentUser.UserId;

            int taskId = await _taskService.UpdateAsync(id, request, updatedBy);

            return Ok(new
            {
                success = true,
                message = "Task updated successfully.",
                taskId
            });
        }

        [Authorize(Roles = "Employee")]
        [HttpPatch("{id:int}/status")]
        public async Task<IActionResult> UpdateStatus(int id, [FromBody] UpdateTaskStatusRequest request)
        {
            int updatedBy = _currentUser.UserId;

            string currentUserRole = _currentUser.Role ?? string.Empty;

            int taskId =
                await _taskService.UpdateStatusAsync(id, request, updatedBy, currentUserRole);

            return Ok(new
            {
                success = true,
                message = "Task status updated successfully.",
                taskId
            });
        }

        [HttpDelete("{id:int}")]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Delete(int id)
        {
            int deletedBy = _currentUser.UserId;

            int taskId = await _taskService.DeleteAsync(id, deletedBy);

            return Ok(new
            {
                success = true,
                message = "Task deleted successfully.",
                taskId
            });
        }
    }
}
