namespace EmployeeTaskTrackerAPI.Helpers
{
    public class ForbiddenException : Exception
    {
        public ForbiddenException(string message)
            : base(message)
        {
        }
    }
}
