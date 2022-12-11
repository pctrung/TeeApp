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
using TeeApp.Models.RequestModels.BlockedKeywords;
using TeeApp.Models.ViewModels;
using TeeApp.Utilities.Constants;
using TeeApp.Utilities.Extentions;

namespace TeeApp.Application.Services
{
    public class BlockedKeywordGroupService : IBlockedKeywordGroupService
    {
        private readonly TeeAppDbContext _context;
        private readonly ICurrentUser _currentUser;

        public BlockedKeywordGroupService(TeeAppDbContext context, ICurrentUser currentUser)
        {
            _context = context;
            _currentUser = currentUser;
        }
        
        public async Task<ApiResult<BlockedKeywordGroupViewModel>> UpdateAsync(BlockedKeywordGroupRequest request)
        {
            if (!_currentUser.IsAdmin())
            {
                return ApiResult<BlockedKeywordGroupViewModel>.Forbid(null,"You do not have permission");
            }
            if (string.IsNullOrWhiteSpace(request.Name))
            {
                return ApiResult<BlockedKeywordGroupViewModel>.BadRequest(null, "Please enter group name");
            }
            BlockedKeywordGroup group;
            if (request.Id == 0)
            {
                request.Keywords = request.Keywords?.Where(x => !string.IsNullOrWhiteSpace(x)).ToList();
                group = new BlockedKeywordGroup
                {
                    DateCreated = DateTime.UtcNow.ToVNTimeZone(),
                    Name = request.Name,
                    Keywords = string.Join(SystemConstants.BLOCKED_KEYWORDS_SEPARATOR, request.Keywords ?? new List<string>())  
                };

                await _context.BlockedKeywordGroups.AddAsync(group); 
            }
            else
            {
                group = await _context.BlockedKeywordGroups.FirstOrDefaultAsync(x => x.Id == request.Id);
                group.Keywords = string.Join(SystemConstants.BLOCKED_KEYWORDS_SEPARATOR, request.Keywords ?? new List<string>());
                group.Name = request.Name;

                _context.BlockedKeywordGroups.Update(group);
            }
            
            await _context.SaveChangesAsync();
            var result = new BlockedKeywordGroupViewModel
            {
                Id = group.Id,
                Name = group.Name,
                Keywords = group.Keywords.Split(SystemConstants.BLOCKED_KEYWORDS_SEPARATOR).ToList()
            };
            return ApiResult<BlockedKeywordGroupViewModel>.Ok(result);
        }
        public async Task<ApiResult<BlockedKeywordGroupViewModel>> DeleteAsync(int id)
        {
            if (!_currentUser.IsAdmin())
            {
                return ApiResult<BlockedKeywordGroupViewModel>.Forbid(null,"You do not have permission");
            }
            var group = await _context.BlockedKeywordGroups.FirstOrDefaultAsync(x => x.Id == id);
            if (group == null)
            {
                return ApiResult<BlockedKeywordGroupViewModel>.BadRequest(null, "Not found group");
            }
            _context.BlockedKeywordGroups.Remove(group);
            await _context.SaveChangesAsync();
            var result = new BlockedKeywordGroupViewModel
            {
                Id = group.Id,
                Name = group.Name,
                Keywords = group.Keywords.Split(SystemConstants.BLOCKED_KEYWORDS_SEPARATOR).ToList()
            };
            return ApiResult<BlockedKeywordGroupViewModel>.Ok(result);
        }

        public async Task<List<BlockedKeywordGroupViewModel>> GetAllAsync()
        {
            if (!_currentUser.IsAdmin())
            {
                return null;
            }
            var result = new List<BlockedKeywordGroupViewModel>();
            await _context.BlockedKeywordGroups.ForEachAsync(x => result.Add(new BlockedKeywordGroupViewModel
            {
                Id = x.Id,
                Name = x.Name,
                Keywords = x.Keywords?.Split(SystemConstants.BLOCKED_KEYWORDS_SEPARATOR).ToList()
            }));
            return result;
        }
    }
}