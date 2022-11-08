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
        
        public async Task<ApiResult<BlockedKeywordGroup>> Update(BlockedKeywordGroupRequest request)
        {
            if (!_currentUser.IsAdmin())
            {
                return ApiResult<BlockedKeywordGroup>.Forbid(null,"You do not have permission");
            }
            if (string.IsNullOrWhiteSpace(request.Name))
            {
                return ApiResult<BlockedKeywordGroup>.BadRequest(null, "Please enter group name");
            }
            BlockedKeywordGroup group;
            if (request.Id == 0)
            {
                group = new BlockedKeywordGroup
                {
                    DateCreated = DateTime.Now,
                    Name = request.Name,
                    Keywords = string.Join(',', request.Keywords ?? new List<string>())  
                };

                await _context.BlockedKeywordGroups.AddAsync(group); 
            }
            else
            {
                group = await _context.BlockedKeywordGroups.FirstOrDefaultAsync(x => x.Id == request.Id);
                group.Keywords = string.Join(',', request.Keywords ?? new List<string>());
                group.Name = request.Name;

                _context.BlockedKeywordGroups.Update(group);
            }
            
            await _context.SaveChangesAsync();
            return ApiResult<BlockedKeywordGroup>.Ok(group);
        }
        public async Task<ApiResult<BlockedKeywordGroup>> Delete(int id)
        {
            if (!_currentUser.IsAdmin())
            {
                return ApiResult<BlockedKeywordGroup>.Forbid(null,"You do not have permission");
            }
            var group = await _context.BlockedKeywordGroups.FirstOrDefaultAsync(x => x.Id == id);
            if (group == null)
            {
                return ApiResult<BlockedKeywordGroup>.BadRequest(null, "Not found group");
            }
            _context.BlockedKeywordGroups.Remove(group);
            await _context.SaveChangesAsync();
            return ApiResult<BlockedKeywordGroup>.Ok(group);
        }

        public async Task<List<BlockedKeywordGroupViewModel>> GetAll()
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
                Keywords = x.Keywords?.Split(",").ToList()
            }));
            return result;
        }
    }
}