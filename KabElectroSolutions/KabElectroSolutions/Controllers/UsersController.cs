using Azure.Core;
using KabElectroSolutions.Data;
using KabElectroSolutions.DTOs;
using KabElectroSolutions.Helper;
using KabElectroSolutions.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace KabElectroSolutions.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class UsersController : ControllerBase
    {
        private readonly KabElectroSolutionsDbContext _context;
        private readonly ILogger<UsersController> _logger;

        public UsersController(ILogger<UsersController> logger, KabElectroSolutionsDbContext context)
        {
            _logger = logger;
            _context = context;
        }

        [HttpGet("Users")]
        public async Task<IActionResult> GetUsers()
        {
            try
            {
                var performerEmail = User?.Identity?.Name;
                var user = await _context.Users.FirstOrDefaultAsync(u => u.Email == performerEmail && !u.IsPartner);

                var data = await (
                    from u in _context.Users
                    join a in _context.Addresses
                        on u.Id equals a.UserId into addressGroup
                    from addr in addressGroup.DefaultIfEmpty()
                    where !u.IsPartner && u.BusinessroleName != "Super Admin"
                    select new UsersDTO
                    {
                        Id = u.Id,
                        Phone = u.Phone,
                        Email = u.Email,
                        FirstName = u.Firstname,
                        LastName = u.Lastname,
                        Address = addr.AddressLine,
                        CityName = addr.City,
                        StateName = addr.State,
                        PinCode = addr.Pincode,
                        RoleId = u.Businessrole,

                        // Lookups
                        CityId = _context.Cities
                            .Where(c => c.Name == addr.City)
                            .Select(c => c.Id)
                            .FirstOrDefault(),

                        StateId = _context.Locations
                            .Where(st => st.Name == addr.State)
                            .Select(s => s.Id)
                            .FirstOrDefault(),

                        PinCodeId = _context.Pincodes
                            .Where(p => p.PincodeValue == addr.Pincode)
                            .Select(p => p.Id)
                            .FirstOrDefault()
                    }
                ).ToListAsync();

                var result = new UsersResponseDTO
                {
                    Status = 200,
                    Message = "success, is_redis = True",
                    Data = data
                };

                return Ok(result);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }

        [HttpPost]
        public async Task<IActionResult> CreateUsers([FromBody] UsersDTO users)
        {
            if (users == null)
                return BadRequest("Invalid service partner data");

            using var transaction = await _context.Database.BeginTransactionAsync();
            try
            {
                var performerEmail = User?.Identity?.Name;
                var currentUser = await _context.Users.FirstOrDefaultAsync(u => u.Email == performerEmail);
                var roleName = _context.Roles.Where(role => role.RoleId == users.RoleId).First().RoleName;

                var user = new User
                {
                    Firstname = users.FirstName,
                    Lastname = users.LastName,
                    Phone = users.Phone,
                    Email = users.Email,
                    Business = 1,
                    BusinessPhone = currentUser.BusinessPhone,
                    BusinessEmail = currentUser.Email,
                    Businessname = currentUser.Businessname,
                    Businessrole = users.RoleId,
                    BusinessGst = currentUser.BusinessGst!,
                    BusinessPan = currentUser.BusinessPan!,
                    BusinessroleName = roleName,
                    IsActiveBusiness = true,
                    PasswordHash = PasswordHelper.HashPassword(users.Phone),
                    IsPartner = false,
                    PartnerId = roleName == "Brand" ? 0 : currentUser.Id
                };

                _context.Users.Add(user);
                await _context.SaveChangesAsync();

                var address = new Address
                {
                    UserId = user.Id,
                    IsBusinessAddress = true,
                    AddressLine = users.Address!,
                    Location = users.StateId,
                    Pincode = _context.Pincodes.Where(pincode => pincode.Id == users.PinCodeId).First().PincodeValue,
                    City = _context.Cities.Where(city => city.Id == users.CityId).First().Name,
                    State = _context.Locations.Where(location => location.Id == users.StateId).First().Name
                };

                _context.Addresses.Add(address);
                await _context.SaveChangesAsync();

                var userRole = new UserRole
                {
                    UserId = user.Id,
                    //RoleId = _context.Roles.Where(role => role.RoleName == "Customer Care Executive").First().RoleId
                    RoleId = users.RoleId
                };
                _context.UserRoles.Add(userRole);
                await _context.SaveChangesAsync();

                await transaction.CommitAsync();
                return CreatedAtAction(nameof(GetUsers), new { id = user.Id }, users);
            }
            catch (Exception ex)
            {
                // Rollback if anything fails
                await transaction.RollbackAsync();
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }

        [HttpPost("{id}")]
        public async Task<IActionResult> UpdateUsers(int id, [FromBody] UsersDTO updateUserdata)
        {
            if (updateUserdata == null)
                return BadRequest("Invalid user data");

            using var transaction = await _context.Database.BeginTransactionAsync();
            try
            {
                var performerEmail = User?.Identity?.Name;
                var currentUser = await _context.Users.FirstOrDefaultAsync(u => u.Email == performerEmail);
                var roleName = _context.Roles.Where(role => role.RoleId == updateUserdata.RoleId).First().RoleName;

                var existingUser = await _context.Users.FindAsync(id);
                if (existingUser == null)
                    return NotFound("user not found");

                existingUser.Phone = updateUserdata.Phone;
                existingUser.Email = updateUserdata.Email;
                existingUser.Firstname = updateUserdata.FirstName;
                existingUser.Lastname = updateUserdata.LastName;
                existingUser.PasswordHash = PasswordHelper.HashPassword(updateUserdata.Phone);
                //existingUser.Business = 1;
                //existingUser.BusinessPhone = currentUser.BusinessPhone;
                //existingUser.BusinessEmail = currentUser.Email;
                //existingUser.Businessname = currentUser.Businessname;
                existingUser.Businessrole = updateUserdata.RoleId;
                //existingUser.BusinessGst = currentUser.BusinessGst!;
                //existingUser.BusinessPan = currentUser.BusinessPan!;
                existingUser.BusinessroleName = roleName;
                existingUser.IsActiveBusiness = true;
                existingUser.IsPartner = false;
                existingUser.PartnerId = roleName == "Brand" ? 0 : currentUser.Id;
                _context.Users.Update(existingUser);
                await _context.SaveChangesAsync();

                var existingAddress = _context.Addresses.Where(x => x.UserId == id).FirstOrDefault();

                //var address = new Address
                //{
                existingAddress.UserId = id;
                existingAddress.AddressLine = updateUserdata.Address;
                existingAddress.Location = updateUserdata.StateId;
                existingAddress.Pincode = _context.Pincodes.Where(pincode => pincode.Id == updateUserdata.PinCodeId).First().PincodeValue;
                existingAddress.City = _context.Cities.Where(city => city.Id == updateUserdata.CityId).First().Name;
                existingAddress.State = _context.Locations.Where(location => location.Id == updateUserdata.StateId).First().Name;
                //};
                _context.Addresses.Update(existingAddress);
                await _context.SaveChangesAsync();

                var existingUserRole = _context.UserRoles.Where(role => role.UserId == id).First();
                //var userRole = new UserRole
                //{
                existingUserRole.UserId = id;
                existingUserRole.RoleId = updateUserdata.RoleId;
                //};

                _context.UserRoles.Update(existingUserRole);
                await _context.SaveChangesAsync();


                await transaction.CommitAsync();
                return Ok();
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
