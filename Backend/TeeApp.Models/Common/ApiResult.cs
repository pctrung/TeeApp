namespace TeeApp.Models.Common
{
    public class ApiResult<T>
    {
        public int StatusCode { get; set; }

        public string Message { get; set; }

        public T Data { get; set; }

        public ApiResult(T resultData)
        {
            Data = resultData;
        }

        public static ApiResult<T> Ok(T result, string message = "Action successfully") => new(result) { StatusCode = 200, Message = message };

        public static ApiResult<T> Created(T result, string message = "Created") => new(result) { StatusCode = 201, Message = message };

        public static ApiResult<T> BadRequest(T result, string message = "Something went wrong") => new(result) { StatusCode = 400, Message = message };

        public static ApiResult<T> Forbid(T result, string message = "You do not have permission to access this resource") => new(result) { StatusCode = 403, Message = message };

        public static ApiResult<T> NotFound(T result, string message = "Not found resources") => new(result) { StatusCode = 404, Message = message };

        public static ApiResult<T> ServerError(T result, string message = "Server error") => new(result) { StatusCode = 500, Message = message };
    }

    public class ApiResult
    {
        public int StatusCode { get; set; }

        public string Message { get; set; }

        public static ApiResult Ok(string message = "Action successfully") => new() { StatusCode = 200, Message = message };

        public static ApiResult Created(string message = "Created") => new() { StatusCode = 201, Message = message };

        public static ApiResult BadRequest(string message = "Something went wrong") => new() { StatusCode = 400, Message = message };

        public static ApiResult Forbid(string message = "You do not have permission to access this resource") => new() { StatusCode = 403, Message = message };

        public static ApiResult NotFound(string message = "Not found resources") => new() { StatusCode = 404, Message = message };

        public static ApiResult ServerError(string message = "Server error") => new() { StatusCode = 500, Message = message };
    }
}