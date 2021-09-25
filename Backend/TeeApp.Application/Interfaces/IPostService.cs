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
        Task<ApiResult<PagedResult<PostViewModel>>> GetAllPagination(PaginationRequestBase request);

        Task<ApiResult<PostViewModel>> GetByIdAsync(int postId);

        Task<ApiResult<PostResponse>> CreateAsync(CreatePostRequest request);

        Task<ApiResult<PostResponse>> UpdateAsync(int postId, UpdatePostRequest request);

        Task<ApiResult<PostResponse>> DeleteAsync(int postId);
    }
}