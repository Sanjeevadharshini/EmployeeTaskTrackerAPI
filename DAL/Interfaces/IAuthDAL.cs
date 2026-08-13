using EmployeeTaskTrackerAPI.Models;

namespace EmployeeTaskTrackerAPI.DAL.Interfaces
{
    public interface IAuthDAL
    {
        Task<User?> LoginAsync(string email);

    }
}
