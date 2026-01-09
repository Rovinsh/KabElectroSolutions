using Azure.Core;
using MSSolutions.Data;
using MSSolutions.DTOs;
using MSSolutions.Helper;
using MSSolutions.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using MSSolutions.Data;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace MSSolutions.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly MSSolutionsDbContext _context;
        private readonly ILogger<UsersController> _logger;

        public UsersController(ILogger<UsersController> logger, MSSolutionsDbContext context)
        {
            _logger = logger;
            _context = context;
        }

        [HttpGet("Users/{userType}")]
        public async Task<IActionResult> GetUsers(string? userType)
        {
            userType = string.IsNullOrWhiteSpace(userType) ? "user" : userType.ToLower();

            try
            {
                var performerEmail = User?.Identity?.Name;
                var user = await _context.MsUsers.FirstOrDefaultAsync(u => u.Email == performerEmail && !u.IsPartner);

                var query =
                    from u in _context.MsUsers
                    join a in _context.MsAddresses on u.Id equals a.UserId into addressGroup
                    from addr in addressGroup.DefaultIfEmpty()
                    where !u.IsPartner
                    select new { u, addr };

                if (userType == "customer")
                {
                    query = query.Where(x => x.u.BusinessroleName == "User" && x.u.BusinessroleName != "Super Admin");
                }
                else
                {
                    query = query.Where(x => x.u.BusinessroleName != "Super Admin");
                }

                var data = await query.Select(x => new UsersDTO
                {
                    Id = x.u.Id,
                    Phone = x.u.Phone,
                    Email = x.u.Email,
                    FirstName = x.u.Firstname,
                    LastName = x.u.Lastname,

                    Address = x.addr != null ? x.addr.AddressLine : null,
                    CityName = x.addr != null ? x.addr.City : null,
                    StateName = x.addr != null ? x.addr.State : null,
                    PinCode = x.addr != null ? x.addr.Pincode : null,

                    RoleId = x.u.Businessrole,
                    RoleName = x.u.BusinessroleName,

                    CityId = x.addr != null
                        ? _context.Cities.Where(c => c.Name == x.addr.City).Select(c => c.Id).FirstOrDefault()
                        : 0,

                    StateId = x.addr != null
                        ? _context.Locations.Where(st => st.Name == x.addr.State).Select(st => st.Id).FirstOrDefault()
                        : 0,

                    PinCodeId = x.addr != null
                        ? _context.Pincodes.Where(p => p.PincodeValue == x.addr.Pincode).Select(p => p.Id).FirstOrDefault()
                        : 0
                }).ToListAsync();

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
                var currentUser = await _context.MsUsers.FirstOrDefaultAsync(u => u.Email == performerEmail);
                var roleName = _context.MsRoles.Where(role => role.RoleId == users.RoleId).First().RoleName;

                var user = new MsUser
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

                _context.MsUsers.Add(user);
                await _context.SaveChangesAsync();

                var address = new MsAddress
                {
                    UserId = user.Id,
                    IsBusinessAddress = true,
                    AddressLine = users.Address!,
                    StateId = users.StateId,
                    Pincode = _context.Pincodes.Where(pincode => pincode.Id == users.PinCodeId).First().PincodeValue,
                    City = _context.Cities.Where(city => city.Id == users.CityId).First().Name,
                    State = _context.Locations.Where(location => location.Id == users.StateId).First().Name
                };

                _context.MsAddresses.Add(address);
                await _context.SaveChangesAsync();

                var userRole = new MsUserRole
                {
                    UserId = user.Id,
                    //RoleId = _context.Roles.Where(role => role.RoleName == "Customer Care Executive").First().RoleId
                    RoleId = users.RoleId
                };
                _context.MsUserRoles.Add(userRole);
                await _context.SaveChangesAsync();

                await transaction.CommitAsync();
                return CreatedAtAction(nameof(GetUsers), new { id = user.Id }, users);
            }
            catch (DbUpdateException ex)
            {
                if (ex.InnerException?.Message.Contains("UQ_Users_Email") == true)
                {
                    return Conflict("User email id already exists.");
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

        [HttpPost("CreateCustomer")]
        public async Task<IActionResult> CreateCustomer([FromBody] UsersDTO customer)
        {
            if (customer == null)
                return BadRequest("Invalid User data");

            using var transaction = await _context.Database.BeginTransactionAsync();

            try
            {
                var roleData = await _context.MsRoles.FirstOrDefaultAsync(r => r.RoleName == "User");
                if (roleData == null)
                    return BadRequest("Role 'User' not found.");

                var user = new MsUser
                {
                    Firstname = customer.FirstName,
                    Lastname = customer.LastName,
                    Phone = customer.Phone,
                    Email = customer.Email,
                    Business = 2,
                    BusinessPhone = customer.Phone,
                    BusinessEmail = customer.Email,
                    Businessname = "Website Customer",
                    Businessrole = roleData.RoleId,
                    BusinessGst = "notgstno",
                    BusinessPan = "customerpan",
                    BusinessroleName = roleData.RoleName,
                    IsActiveBusiness = true,
                    PasswordHash = PasswordHelper.HashPassword(customer.Password),
                    IsPartner = false,
                    PartnerId = 0
                };

                _context.MsUsers.Add(user);
                await _context.SaveChangesAsync();
                var userRole = new MsUserRole
                {
                    UserId = user.Id,
                    RoleId = roleData.RoleId
                };

                _context.MsUserRoles.Add(userRole);

                await _context.SaveChangesAsync();
                await transaction.CommitAsync();

                return Ok();
            }
            catch (DbUpdateException ex)
            {
                await transaction.RollbackAsync();

                if (ex.InnerException?.Message.Contains("UQ_Users_Email") == true)
                    return Conflict("User email id already exists.");

                return StatusCode(500, "An error occurred while saving the user.");
            }
            catch (Exception ex)
            {
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
                var currentUser = await _context.MsUsers.FirstOrDefaultAsync(u => u.Email == performerEmail);
                var roleName = _context.MsRoles.Where(role => role.RoleId == updateUserdata.RoleId).First().RoleName;

                var existingUser = await _context.MsUsers.FindAsync(id);
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
                _context.MsUsers.Update(existingUser);
                await _context.SaveChangesAsync();

                var existingAddress = _context.MsAddresses.Where(x => x.UserId == id).FirstOrDefault();

                //var address = new Address
                //{
                existingAddress.UserId = id;
                existingAddress.AddressLine = updateUserdata.Address;
                existingAddress.StateId = updateUserdata.StateId;
                existingAddress.Pincode = _context.Pincodes.Where(pincode => pincode.Id == updateUserdata.PinCodeId).First().PincodeValue;
                existingAddress.City = _context.Cities.Where(city => city.Id == updateUserdata.CityId).First().Name;
                existingAddress.State = _context.Locations.Where(location => location.Id == updateUserdata.StateId).First().Name;
                //};
                _context.MsAddresses.Update(existingAddress);
                await _context.SaveChangesAsync();

                //var existingUserRole = _context.UserRoles.Where(role => role.UserId == id).First();
                ////var userRole = new UserRole
                ////{
                //existingUserRole.RoleId = updateUserdata.RoleId;
                ////};

                var oldRoles = _context.MsUserRoles.Where(ur => ur.UserId == id).ToList();
                _context.MsUserRoles.RemoveRange(oldRoles);
                await _context.SaveChangesAsync();

                _context.MsUserRoles.Add(new MsUserRole
                {
                    UserId = id,
                    RoleId = updateUserdata.RoleId
                });
                await _context.SaveChangesAsync();


                await transaction.CommitAsync();
                return Ok();
            } catch (DbUpdateException ex)
            {
                if (ex.InnerException?.Message.Contains("UQ_Users_Email") == true)
                {
                    return Conflict("User email id already exists.");
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
