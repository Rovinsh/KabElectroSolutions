using Azure.Core;
using MSSolutions.Data;
using MSSolutions.DTOs;
using MSSolutions.Helper;
using MSSolutions.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using System.Linq;
using System.Threading.Tasks;

namespace MSSolutions.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class ServicePartnersController : ControllerBase
    {
        private readonly MSSolutionsDbContext _context;
        private readonly ILogger<ServicePartnersController> _logger;

        public ServicePartnersController(ILogger<ServicePartnersController> logger, MSSolutionsDbContext context)
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
                    FirstName = s.Firstname,
                    LastName = s.Lastname,
                    Phone = s.Phone,
                    Email = s.Email,
                    ExtraInfo=s.ExtraInfo,
                    Address = s.Address,
                    Pan = s.Pan,
                    Gst = s.Gst,
                    CityId = s.CityId,
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


        [HttpGet("GetServicePartnersByStateandCity")]
        public async Task<IActionResult> GetServicePartnersByStateandCity([FromQuery] int stateId, [FromQuery] int cityId)
        {
            var data = await _context.ServicePartner.Where(partner => partner.StateId == stateId && partner.CityId == cityId)
                .Select(s => new ServicePartnersDTO
                {
                    Id = s.Id,
                    ServicePartner = s.ServicePartner,
                    FirstName = s.Firstname,
                    LastName = s.Lastname,
                    Phone = s.Phone,
                    Email = s.Email,
                    Address = s.Address,
                    Pan = s.Pan,
                    Gst = s.Gst,
                    ExtraInfo = s.ExtraInfo,
                    CityId = s.CityId,
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
            using var transaction = await _context.Database.BeginTransactionAsync();
            try
            {
                _context.ServicePartner.Add(servicePartners);
                await _context.SaveChangesAsync();

                var user = new User
                {
                    Firstname = servicePartners.Firstname,
                    Lastname = servicePartners.Lastname,
                    Phone = servicePartners.Phone,
                    Email = servicePartners.Email,
                    Business = 1,
                    BusinessPhone = servicePartners.Phone,
                    BusinessEmail = servicePartners.Email,
                    Businessname = servicePartners.ServicePartner,
                    Businessrole = 1,
                    BusinessGst = servicePartners.Gst!,
                    BusinessPan = servicePartners.Pan!,
                    BusinessroleName = "Service Center Head",
                    IsActiveBusiness = true,
                    PasswordHash = PasswordHelper.HashPassword(servicePartners.Phone),
                    IsPartner = true,
                    PartnerId = servicePartners.Id
                };

                _context.Users.Add(user);
                await _context.SaveChangesAsync();

                var address = new Address
                {
                    UserId = user.Id,
                    IsBusinessAddress = true,
                    AddressLine = servicePartners.Address!,
                    Location = servicePartners.StateId,
                    Pincode = _context.Pincodes.Where(pincode => pincode.Id == servicePartners.PinCodeId).First().PincodeValue,
                    City = _context.Cities.Where(city => city.Id == servicePartners.CityId).First().Name,
                    State = _context.Locations.Where(location => location.Id == servicePartners.StateId).First().Name
                };

                _context.Addresses.Add(address);
                await _context.SaveChangesAsync();

                var userRole = new UserRole
                {
                    UserId = user.Id,
                    RoleId = _context.Roles.Where(role => role.RoleName == "Service Centre").First().RoleId
                };
                _context.UserRoles.Add(userRole);
                await _context.SaveChangesAsync();
                await transaction.CommitAsync();

                return CreatedAtAction(nameof(GetServicePartners), new { id = servicePartners.Id }, servicePartners);
            }
            catch (DbUpdateException ex)
            {
                if (ex.InnerException?.Message.Contains("UQ_ServicePartner_Email") == true)
                {
                    return Conflict("Service patner email id already exists.");
                }

                return StatusCode(500, "An error occurred while saving the service partners.");
            }
            catch (Exception ex)
            {
                // Rollback if anything fails
                await transaction.RollbackAsync();
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }

        [HttpPost("{id}")]
        public async Task<IActionResult> UpdateServicePartners(int id, [FromBody] ServicePartners updatedServicePartners)
        {
            if (updatedServicePartners == null)
                return BadRequest("Invalid service partner data");

            using var transaction = await _context.Database.BeginTransactionAsync();
            try
            {
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

            
                var existingUser = await _context.Users.Where(User=>User.IsPartner && User.PartnerId==id).FirstOrDefaultAsync();
                if (existingUser == null)
                    return NotFound("user not found");
                existingUser.Phone = updatedServicePartners.Phone;
                existingUser.Email = updatedServicePartners.Email;
                existingUser.Firstname = updatedServicePartners.Firstname;
                existingUser.Lastname = updatedServicePartners.Lastname;
                existingUser.PasswordHash = PasswordHelper.HashPassword(updatedServicePartners.Phone);       
                existingUser.BusinessPhone = updatedServicePartners.Phone;
                existingUser.BusinessEmail = updatedServicePartners.Email;
                existingUser.Businessname = updatedServicePartners.ServicePartner;
                existingUser.BusinessGst = updatedServicePartners.Gst!;
                existingUser.BusinessPan = updatedServicePartners.Pan!;
                _context.Users.Update(existingUser);
                await _context.SaveChangesAsync();

                var existingAddress = _context.Addresses.Where(x => x.UserId == existingUser.Id).FirstOrDefault();

                //var address = new Address
                //{
                existingAddress.AddressLine = updatedServicePartners.Address;
                existingAddress.Location = updatedServicePartners.StateId;
                existingAddress.Pincode = _context.Pincodes.Where(pincode => pincode.Id == updatedServicePartners.PinCodeId).First().PincodeValue;
                existingAddress.City = _context.Cities.Where(city => city.Id == updatedServicePartners.CityId).First().Name;
                existingAddress.State = _context.Locations.Where(location => location.Id == updatedServicePartners.StateId).First().Name;
                //};
                _context.Addresses.Update(existingAddress);
                await _context.SaveChangesAsync();

                await transaction.CommitAsync();
                return Ok(existingServicePartner);
            }
            catch (DbUpdateException ex)
            {
                if (ex.InnerException?.Message.Contains("UQ_ServicePartner_Email") == true)
                {
                    return Conflict("Service patner email id already exists.");
                }

                return StatusCode(500, "An error occurred while saving the service partners.");
            }
            catch (Exception ex)
            {
                // Rollback if anything fails
                await transaction.RollbackAsync();
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }
    }
}
