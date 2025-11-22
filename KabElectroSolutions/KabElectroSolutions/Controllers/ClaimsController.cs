using KabElectroSolutions.Data;
using KabElectroSolutions.DTOs;
using KabElectroSolutions.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;

namespace KabElectroSolutions.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class ClaimsController : ControllerBase
    {
        private readonly KabElectroSolutionsDbContext _context;
        private readonly ILogger<ClaimsController> _logger;
        public ClaimsController(ILogger<ClaimsController> logger, KabElectroSolutionsDbContext context)
        {
            _logger = logger;
            _context = context;
        }


        [HttpGet("claims")]
        public async Task<IActionResult> GetClaims([FromQuery] int? statusId)
        {
            List<Models.Claim> claims;
            var performerEmail = User?.Identity?.Name ?? "System";
            var user = await _context.Users.FirstOrDefaultAsync(u => u.Email == performerEmail);

            if (statusId != null && statusId > 0)
                claims = await _context.Claims.Where(claim => claim.Status == statusId && user.PartnerId != null ? claim.ServicePartner == user.PartnerId: user.BusinessroleName == "Super Admin").ToListAsync();
            else
            {
                var substatus = _context.SubStatuses.Where(substatus => substatus.Name == "Call Rejected By Service Center").FirstOrDefault();
                claims = await _context.Claims.Where(claim => claim.Status != substatus!.SubStatusId && user.PartnerId != null ? claim.ServicePartner == user.PartnerId : user.BusinessroleName == "Super Admin").ToListAsync();
            }
            var response = new ClaimsResponseDto
            {
                Status = 200,
                Message = "List of calls",
                Data = new ClaimsDataDto
                {
                    Count = claims.Count,
                    Results = claims
                }
            };

            return Ok(response);
        }

        [HttpGet("claim")]
        public async Task<IActionResult> GetClaim([FromQuery] int? claimId)
        {
            if (claimId == null)
            {
                return BadRequest(new
                {
                    Status = 400,
                    Message = "Missing query parameter: claimId"
                });
            }

            var claims = await _context.Claims.Where(c => c.Id == claimId).ToListAsync();
            if (claims == null || claims.Count == 0)
            {
                return NotFound(new
                {
                    Status = 404,
                    Message = $"Claim with ID {claimId} not found"
                });
            }

            var response = new ClaimsResponseDto
            {
                Status = 200,
                Message = "List of calls",
                Data = new ClaimsDataDto
                {
                    Count = claims.Count,
                    Results = claims
                }
            };

            return Ok(response);
        }

        [HttpPost]
        public async Task<IActionResult> CreateClaim([FromBody] Models.Claim claim)
        {
            if (claim == null)
                return BadRequest("Invalid claim data");

            _context.Claims.Add(claim);
            await _context.SaveChangesAsync();

            await AddAuditLog("Claim", claim.Id, "Call Registered", claim.Concern);

            return CreatedAtAction(nameof(GetClaim), new { id = claim.Id }, claim);
        }

        private async Task AddAuditLog(string entity, int recordId, string status, string? remarks = "-")
        {
            var performerEmail = User?.Identity?.Name ?? "System";

            var user = await _context.Users.FirstOrDefaultAsync(u => u.Email == performerEmail);

            var log = new AuditLog
            {
                EntityName = entity,
                EntityRecordId = recordId,
                Status = status,
                PerformerName = user?.Firstname + " " + user?.Lastname,
                Designation = user?.BusinessroleName!,
                Timestamp = DateTime.UtcNow,
                Remarks = remarks
            };

            _context.AuditLogs.Add(log);
            await _context.SaveChangesAsync();
        }

        [HttpPatch("{id}")]
        public async Task<IActionResult> UpdateClaimStatus(int id, [FromBody] Models.Claim claim)
        {
            if (claim == null)
                return BadRequest("Invalid claim data");

            var existingClaim = await _context.Claims.FindAsync(id);
            if (existingClaim == null)
                return NotFound("Claim not found");

            existingClaim.Status = claim.Status;

            _context.Entry(existingClaim).Property(x => x.Status).IsModified = true;
            await _context.SaveChangesAsync();

            return Ok(existingClaim);
        }

        [HttpPost("AcceptOrRejectClaim/{id}/{status}/{remarks}")]
        public async Task<IActionResult> AcceptOrRejectClaim(int id, string status, string? remarks="")
        {
            if (id == 0)
                return BadRequest("Invalid claim id");

            var existingClaim = await _context.Claims.FindAsync(id);
            if (existingClaim == null)
                return NotFound("Claim not found");           

            existingClaim.PreviousStatus = existingClaim.Status;
                existingClaim.StatusName = status;
            existingClaim.Status = _context.SubStatuses.Where(substatus => substatus.Name == status).First().SubStatusId;
            _context.Entry(existingClaim).Property(x => x.Status).IsModified = true;
            _context.Entry(existingClaim).Property(x => x.StatusName).IsModified = true;
            _context.Entry(existingClaim).Property(x => x.PreviousStatus).IsModified = true;
            await _context.SaveChangesAsync();
            await AddAuditLog("Claim", id, status, remarks);

            var claims = await _context.Claims.Where(c => c.Id == id).ToListAsync();
            
            var response = new ClaimsResponseDto
            {
                Status = 200,
                Message = "List of calls",
                Data = new ClaimsDataDto
                {
                    Count = claims.Count,
                    Results = claims
                }
            };

            return Ok(response);
        }

        [HttpPost("AssignPartner/{id}/{status}/{partnerId}/{remarks}")]
        public async Task<IActionResult> AssignPartner(int id, string status,int partnerId, string? remarks = "")
        {
            if (id == 0)
                return BadRequest("Invalid claim id");

            if (partnerId == 0)
                return BadRequest("Invalid partner id");

            var existingClaim = await _context.Claims.FindAsync(id);
            if (existingClaim == null)
                return NotFound("Claim not found");

            var partner = await _context.ServicePartner.FindAsync(partnerId);

            existingClaim.PreviousStatus = existingClaim.Status;
            existingClaim.StatusName = status;
            existingClaim.Status = _context.SubStatuses.Where(substatus => substatus.Name == status).First().SubStatusId;
            existingClaim.ServicePartner = partnerId;
            existingClaim.ServicePartnerAddress = partner.Address;
            existingClaim.ServicePartnerPhone = partner.Phone;
            existingClaim.ServicePartnerGST = partner.Gst;
            existingClaim.ServicePartnerName = partner.ServicePartner;
            existingClaim.ServicePartnerPAN = partner.Pan;
            existingClaim.ServicePartnerPincode = _context.Pincodes.Where(pincode => pincode.Id == partner.PinCodeId).FirstOrDefault().PincodeValue;
            existingClaim.ServicePartnerState = _context.Locations.Where(state => state.Id == partner.StateId).FirstOrDefault().Name;
            existingClaim.ServicePartnerCity = _context.Cities.Where(city => city.Id == partner.CityId).FirstOrDefault().Name;

            _context.Entry(existingClaim).Property(x => x.Status).IsModified = true;
            _context.Entry(existingClaim).Property(x => x.StatusName).IsModified = true;
            _context.Entry(existingClaim).Property(x => x.PreviousStatus).IsModified = true;
            _context.Entry(existingClaim).Property(x => x.ServicePartner).IsModified = true;
            _context.Entry(existingClaim).Property(x => x.ServicePartnerAddress).IsModified = true;
            _context.Entry(existingClaim).Property(x => x.ServicePartnerPhone).IsModified = true;
            _context.Entry(existingClaim).Property(x => x.ServicePartnerGST).IsModified = true;
            _context.Entry(existingClaim).Property(x => x.ServicePartnerName).IsModified = true;
            _context.Entry(existingClaim).Property(x => x.ServicePartnerPAN).IsModified = true;
            _context.Entry(existingClaim).Property(x => x.ServicePartnerPincode).IsModified = true;
            _context.Entry(existingClaim).Property(x => x.ServicePartnerState).IsModified = true;
            _context.Entry(existingClaim).Property(x => x.ServicePartnerCity).IsModified = true;

            await _context.SaveChangesAsync();
            await AddAuditLog("Claim", id, status, remarks);

            var claims = await _context.Claims.Where(c => c.Id == id).ToListAsync();

            var response = new ClaimsResponseDto
            {
                Status = 200,
                Message = "List of calls",
                Data = new ClaimsDataDto
                {
                    Count = claims.Count,
                    Results = claims
                }
            };

            return Ok(response);
        }

    }
}
