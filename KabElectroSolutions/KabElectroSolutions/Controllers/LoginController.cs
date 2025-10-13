using KabElectroSolutions.Data;
using KabElectroSolutions.Helper;
using KabElectroSolutions.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace KabElectroSolutions.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoginController : ControllerBase
    {
        private readonly KabElectroSolutionsDbContext _context;
        private readonly ILogger<LoginController> _logger;
        private readonly IConfiguration _config;

        public LoginController(ILogger<LoginController> logger, KabElectroSolutionsDbContext context, IConfiguration config)
        {
            _logger = logger;
            _context = context;
            _config = config;
        }

        [HttpPost("login")]
        public async Task<IActionResult> Login([FromBody] LoginRequest request)
        {
            if (string.IsNullOrEmpty(request.Username) || string.IsNullOrEmpty(request.Password))
            {
                return BadRequest(new { status = 400, message = "Username and password are required." });
            }

            // Simulate user lookup
            var user = await _context.Users.FirstOrDefaultAsync(u => u.Email == request.Username);
            var passwordHash = PasswordHelper.HashPassword(request.Password);

            if (user == null || !PasswordHelper.VerifyPassword(request.Password, user.PasswordHash))
                return Unauthorized(new { status = 401, message = "Invalid credentials" });

            // Load address and business address
            var address = await _context.Addresses.FirstOrDefaultAsync(a => a.UserId == user.Id && !a.IsBusinessAddress);
            var businessAddress = await _context.Addresses.FirstOrDefaultAsync(a => a.UserId == user.Id && a.IsBusinessAddress);

            // Load roles
            var roles = await _context.UserRoles
                .Where(r => r.UserId == user.Id)
                .Select(r => r.RoleId)
                .ToListAsync();

            // Load role name map
            var roleNameMap = await _context.Roles
                .AsNoTracking()
                .Where(r => roles.Contains(r.RoleId))
                .Select(r => new { r.RoleId, r.RoleName })
                .ToDictionaryAsync(r => r.RoleId.ToString(), r => r.RoleName);

            // Load privileges
            var privileges = await _context.UserPrivileges
                .Where(p => p.UserId == user.Id)
                .Select(p => (int?)p.PrivilegeId)
                .ToListAsync();

            var claims = new List<System.Security.Claims.Claim> { new System.Security.Claims.Claim(ClaimTypes.Name, request.Username) };
            claims.AddRange(roleNameMap.Select(role => new System.Security.Claims.Claim(ClaimTypes.Role, role.Value)));

            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config["Jwt:Key"]));
            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var token = new JwtSecurityToken(
                issuer: _config["Jwt:Issuer"],
                audience: _config["Jwt:Audience"],
                claims: claims,
                expires: DateTime.UtcNow.AddHours(2),
                signingCredentials: creds);

            // Response formatting
            var response = new
            {
                status = 200,
                message = "user details",
                token = new JwtSecurityTokenHandler().WriteToken(token),
                data = new
                {
                    id = user.Id,
                    firstname = user.Firstname,
                    lastname = user.Lastname,
                    image = user.Image,
                    address = new
                    {
                        address = address?.AddressLine,
                        location = address?.Location,
                        pincode = address?.Pincode,
                        latitude = address?.Latitude,
                        longitude = address?.Longitude,
                        city = address?.City,
                        state = address?.State
                    },
                    business = user.Business,
                    business_phone = user.BusinessPhone,
                    business_email = user.BusinessEmail,
                    businessname = user.Businessname,
                    businessrole = user.Businessrole,
                    business_gst = user.BusinessGst,
                    business_pan = user.BusinessPan,
                    business_address = new
                    {
                        address = businessAddress?.AddressLine,
                        location = businessAddress?.Location,
                        pincode = businessAddress?.Pincode,
                        latitude = businessAddress?.Latitude,
                        longitude = businessAddress?.Longitude,
                        city = businessAddress?.City,
                        state = businessAddress?.State
                    },
                    empid = user.Empid,
                    roles = roles,
                    roles_name_map = roleNameMap,
                    phone = user.Phone,
                    email = user.Email,
                    manager = user.Manager,
                    authtoken = user.Authtoken,
                    privileges = privileges,
                    executive_id = user.ExecutiveId,
                    channel_name = user.ChannelName,
                    businessrole_name = user.BusinessroleName,
                    is_active_business = user.IsActiveBusiness ? 1 : 0
                }
            };

            return Ok(response);
        }
    }
}
