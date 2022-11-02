using System.Threading.Tasks;
using TeeApp.Models.Common;
using TeeApp.Models.RequestModels.Common;
using TeeApp.Models.RequestModels.Posts;
using TeeApp.Models.ResponseModels.Posts;
using TeeApp.Models.ViewModels;

namespace TeeApp.Application.Interfaces
{
    public interface IPostService
    {
        Task<PagedResult<PostViewModel>> GetNewsFeedPaginationAsync(PaginationRequestBase request);

        Task<PagedResult<PostViewModel>> GetAllPaginationAsync(PaginationRequestBase request);

        Task<ApiResult<PagedResult<PostViewModel>>> GetByUserNameAsync(string userName, PaginationRequestBase request);

        Task<ApiResult<PostViewModel>> GetByIdAsync(int postId);

        Task<ApiResult<PostResponse>> CreateAsync(CreatePostRequest request);

        Task<ApiResult<PostResponse>> UpdateAsync(int postId, UpdatePostRequest request);

        Task<ApiResult<PostResponse>> DeleteAsync(int postId);
        Task<PagedResult<PostViewModel>> GetAllAdminPaginationAsync(PaginationRequestBase request);
        Task<ApiResult<bool>> HidePost(int postId, string note);
        Task<ApiResult<bool>> UnHidePost(int postId);
    }
}