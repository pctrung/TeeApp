using System.Threading.Tasks;
using TeeApp.Models.Common;
using TeeApp.Models.RequestModels.Comments;
using TeeApp.Models.ResponseModels.Comments;

namespace TeeApp.Application.Interfaces
{
    public interface ICommentService
    {
        Task<ApiResult<CommentResponse>> CreateAsync(int postId, CommentRequest request);

        Task<ApiResult<CommentResponse>> UpdateAsync(int postId, int commentId, CommentRequest request);

        Task<ApiResult<CommentResponse>> DeleteAsync(int postId, int commentId);
    }
}