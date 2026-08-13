namespace EmployeeTaskTrackerAPI.Helpers
{
    public class BusinessException : Exception
    {
        public BusinessException(string message)
            : base(message)
        {
        }
    }
}
