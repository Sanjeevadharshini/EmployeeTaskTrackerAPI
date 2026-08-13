using EmployeeTaskTrackerAPI.DAL.Interfaces;
using EmployeeTaskTrackerAPI.Models;
using Microsoft.Data.SqlClient;
using System.Data;

namespace EmployeeTaskTrackerAPI.DAL
{
    public class AuthDAL : IAuthDAL
    {
        private readonly IDbConnectionFactory _connectionFactory;

        public AuthDAL(IDbConnectionFactory connectionFactory)
        {
            _connectionFactory = connectionFactory;
        }

        public async Task<User?> LoginAsync(string email)
        {
            using SqlConnection connection = _connectionFactory.CreateConnection();

            using SqlCommand command = new SqlCommand("SP_User_Login", connection);

            command.CommandType = CommandType.StoredProcedure;

            command.Parameters.Add("@Email", SqlDbType.NVarChar, 150).Value = email;

            await connection.OpenAsync();

            using SqlDataReader reader =
                await command.ExecuteReaderAsync();

            if (await reader.ReadAsync())
            {
                return new User
                {
                    UserId = Convert.ToInt32(reader["UserId"]),
                    Name = reader["Name"]?.ToString() ?? string.Empty,
                    Email = reader["Email"]?.ToString() ?? string.Empty,
                    PasswordHash = reader["PasswordHash"]?.ToString() ?? string.Empty,
                    Role = reader["Role"]?.ToString() ?? string.Empty,
                    IsActive = Convert.ToBoolean(reader["IsActive"])
                };
            }

            return null;
        }
    }
}
