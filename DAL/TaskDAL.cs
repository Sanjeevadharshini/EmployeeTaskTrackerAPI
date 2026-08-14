using EmployeeTaskTrackerAPI.DAL.Interfaces;
using EmployeeTaskTrackerAPI.Models;
using Microsoft.Data.SqlClient;
using System.Data;

namespace EmployeeTaskTrackerAPI.DAL
{
    public class TaskDAL : ITaskDAL
    {
        private readonly IDbConnectionFactory _connectionFactory;

        public TaskDAL(IDbConnectionFactory connectionFactory)
        {
            _connectionFactory = connectionFactory;
        }

        public async Task<int> CreateAsync(string title, string? description, int assignedTo, string priority, DateTime? dueDate, int createdBy)
        {
            using SqlConnection connection = _connectionFactory.CreateConnection();

            using SqlCommand command = new SqlCommand("SP_Task_Create", connection);

            command.CommandType = CommandType.StoredProcedure;

            command.Parameters.Add("@Title", SqlDbType.NVarChar, 200).Value = title;

            command.Parameters.Add("@Description", SqlDbType.NVarChar, -1).Value = (object?)description ?? DBNull.Value;

            command.Parameters.Add("@AssignedTo", SqlDbType.Int).Value = assignedTo;

            command.Parameters.Add("@Priority", SqlDbType.NVarChar, 20).Value = priority;

            command.Parameters.Add("@DueDate", SqlDbType.DateTime2).Value = (object?)dueDate ?? DBNull.Value;

            command.Parameters.Add("@CreatedBy", SqlDbType.Int).Value = createdBy;

            await connection.OpenAsync();

            object? result = await command.ExecuteScalarAsync();

            return Convert.ToInt32(result);
        }

        public async Task<PagedResult<TaskModel>> GetAllAsync(string? search, string? status, string? priority, int? assignedTo, int pageNumber, int pageSize)
        {
            var tasks = new List<TaskModel>();

            int totalCount = 0;

            using SqlConnection connection = _connectionFactory.CreateConnection();

            using SqlCommand command = new SqlCommand("SP_Task_GetAll", connection);

            command.CommandType = CommandType.StoredProcedure;

            command.Parameters.Add("@Search", SqlDbType.NVarChar, 200).Value = (object?)search ?? DBNull.Value;

            command.Parameters.Add("@Status", SqlDbType.NVarChar, 20).Value = (object?)status ?? DBNull.Value;

            command.Parameters.Add("@Priority", SqlDbType.NVarChar, 20).Value = (object?)priority ?? DBNull.Value;

            command.Parameters.Add("@AssignedTo", SqlDbType.Int).Value = (object?)assignedTo ?? DBNull.Value;

            command.Parameters.Add("@PageNumber", SqlDbType.Int).Value = pageNumber;

            command.Parameters.Add("@PageSize", SqlDbType.Int).Value = pageSize;

            await connection.OpenAsync();

            using SqlDataReader reader = await command.ExecuteReaderAsync();

            while (await reader.ReadAsync())
            {
                tasks.Add(MapTask(reader));

                if (totalCount == 0)
                {
                    totalCount = Convert.ToInt32(reader["TotalCount"]);
                }
            }

            return new PagedResult<TaskModel>
            {
                Items = tasks,
                TotalCount = totalCount,
                PageNumber = pageNumber,
                PageSize = pageSize
            };
        }

        public async Task<TaskModel?> GetByIdAsync(
            int taskId)
        {
            using SqlConnection connection = _connectionFactory.CreateConnection();

            using SqlCommand command = new SqlCommand("SP_Task_GetById", connection);

            command.CommandType = CommandType.StoredProcedure;

            command.Parameters.Add("@TaskId", SqlDbType.Int).Value = taskId;

            await connection.OpenAsync();

            using SqlDataReader reader = await command.ExecuteReaderAsync();

            if (!await reader.ReadAsync())
            {
                return null;
            }

            return MapTask(reader);
        }

        public async Task<int> UpdateAsync(int taskId, string title, string? description, int assignedTo, string priority, DateTime? dueDate, int updatedBy)
        {
            using SqlConnection connection = _connectionFactory.CreateConnection();

            using SqlCommand command = new SqlCommand("SP_Task_Update", connection);

            command.CommandType = CommandType.StoredProcedure;

            command.Parameters.Add("@TaskId", SqlDbType.Int).Value = taskId;

            command.Parameters.Add("@Title", SqlDbType.NVarChar, 200).Value = title;

            command.Parameters.Add("@Description", SqlDbType.NVarChar, -1).Value = (object?)description ?? DBNull.Value;

            command.Parameters.Add("@AssignedTo", SqlDbType.Int).Value = assignedTo;

            command.Parameters.Add("@Priority", SqlDbType.NVarChar, 20).Value = priority;

            command.Parameters.Add("@DueDate", SqlDbType.DateTime2).Value = (object?)dueDate ?? DBNull.Value;

            command.Parameters.Add("@UpdatedBy", SqlDbType.Int).Value = updatedBy;

            await connection.OpenAsync();

            object? result = await command.ExecuteScalarAsync();

            return Convert.ToInt32(result);
        }

        public async Task<int> UpdateStatusAsync(int taskId, string status, int updatedBy)
        {
            using SqlConnection connection = _connectionFactory.CreateConnection();

            using SqlCommand command = new SqlCommand("SP_Task_UpdateStatus", connection);

            command.CommandType = CommandType.StoredProcedure;

            command.Parameters.Add("@TaskId", SqlDbType.Int).Value = taskId;

            command.Parameters.Add("@Status", SqlDbType.NVarChar, 20).Value = status;

            command.Parameters.Add("@UpdatedBy", SqlDbType.Int).Value = updatedBy;

            await connection.OpenAsync();

            object? result = await command.ExecuteScalarAsync();

            return Convert.ToInt32(result);
        }

        public async Task<int> DeleteAsync(int taskId, int deletedBy)
        {
            using SqlConnection connection = _connectionFactory.CreateConnection();

            using SqlCommand command = new SqlCommand("SP_Task_Delete", connection);

            command.CommandType = CommandType.StoredProcedure;

            command.Parameters.Add("@TaskId", SqlDbType.Int).Value = taskId;

            command.Parameters.Add("@DeletedBy", SqlDbType.Int).Value = deletedBy;

            await connection.OpenAsync();

            object? result = await command.ExecuteScalarAsync();

            return Convert.ToInt32(result);
        }

        private static TaskModel MapTask(SqlDataReader reader)
        {
            return new TaskModel
            {
                TaskId = Convert.ToInt32(reader["TaskId"]),

                Title = reader["Title"]?.ToString() ?? string.Empty,

                Description = reader["Description"] == DBNull.Value ? null : reader["Description"]?.ToString(),

                AssignedTo = Convert.ToInt32(reader["AssignedTo"]),

                AssignedEmployee = reader["AssignedEmployee"]?.ToString() ?? string.Empty,

                Priority = reader["Priority"]?.ToString() ?? string.Empty,

                Status = reader["Status"]?.ToString() ?? string.Empty,

                DueDate = reader["DueDate"] == DBNull.Value ? null : Convert.ToDateTime(reader["DueDate"]),

                IsActive = Convert.ToBoolean(reader["IsActive"]),

                CreatedOn = Convert.ToDateTime(reader["CreatedOn"]),

                CreatedBy = Convert.ToInt32(reader["CreatedBy"]),

                StatusUpdatedOn = reader["StatusUpdatedOn"] == DBNull.Value ? null : Convert.ToDateTime(reader["StatusUpdatedOn"]),

                UpdatedOn = reader["UpdatedOn"] == DBNull.Value ? null : Convert.ToDateTime(reader["UpdatedOn"]),

                UpdatedBy = reader["UpdatedBy"] == DBNull.Value ? null : Convert.ToInt32(reader["UpdatedBy"])
            };
        }
    }
}
