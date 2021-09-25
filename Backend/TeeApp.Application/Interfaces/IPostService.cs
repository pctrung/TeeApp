﻿using System.Threading.Tasks;
using TeeApp.Models.Common;
using TeeApp.Models.RequestModels.Common;
using TeeApp.Models.RequestModels.Posts;
using TeeApp.Models.ResponseModels.Posts;
using TeeApp.Models.ViewModels;

namespace TeeApp.Application.Interfaces
{
    public interface IPostService
    {
        Task<PagedResult<PostViewModel>> GetAllPaginationAsync(PaginationRequestBase request);

        Task<PagedResult<PostViewModel>> GetMyPostsPaginationAsync(PaginationRequestBase request);

        Task<ApiResult<PostViewModel>> GetByIdAsync(int postId);

        Task<ApiResult<PostResponse>> CreateAsync(CreatePostRequest request);

        Task<ApiResult<PostResponse>> UpdateAsync(int postId, UpdatePostRequest request);

        Task<ApiResult<PostResponse>> DeleteAsync(int postId);
    }
}