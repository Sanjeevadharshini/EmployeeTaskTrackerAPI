using Microsoft.Data.SqlClient;

namespace EmployeeTaskTrackerAPI.DAL.Interfaces
{
    public interface IDbConnectionFactory
    {
        SqlConnection CreateConnection();

    }
}
