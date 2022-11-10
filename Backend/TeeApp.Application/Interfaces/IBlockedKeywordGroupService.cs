using System.Collections.Generic;
using System.Threading.Tasks;
using TeeApp.Data.Entities;
using TeeApp.Models.Common;
using TeeApp.Models.RequestModels.BlockedKeywords;
using TeeApp.Models.ViewModels;

namespace TeeApp.Application.Interfaces
{
    public interface IBlockedKeywordGroupService
    {
        Task<ApiResult<BlockedKeywordGroupViewModel>> UpdateAsync(BlockedKeywordGroupRequest request);
        Task<ApiResult<BlockedKeywordGroupViewModel>> DeleteAsync(int id);
        Task<List<BlockedKeywordGroupViewModel>> GetAllAsync();
    }
}