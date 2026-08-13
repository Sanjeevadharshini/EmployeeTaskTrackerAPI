using EmployeeTaskTrackerAPI.DAL.Interfaces;
using EmployeeTaskTrackerAPI.DTOs.Dashboard;
using Microsoft.Data.SqlClient;
using System.Data;

namespace EmployeeTaskTrackerAPI.DAL
{
    public class DashboardDAL : IDashboardDAL
    {
        private readonly IDbConnectionFactory _connectionFactory;

        public DashboardDAL(IDbConnectionFactory connectionFactory)
        {
            _connectionFactory = connectionFactory;
        }

        public async Task<DashboardStatisticsResponse> GetStatisticsAsync(int? assignedTo)
        {
            using SqlConnection connection = _connectionFactory.CreateConnection();

            using SqlCommand command = new SqlCommand("SP_Dashboard_GetStatistics", connection);

            command.CommandType = CommandType.StoredProcedure;

            command.Parameters.Add("@AssignedTo", SqlDbType.Int).Value = (object?)assignedTo ?? DBNull.Value;

            await connection.OpenAsync();

            using SqlDataReader reader = await command.ExecuteReaderAsync();

            if (!await reader.ReadAsync())
            {
                return new DashboardStatisticsResponse();
            }

            return new DashboardStatisticsResponse
            {
                TotalTasks = Convert.ToInt32(reader["TotalTasks"]),

                PendingTasks = Convert.ToInt32(reader["PendingTasks"]),

                CompletedTasks = Convert.ToInt32(reader["CompletedTasks"]),

                HighPriorityTasks = Convert.ToInt32(reader["HighPriorityTasks"])
            };
        }

        public async Task<List<RecentTaskResponse>> GetRecentTasksAsync(int? assignedTo)
        {
            var tasks = new List<RecentTaskResponse>();

            using SqlConnection connection = _connectionFactory.CreateConnection();

            using SqlCommand command = new SqlCommand("SP_Dashboard_GetRecentTasks", connection);

            command.CommandType = CommandType.StoredProcedure;

            command.Parameters.Add("@AssignedTo", SqlDbType.Int).Value = (object?)assignedTo ?? DBNull.Value;

            await connection.OpenAsync();

            using SqlDataReader reader = await command.ExecuteReaderAsync();

            while (await reader.ReadAsync())
            {
                tasks.Add(new RecentTaskResponse
                {
                    TaskId = Convert.ToInt32(reader["TaskId"]),

                    Title = reader["Title"]?.ToString() ?? string.Empty,

                    AssignedEmployee = reader["AssignedEmployee"]?.ToString() ?? string.Empty,

                    Priority = reader["Priority"]?.ToString() ?? string.Empty,

                    Status = reader["Status"]?.ToString() ?? string.Empty,

                    DueDate = reader["DueDate"] == DBNull.Value ? null : Convert.ToDateTime(reader["DueDate"]),

                    CreatedOn = Convert.ToDateTime(reader["CreatedOn"]),

                    StatusUpdatedOn = reader["StatusUpdatedOn"] == DBNull.Value ? null : Convert.ToDateTime(reader["StatusUpdatedOn"])
                });
            }

            return tasks;
        }
    }
}
