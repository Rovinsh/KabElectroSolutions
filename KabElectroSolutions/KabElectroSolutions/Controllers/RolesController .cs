using KabElectroSolutions.Data;
using KabElectroSolutions.DTOs;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;

namespace KabElectroSolutions.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class RolesController : ControllerBase
    {
        private readonly KabElectroSolutionsDbContext _context;

        public RolesController(KabElectroSolutionsDbContext context)
        {
            _context = context;
        }

        // GET: api/roles
        [HttpGet("Roles")]
        public async Task<ActionResult<IEnumerable<RoleDto>>> GetRoles()
        {
            var roles = await _context.Roles
                .Select(r => new RoleDto
                {
                    RoleId = r.RoleId,
                    RoleName = r.RoleName
                })
                .ToListAsync();

            return Ok(roles);
        }
    }
}
