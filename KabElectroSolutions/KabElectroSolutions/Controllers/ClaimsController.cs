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
            try
            {
                List<Models.Claim> claims;
                var performerEmail = User?.Identity?.Name ?? "System";
                var user = await _context.Users.FirstOrDefaultAsync(u => u.Email == performerEmail);
                if (user.BusinessroleName == "Super Admin")
                {

                    if (statusId != null && statusId > 0)
                    {
                        var substatus = _context.SubStatuses.Where(substatus => substatus.SubStatusId == statusId).FirstOrDefault();
                        if (substatus.Name == "Claim Verified")
                            claims = await _context.Claims.Where(claim => claim.Status == statusId || claim.StatusName == "Appointment Taken" || claim.StatusName == "Visit Done").ToListAsync();
                        else
                            claims = await _context.Claims.Where(claim => claim.Status == statusId).ToListAsync();

                    }
                    else
                    {
                        var substatus = _context.SubStatuses.Where(substatus => substatus.Name == "Call Rejected By Service Center").FirstOrDefault();
                        claims = await _context.Claims.Where(claim => claim.Status != substatus!.SubStatusId).ToListAsync();
                    }
                }
                else if (user.BusinessroleName == "Brand")
                {

                    if (statusId != null && statusId > 0)
                    {
                        var substatus = _context.SubStatuses.Where(substatus => substatus.SubStatusId == statusId).FirstOrDefault();
                        if (substatus.Name == "Claim Verified")
                            claims = await _context.Claims.Where(claim =>  claim.RegisteredBy == user.Id && claim.Status == statusId || claim.StatusName == "Appointment Taken" || claim.StatusName == "Visit Done").ToListAsync();
                        else
                            claims = await _context.Claims.Where(claim => claim.Status == statusId && claim.RegisteredBy == user.Id).ToListAsync();

                    }
                    else
                    {
                        var substatus = _context.SubStatuses.Where(substatus => substatus.Name == "Call Rejected By Service Center").FirstOrDefault();
                        claims = await _context.Claims.Where(claim => claim.Status != substatus!.SubStatusId && claim.RegisteredBy == user.Id).ToListAsync();
                    }
                }
                else
                {
                    if (statusId != null && statusId > 0)
                    {
                        var substatus = _context.SubStatuses.Where(substatus => substatus.SubStatusId == statusId).FirstOrDefault();
                        if (substatus.Name == "Claim Verified")
                            claims = await _context.Claims.Where(claim => claim.ServicePartner == user.PartnerId && claim.Status == statusId || claim.StatusName == "Appointment Taken").ToListAsync();
                        else
                            claims = await _context.Claims.Where(claim => claim.Status == statusId && claim.ServicePartner == user.PartnerId).ToListAsync();
                    }
                    else
                    {
                        var substatus = _context.SubStatuses.Where(substatus => substatus.Name == "Call Rejected By Service Center").FirstOrDefault();
                        claims = await _context.Claims.Where(claim => claim.Status != substatus!.SubStatusId && claim.ServicePartner == user.PartnerId).ToListAsync();
                    }
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
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
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

        [HttpGet("GetNotes/{claimId}")]
        public async Task<IActionResult> GetNotes(int claimId)
        {
            var notes = await _context.Notes
                .Where(n => n.ClaimId == claimId)
                .OrderBy(n => n.TimeStamp)
                .Select(n => new Note  // returning DTO
                {
                    Id = n.Id,
                    ClaimId = n.ClaimId,
                    Message = n.Message,
                    UserName = n.UserName,
                    Role = n.Role,
                    TimeStamp = n.TimeStamp
                })
                .ToListAsync();

            return Ok(notes);
        }

        [HttpPost]
        public async Task<IActionResult> CreateClaim([FromBody] Models.Claim? claim)
        {
         
            if (claim == null)
                return BadRequest("Invalid claim data");
            try
            {
                var performerEmail = User?.Identity?.Name;
                var user = await _context.Users.FirstOrDefaultAsync(u => u.Email == performerEmail);
                //var servicePartner = _context.ServicePartner.Where(s => s.Id == user.PartnerId).FirstOrDefault().ServicePartner;
                var subStatus = _context.SubStatuses.Where(x => x.Name == "Call Initiated").First();
                claim.ChannelId = user.Id;
                claim.ChannelName = user.Businessname;
                claim.CreatedTime = TimeOnly.FromDateTime(DateTime.Now);
                claim.Status = subStatus.SubStatusId;
                claim.StatusName = subStatus.Name;
                claim.PreviousStatus = subStatus.SubStatusId;
                claim.CreatedDate = DateOnly.FromDateTime(DateTime.Now);
                claim.StoreName = user.Businessname;
                claim.RegisteredBy = user.Id;
                claim.RegisteredByName = user.Firstname + " " + user.Lastname;
                _context.Claims.Add(claim);
                await _context.SaveChangesAsync();

                await AddAuditLog("Claim", claim.Id, "Call Registered", claim.Concern);

                return CreatedAtAction(nameof(GetClaim), new { id = claim.Id }, claim);
            }
            catch (Exception ex) {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }

        [HttpPost("AddNote")]
        public async Task<IActionResult> AddNote([FromBody] Note note)
        {
            if (note == null)
                return BadRequest("Invalid note data.");

            // Set timestamp here to avoid dependency on client
            note.TimeStamp = DateTime.Now;

            _context.Notes.Add(note);
            await _context.SaveChangesAsync();

            return Ok(new { message = "Note added successfully", note.Id });
        }

        [HttpPost("upload-images")]
        [Consumes("multipart/form-data")]
        public async Task<IActionResult> UploadClaimImages([FromForm] ClaimImageUploadRequest request)
        {
            using var transaction = await _context.Database.BeginTransactionAsync();
            try
            {
                var performerEmail = User?.Identity?.Name;
                var user = await _context.Users.FirstOrDefaultAsync(u => u.Email == performerEmail);
                request.CreatedBy = user.Firstname + " " + user.Lastname;

                var entries = new List<ClaimImage>();

                if (request.EstimationImage != null)
                    entries.Add(await CreateRow(request, request.EstimationImage, "Estimation"));

                if (request.ProductSerialNumber != null)
                    entries.Add(await CreateRow(request, request.ProductSerialNumber, "ProductSerialNumber"));

                if (request.ProductImage != null)
                    entries.Add(await CreateRow(request, request.ProductImage, "ProductImage"));

                if (request.ProductDefectImage != null)
                    entries.Add(await CreateRow(request, request.ProductDefectImage, "ProductDefectImage"));

                // Multiple OthersImages
                if (request.OthersImages != null)
                {
                    foreach (var file in request.OthersImages)
                    {
                        entries.Add(await CreateRow(request, file, "Others"));
                    }
                }

                _context.ClaimImages.AddRange(entries);
                await _context.SaveChangesAsync();

                var existingClaim = await _context.Claims.FindAsync(request.ClaimId);
                if (existingClaim == null)
                    return NotFound("Claim not found");

                await UpdateStatus(request.ClaimId, "Visit Done", "Visit Done", existingClaim);
                await transaction.CommitAsync();


                return Ok(new { message = "Images saved", total = entries.Count });
            }
            catch(Exception ex)
            {
                await transaction.RollbackAsync();
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }

        private async Task<ClaimImage> CreateRow(ClaimImageUploadRequest req, IFormFile file, string type)
        {
            using var ms = new MemoryStream();
            await file.CopyToAsync(ms);

            return new ClaimImage
            {
                ClaimId = req.ClaimId,
                ImageType = type,
                ImageData = ms.ToArray(),
                Remarks = req.Remarks,
                CreatedAt = DateTime.UtcNow,
                CreatedBy = req.CreatedBy
            };
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

            await UpdateStatus(id, status, remarks, existingClaim);

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

        private async Task UpdateStatus(int id, string status, string? remarks, Models.Claim existingClaim)
        {
            existingClaim.PreviousStatus = existingClaim.Status;
            existingClaim.StatusName = status;
            existingClaim.Status = _context.SubStatuses.Where(substatus => substatus.Name == status).First().SubStatusId;
            _context.Entry(existingClaim).Property(x => x.Status).IsModified = true;
            _context.Entry(existingClaim).Property(x => x.StatusName).IsModified = true;
            _context.Entry(existingClaim).Property(x => x.PreviousStatus).IsModified = true;
            await _context.SaveChangesAsync();
            await AddAuditLog("Claim", id, status, remarks);
        }

        [HttpPost("ScheduleAppointment/{id}/{status}/{remarks}")]
        public async Task<IActionResult> ScheduleAppointment([FromBody] AppointmentRequest appointment, int id, string status, string? remarks = "")
        {
            if (id == 0)
                return BadRequest("Invalid claim id");

            var existingClaim = await _context.Claims.FindAsync(id);
            if (existingClaim == null)
                return NotFound("Claim not found");

            existingClaim.PreviousStatus = existingClaim.Status;
            existingClaim.StatusName = status;
            existingClaim.Status = _context.SubStatuses.Where(substatus => substatus.Name == status).First().SubStatusId;
            existingClaim.AppointmentConfirmationTime = appointment.AppointmentDate.Value.ToDateTime(appointment.AppointmentTime.Value); ;
            existingClaim.Appointment = appointment.AppointmentDate;
            existingClaim.AppointmentPendingReason = appointment.PendingReason;
            _context.Entry(existingClaim).Property(x => x.Status).IsModified = true;
            _context.Entry(existingClaim).Property(x => x.StatusName).IsModified = true;
            _context.Entry(existingClaim).Property(x => x.PreviousStatus).IsModified = true;
            _context.Entry(existingClaim).Property(x => x.AppointmentConfirmationTime).IsModified = true;
            _context.Entry(existingClaim).Property(x => x.Appointment).IsModified = true;
            _context.Entry(existingClaim).Property(x => x.AppointmentPendingReason).IsModified = true;
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
       
        [HttpPost("ShareEstimation/{id}/{status}/{remarks}")]
        public async Task<IActionResult> CreateEstimation([FromForm] EstimationDetailDto dto)
        {
            var estimation = new EstimationDetail
            {
                ClaimId = dto.ClaimId,
                ClaimType = dto.ClaimType,
                Observation = dto.Observation,
                Symptom = dto.Symptom,
                Type = dto.Type,
                Material = dto.Material,
                HSNCode = dto.HSNCode,
                Price = dto.Price,
                TaxPercent = dto.TaxPercent,
                Remarks = dto.Remarks,
                CreatedAt = DateTime.UtcNow
            };

            if (dto.Images is not null && dto.Images.Count > 0)
            {
                foreach (var file in dto.Images)
                {
                    await using var ms = new MemoryStream();
                    await file.CopyToAsync(ms);

                    var image = new EstimationImage
                    {
                        ClaimId = dto.ClaimId,
                        Image = ms.ToArray(),
                        FileName = file.FileName,
                        CreatedAt = DateTime.UtcNow
                    };

                    estimation.Images.Add(image);
                }
            }

            _context.EstimationDetails.Add(estimation);
            await _context.SaveChangesAsync();

            return Ok(new { estimation.Id, Message = "Estimation created successfully." });
        }


    }
}
