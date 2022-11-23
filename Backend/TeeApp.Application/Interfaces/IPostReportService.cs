using System.Collections.Generic;
using System.Threading.Tasks;
using TeeApp.Data.Entities;
using TeeApp.Models.Common; 
using TeeApp.Models.RequestModels.PostReport;
using TeeApp.Models.ViewModels;

namespace TeeApp.Application.Interfaces
{
    public interface IPostReportService
    {
        Task<ApiResult<PostReport>> AddAsync(ReportPostRequest request);
        Task<ApiResult<PostReport>> UpdateAsync(UpdatePostReportRequest report);
        Task<List<PostReport>> GetAllAsync();
    }
}