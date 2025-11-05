using KabElectroSolutions.Data;
using KabElectroSolutions.DTOs;
using KabElectroSolutions.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using System.Linq;
using System.Threading.Tasks;

namespace KabElectroSolutions.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ServicePartnersController : ControllerBase
    {
        private readonly KabElectroSolutionsDbContext _context;
        private readonly ILogger<ServicePartnersController> _logger;

        public ServicePartnersController(ILogger<ServicePartnersController> logger, KabElectroSolutionsDbContext context)
        {
            _logger = logger;
            _context = context;
        }

        [HttpGet("ServicePartners")]
        public async Task<IActionResult> GetServicePartners()
        {
            var data = await _context.ServicePartner
                .Select(s => new ServicePartnersDTO
                {
                    Id = s.Id,
                    ServicePartner = s.ServicePartner,
                    Phone = s.Phone,
                    Email = s.Email,
                    Address = s.Address,
                    Pan = s.Pan,
                    Gst = s.Gst,
                    CityName = _context.Cities
                        .Where(c => c.Id == s.CityId)
                        .Select(ct => ct.Name)
                        .FirstOrDefault(),
                    StateId = s.StateId,
                    StateName = _context.Locations
                        .Where(st => st.Id == s.StateId)
                        .Select(c => c.Name)
                        .FirstOrDefault(),
                    PinCodeId = s.PinCodeId,
                    PinCode = _context.Pincodes
                        .Where(pin => pin.Id == s.PinCodeId)
                        .Select(pn => pn.PincodeValue)
                        .FirstOrDefault(),
                    IsDisable = s.IsDisable
                })
                .ToListAsync();

            var result = new ServicePartnersResponseDTO
            {
                Status = 200,
                Message = "success, is_redis = True",
                Data = data
            };

            return Ok(result);
        }

        [HttpPost]
        public async Task<IActionResult> CreateServicePartners([FromBody] ServicePartners servicePartners)
        {
            if (servicePartners == null)
                return BadRequest("Invalid service partner data");

            _context.ServicePartner.Add(servicePartners);
            await _context.SaveChangesAsync();

            return CreatedAtAction(nameof(GetServicePartners), new { id = servicePartners.Id }, servicePartners);
        }

        [HttpPost("{id}")]
        public async Task<IActionResult> UpdateServicePartners(int id, [FromBody] ServicePartners updatedServicePartners)
        {
            if (updatedServicePartners == null)
                return BadRequest("Invalid service partner data");

            var existingServicePartner = await _context.ServicePartner.FindAsync(id);
            if (existingServicePartner == null)
                return NotFound("Service partner not found");

            existingServicePartner.ServicePartner = updatedServicePartners.ServicePartner;
            existingServicePartner.Gst = updatedServicePartners.Gst;
            existingServicePartner.Phone = updatedServicePartners.Phone;
            existingServicePartner.Email = updatedServicePartners.Email;
            existingServicePartner.ExtraInfo = updatedServicePartners.ExtraInfo;
            existingServicePartner.Pan = updatedServicePartners.Pan;
            existingServicePartner.CityId = updatedServicePartners.CityId;
            existingServicePartner.StateId = updatedServicePartners.StateId;
            existingServicePartner.PinCodeId = updatedServicePartners.PinCodeId;
            existingServicePartner.Address = updatedServicePartners.Address;
            existingServicePartner.IsDisable = updatedServicePartners.IsDisable;

            _context.ServicePartner.Update(existingServicePartner);
            await _context.SaveChangesAsync();

            return Ok(existingServicePartner);
        }
    }
}
