using MSSolutions.Data;
using MSSolutions.DTOs;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MSSolutions.Data;
using System;

namespace MSSolutions.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class LocationsController : ControllerBase
    {
        private readonly MSSolutionsDbContext _context;
        private readonly ILogger<LocationsController> _logger;

        public LocationsController(ILogger<LocationsController> logger, MSSolutionsDbContext context)
        {
            _logger = logger;
            _context = context;
        }

        [HttpGet("locations")]
        public async Task<IActionResult> GetLocations()
        {
            var data = await _context.Locations
                .Include(l => l.Cities)
                    .ThenInclude(c => c.Pincodes)
                .ToListAsync();

            var result = new LocationResponseDto
            {
                Status = 200,
                Message = "success, is_redis = True",
                Data = data.ToDictionary(
                    l => l.Id.ToString(),
                    l => new LocationDto
                    {
                        Name = l.Name,
                        Cities = l.Cities.ToDictionary(
                            c => c.Id.ToString(),
                            c => new CityDto
                            {
                                Name = c.Name,
                                Pincodes = c.Pincodes.Select(p => p.PincodeValue).ToList()
                            }
                        )
                    }
                )
            };

            return Ok(result);
        }

        [HttpGet("states")]
        public async Task<IActionResult> GetStates()
        {
            var data = await _context.Locations
         .Select(l => new StateDTO
         {
             Id = l.Id,
             Name = l.Name
         })
         .ToListAsync();

            var result = new StateResponseDTO
            {
                Status = 200,
                Message = "success, is_redis = True",
                Data = data
            };

            return Ok(result);
        }

        [HttpGet("cities")]
        public async Task<IActionResult> GetCities()
        {
            var data = await _context.Cities
         .Select(l => new CitiesDto
         {
             Id = l.Id,
             Name = l.Name,
             StateId= l.LocationId
         })
         .ToListAsync();

            var result = new CityResponseDto
            {
                Status = 200,
                Message = "success, is_redis = True",
                Data = data
            };

            return Ok(result);
        }

        [HttpGet("pincodes")]
        public async Task<IActionResult> GetPincodes()
        {
            var data = await _context.Pincodes
         .Select(l => new PincodeDto
         {
             Id = l.Id,
             Pincode = l.PincodeValue,
             CityId = l.CityId
         })
         .ToListAsync();

            var result = new PincodeResponseDto
            {
                Status = 200,
                Message = "success, is_redis = True",
                Data = data
            };

            return Ok(result);
        }

    }
}