using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using TeeApp.Application.Identity;
using TeeApp.Application.Interfaces;
using TeeApp.Data.EF;
using TeeApp.Data.Entities;
using TeeApp.Models.Common;
using TeeApp.Models.RequestModels.PostReport;
using TeeApp.Utilities.Extentions;

namespace TeeApp.Application.Services
{
    public class PostReportService : IPostReportService
    {
        private readonly TeeAppDbContext _context;
        private readonly ICurrentUser _currentUser;

        public PostReportService(TeeAppDbContext context, ICurrentUser currentUser)
        {
            _context = context;
            _currentUser = currentUser;
        }

        public async Task<ApiResult<PostReport>> AddAsync(ReportPostRequest request)
        {
            if (request == null || request.PostId == 0 || string.IsNullOrWhiteSpace(request.Content))
            {
                return ApiResult<PostReport>.BadRequest(null, "Please enter report content!");
            }

            var post = await _context.Posts.FirstOrDefaultAsync(x => x.Id == request.PostId);
            if (post == null)
            {
                return ApiResult<PostReport>.BadRequest(null, "Not found post.");
            }

            var report = new PostReport
            {
                DateCreated = DateTime.UtcNow.ToVNTimeZone(),
                ReportedPost = post,
                Content = request.Content,
                IsHandled = false
            };

            _context.PostReports.Add(report);
            await _context.SaveChangesAsync();
            
            return ApiResult<PostReport>.Ok(report);
        }

        public async Task<ApiResult<PostReport>> UpdateAsync(UpdatePostReportRequest request)
        {
            if (!_currentUser.IsAdmin())
            {
                return ApiResult<PostReport>.Forbid(null,"You do not have permission!");
            }
            if (request == null || request.ReportId == 0)
            {
                return ApiResult<PostReport>.BadRequest(null, "Please enter report id!");
            }

            var report = await _context.PostReports.FirstOrDefaultAsync(x => x.Id == request.ReportId);
            if (report == null)
            {
                return ApiResult<PostReport>.BadRequest(null, "Not found report.");
            }

            report.Content = request.Content;
            report.IsHandled = request.IsHandled;
            report.DateModified = DateTime.Now;

            await _context.SaveChangesAsync();
            
            return ApiResult<PostReport>.Ok(report);
        }

        public async Task<List<PostReport>> GetAllAsync()
        {
            if (!_currentUser.IsAdmin())
            {
                return null;
            } 
            return await _context.PostReports
                .Include(x => x.ReportedPost)
                .ThenInclude(x => x.Creator)
                .Include(x => x.ReportedPost)
                .ThenInclude(x => x.Photos)
                .OrderByDescending(x => x.DateCreated)
                .ToListAsync();
        }
    }
}