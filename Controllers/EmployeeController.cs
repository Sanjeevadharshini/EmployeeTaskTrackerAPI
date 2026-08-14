using EmployeeTaskTrackerAPI.DTOs.Employee;
using EmployeeTaskTrackerAPI.Helpers;
using EmployeeTaskTrackerAPI.Services.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace EmployeeTaskTrackerAPI.Controllers
{
    [Authorize(Roles = "Admin")]
    [Route("api/[controller]")]
    [ApiController]
    public class EmployeeController : ControllerBase
    {
        private readonly IEmployeeService _employeeService;
        private readonly CurrentUserHelper _currentUser;

        public EmployeeController(IEmployeeService employeeService, CurrentUserHelper currentUser)
        {
            _employeeService = employeeService;
            _currentUser = currentUser;
        }

        [HttpPost]
        public async Task<IActionResult> Create([FromBody] CreateEmployeeRequest request)
        {
            int createdBy = _currentUser.UserId;

            int userId = await _employeeService.CreateAsync(request, createdBy);

            return Ok(new
            {
                success = true,
                message = "Employee created successfully.",
                userId
            });
        }

        [HttpGet]
        public async Task<IActionResult> GetAll([FromQuery] EmployeeFilterRequest request)
        {
            var result = await _employeeService.GetAllAsync(request);

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
            var employee = await _employeeService.GetByIdAsync(id);

            if (employee == null)
            {
                return NotFound(new
                {
                    success = false,
                    message = "Employee not found."
                });
            }

            return Ok(new
            {
                success = true,
                data = employee
            });
        }

        [HttpPut("{id:int}")]
        public async Task<IActionResult> Update(int id, [FromBody] UpdateEmployeeRequest request)
        {
            int updatedBy = _currentUser.UserId;

            int userId =
                await _employeeService.UpdateAsync(id, request, updatedBy);

            return Ok(new
            {
                success = true,
                message = "Employee updated successfully.",
                userId
            });
        }
    }
}
