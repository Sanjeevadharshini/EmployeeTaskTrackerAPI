namespace EmployeeTaskTrackerAPI.DTOs.Employee
{
    public class EmployeeFilterRequest
    {
        public int PageNumber { get; set; } = 1;
        
        public int PageSize { get; set; } = 0;
    }
}
