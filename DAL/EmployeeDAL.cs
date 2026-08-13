using EmployeeTaskTrackerAPI.DAL.Interfaces;
using EmployeeTaskTrackerAPI.Models;
using Microsoft.Data.SqlClient;
using System.Data;

namespace EmployeeTaskTrackerAPI.DAL
{
    public class EmployeeDAL : IEmployeeDAL
    {
        private readonly IDbConnectionFactory _connectionFactory;

        public EmployeeDAL(IDbConnectionFactory connectionFactory)
        {
            _connectionFactory = connectionFactory;
        }

        public async Task<User?> GetByEmailAsync(string email, int userId)
        {
            using SqlConnection connection = _connectionFactory.CreateConnection();

            using SqlCommand command = new SqlCommand("SP_Employee_GetByEmail",
                connection);

            command.CommandType = CommandType.StoredProcedure;

            command.Parameters.Add("@Email", SqlDbType.NVarChar, 150).Value = email;
            command.Parameters.Add("@UserId", SqlDbType.Int).Value = userId;

            await connection.OpenAsync();

            using SqlDataReader reader = await command.ExecuteReaderAsync();

            if (!await reader.ReadAsync())
            {
                return null;
            }

            return new User
            {
                UserId = Convert.ToInt32(reader["UserId"]),
                Name = reader["Name"]?.ToString() ?? string.Empty,
                Email = reader["Email"]?.ToString() ?? string.Empty,
                Role = reader["Role"]?.ToString() ?? string.Empty,
                IsActive = Convert.ToBoolean(reader["IsActive"])
            };
        }
        public async Task<int> CreateAsync(string name, string email, string passwordHash, int createdBy)
        {
            using SqlConnection connection = _connectionFactory.CreateConnection();

            using SqlCommand command = new SqlCommand("SP_Employee_Create", connection);

            command.CommandType = CommandType.StoredProcedure;

            command.Parameters.Add("@Name", SqlDbType.NVarChar, 100).Value = name;

            command.Parameters.Add("@Email", SqlDbType.NVarChar, 150).Value = email;

            command.Parameters.Add("@PasswordHash", SqlDbType.NVarChar, 500).Value = passwordHash;

            command.Parameters.Add("@CreatedBy", SqlDbType.Int).Value = createdBy;

            await connection.OpenAsync();

            object? result = await command.ExecuteScalarAsync();

            return Convert.ToInt32(result);
        }

        public async Task<List<User>> GetAllAsync()
        {
            var employees = new List<User>();

            using SqlConnection connection = _connectionFactory.CreateConnection();

            using SqlCommand command = new SqlCommand("SP_Employee_GetAll", connection);

            command.CommandType = CommandType.StoredProcedure;

            await connection.OpenAsync();

            using SqlDataReader reader = await command.ExecuteReaderAsync();

            while (await reader.ReadAsync())
            {
                employees.Add(new User
                {
                    UserId = Convert.ToInt32(reader["UserId"]),

                    Name = reader["Name"]?.ToString() ?? string.Empty,

                    Email = reader["Email"]?.ToString() ?? string.Empty,

                    Role = reader["Role"]?.ToString() ?? string.Empty,

                    IsActive = Convert.ToBoolean(reader["IsActive"])
                });
            }

            return employees;
        }

        public async Task<User?> GetByIdAsync(int userId)
        {
            using SqlConnection connection = _connectionFactory.CreateConnection();

            using SqlCommand command = new SqlCommand("SP_Employee_GetById", connection);

            command.CommandType = CommandType.StoredProcedure;

            command.Parameters.Add("@UserId", SqlDbType.Int).Value = userId;

            await connection.OpenAsync();

            using SqlDataReader reader = await command.ExecuteReaderAsync();

            if (!await reader.ReadAsync())
            {
                return null;
            }

            return new User
            {
                UserId = Convert.ToInt32(reader["UserId"]),

                Name = reader["Name"]?.ToString() ?? string.Empty,

                Email = reader["Email"]?.ToString() ?? string.Empty,

                Role = reader["Role"]?.ToString() ?? string.Empty,

                IsActive = Convert.ToBoolean(reader["IsActive"])
            };
        }

        public async Task<int> UpdateAsync(int userId, string name, string email, bool isActive, int updatedBy)
        {
            using SqlConnection connection = _connectionFactory.CreateConnection();

            using SqlCommand command = new SqlCommand("SP_Employee_Update", connection);

            command.CommandType = CommandType.StoredProcedure;

            command.Parameters.Add("@UserId", SqlDbType.Int).Value = userId;

            command.Parameters.Add("@Name", SqlDbType.NVarChar, 100).Value = name;

            command.Parameters.Add("@Email", SqlDbType.NVarChar, 150).Value = email;

            command.Parameters.Add("@IsActive", SqlDbType.Bit).Value = isActive;

            command.Parameters.Add("@UpdatedBy", SqlDbType.Int).Value = updatedBy;

            await connection.OpenAsync();

            object? result = await command.ExecuteScalarAsync();

            return Convert.ToInt32(result);
        }
    }
}
