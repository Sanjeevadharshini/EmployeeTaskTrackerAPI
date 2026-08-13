using EmployeeTaskTrackerAPI.Helpers;
using EmployeeTaskTrackerAPI.Logging;
using EmployeeTaskTrackerAPI.Models;
using Microsoft.Data.SqlClient;
using System.Net;
using System.Text.Json;

namespace EmployeeTaskTrackerAPI.Middleware
{
    public class ExceptionMiddleware
    {
        private readonly RequestDelegate _next;
        private readonly ErrorLogWriter _errorLogWriter;

        public ExceptionMiddleware(RequestDelegate next, ErrorLogWriter errorLogWriter)
        {
            _next = next;
            _errorLogWriter = errorLogWriter;
        }

        public async Task InvokeAsync(HttpContext context)
        {
            try
            {
                await _next(context);
            }
            catch (Exception ex)
            {
                await _errorLogWriter.WriteAsync(ex, context.Request.Path);

                context.Response.ContentType = "application/json";

                int statusCode = ex switch
                {
                    BusinessException => StatusCodes.Status400BadRequest,

                    ForbiddenException => StatusCodes.Status403Forbidden,

                    UnauthorizedAccessException => StatusCodes.Status401Unauthorized,

                    SqlException sqlEx when sqlEx.Number is 50002 or 50006 or 50009 or 50010 => StatusCodes.Status404NotFound,

                    SqlException sqlEx when sqlEx.Number is
                        50001 or 50003 or 50004 or 50005 or 50007 or 50008 or 50011 => StatusCodes.Status400BadRequest,

                    _ => StatusCodes.Status500InternalServerError
                };

                context.Response.StatusCode = statusCode;

                string message = ex switch
                {
                    BusinessException => ex.Message,

                    ForbiddenException => ex.Message,

                    UnauthorizedAccessException => "Unauthorized access.",

                    SqlException sqlEx when sqlEx.Number >= 50000 && sqlEx.Number < 60000 => sqlEx.Message,

                    _ => "An unexpected error occurred."
                };

                var response = new ApiResponse
                {
                    Success = false,
                    Message = message
                };

                await context.Response.WriteAsync(JsonSerializer.Serialize(response));
            }
        }
    }
}
