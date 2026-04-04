using KabElectroSolutions.Data;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;

namespace KabElectroSolutions.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ServiceCentersController : ControllerBase
    {
        private readonly KabElectroSolutionsDbContext _context;

        public ServiceCentersController(KabElectroSolutionsDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            var data = await _context.ServiceCenters.ToListAsync();
            return Ok(data);
        }

        // ✅ GET: api/servicecenters/{id}
        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var serviceCenter = await _context.ServiceCenters.FindAsync(id);

            if (serviceCenter == null)
                return NotFound();

            return Ok(serviceCenter);
        }
    }
}
