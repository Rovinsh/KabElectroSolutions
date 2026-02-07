using Azure.Core;
using ClosedXML.Excel;
using DocumentFormat.OpenXml.Office2010.Excel;
using DocumentFormat.OpenXml.Spreadsheet;
using DocumentFormat.OpenXml.Wordprocessing;
using ExcelDataReader;
using KabElectroSolutions.Data;
using KabElectroSolutions.DTOs;
using KabElectroSolutions.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Data;
using System.Globalization;
using System.IO.Compression;
using System.Net;
using System.Net.Mail;
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
        public async Task<IActionResult> GetClaims([FromQuery] int? statusId, [FromQuery] bool? isReassign= false)
        {
            var validStatusNames = new[]
{
    "Appointment Taken",
    "Visit Done",
    "Estimation Shared",
    "Re Estimate",
    "Estimate Accepted",
    "Repair Completed",
    "Call Closed Without Repair",
    "Repair at Home",
    "Repair at SVC",
    "Invoice Claimed",
    "Invoice Rejected By Service",
    "Invoice Accepted By Service"
};
            var validReAssignStatusNames = new[]
            {
    "Service Centre Assigned",
    "Appointment Taken",
    "Claim Verified"
};


            try
            {
                List<Models.Claim> claims;
                var performerEmail = User?.Identity?.Name ?? "System";
                var user = await _context.Users.FirstOrDefaultAsync(u => u.Email == performerEmail);
                if (user.BusinessroleName == "Super Admin" || user.BusinessroleName == "Customer Care Executive")
                {

                    if (statusId != null && statusId > 0)
                    {
                        var substatus = _context.SubStatuses.Where(substatus => substatus.SubStatusId == statusId).FirstOrDefault();
                        if (substatus.Name == "Claim Verified")
                            claims = await _context.Claims.Where(claim => claim.Status == statusId || validStatusNames.Contains(claim.StatusName)).ToListAsync();
                        else
                        {
                            if (isReassign !=null && isReassign == true)
                            {
                                claims = await _context.Claims.Where(claim => validReAssignStatusNames.Contains(claim.StatusName)).ToListAsync();
                            }
                            else
                            claims = await _context.Claims.Where(claim => claim.Status == statusId).ToListAsync();
                        }

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
                            claims = await _context.Claims.Where(claim => claim.RegisteredBy == user.Id && (claim.Status == statusId || validStatusNames.Contains(claim.StatusName))).ToListAsync();
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
                            claims = await _context.Claims.Where(claim => claim.ServicePartner == user.PartnerId && (claim.Status == statusId || validStatusNames.Contains(claim.StatusName))).ToListAsync();
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


        [HttpGet("GetClaimsByPhoneNumber/{phoneNumber}")]
        public async Task<IActionResult> GetClaimsByPhoneNumber(string phoneNumber)
        {
            try
            {
                var claims = await _context.Claims.Where(claim => claim.CustomerPhone == phoneNumber).ToListAsync();

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
            catch (Exception ex)
            {
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

                var partner = await _context.ServicePartner.FindAsync(existingClaim.ServicePartner);

                var subject = partner!.ServicePartner + " customer visit is done for claim number " +request.ClaimId+ ".";
                var body = "<!DOCTYPE html>\r\n<html>\r\n<body style=\"font-family: Arial, Helvetica, sans-serif; background-color: #f6f6f6; padding: 20px;\">\r\n    <table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\r\n        <tr>\r\n            <td align=\"center\">\r\n                <table width=\"600\" cellpadding=\"20\" cellspacing=\"0\" style=\"background-color: #ffffff; border-radius: 6px;\">\r\n                    <tr>\r\n                        <td style=\"font-size: 14px; color: #333333;\">\r\n                            <p style=\"margin-top: 0;\">\r\n                                Hi <strong>" + partner.ServicePartner + "</strong>,\r\n                            </p>\r\n\r\n                            <p>\r\n                                Your technician has visited the customers place for claim number \r\n<strong>" + request.ClaimId + "</strong>.\r\n                            </p>\r\n\r\n         <p>Kindly share the estimation for the same.</p>                   <p>\r\n                                In case of any queries, please call on\r\n                                <strong>+91-8433112032</strong>\r\n                                or alternatively, write to us at\r\n                                <a href=\"mailto:support@kabelectro.in\" style=\"color: #1a73e8;\">\r\n                                    support@kabelectro.in\r\n                                </a>.\r\n                            </p>\r\n\r\n                            <br>\r\n\r\n                            <p style=\"margin-bottom: 0;\">\r\n                                Thank You,<br>\r\n                                <strong>Team KAB Electro</strong>\r\n                            </p>\r\n                        </td>\r\n                    </tr>\r\n                </table>\r\n\r\n                <p style=\"font-size: 12px; color: #999999; margin-top: 10px;\">\r\n                    This is an automated email. Please do not reply.\r\n                </p>\r\n            </td>\r\n        </tr>\r\n    </table>\r\n</body>\r\n</html>\r\n";
               
                await SendEmailAsync(partner.Email, subject, body);

                return Ok(new { message = "Images saved", total = entries.Count });
            }
            catch (Exception ex)
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
                CreatedAt = DateTime.Now,
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
                Timestamp = DateTime.Now,
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

        [HttpPost("AcceptOrRejectClaim/{id}/{status}/{remarks?}/{utr?}")]
        public async Task<IActionResult> AcceptOrRejectClaim(int id, string status, string? remarks = "", string? utr = "")
        {
            if (id == 0)
                return BadRequest("Invalid claim id");

            var existingClaim = await _context.Claims.FindAsync(id);
            if (existingClaim == null)
                return NotFound("Claim not found");

            await UpdateStatus(id, status, remarks, existingClaim,utr);

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

        private async Task UpdateStatus(int id, string status, string? remarks, Models.Claim existingClaim, string? utr="")
        {
            existingClaim.PreviousStatus = existingClaim.Status;
            existingClaim.StatusName = status;
            existingClaim.Status = _context.SubStatuses.Where(substatus => substatus.Name == status).First().SubStatusId;
            _context.Entry(existingClaim).Property(x => x.Status).IsModified = true;
            _context.Entry(existingClaim).Property(x => x.StatusName).IsModified = true;
            _context.Entry(existingClaim).Property(x => x.PreviousStatus).IsModified = true;
            if (status == "Invoice Rejected By Service")
            {
                var partner = await _context.ServicePartner.FindAsync(existingClaim.ServicePartner);
                var invoice = await _context.InvoiceDetails.FirstOrDefaultAsync(x => x.ClaimId == id && !x.IsRejected);
                invoice!.IsRejected = true;
                invoice.RejectReason = remarks;
                await _context.SaveChangesAsync();                

                var subject = "Invoice rejected for claim number " + id;
                var body = "<!DOCTYPE html>\r\n<html>\r\n<head>\r\n  <meta charset=\"UTF-8\">\r\n  <title>Invoice Rejected</title>\r\n</head>\r\n<body style=\"margin:0; padding:0; background-color:#ffffff; font-family:Arial, Helvetica, sans-serif;\">\r\n\r\n  <table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color:#ffffff;\">\r\n    <tr>\r\n      <td align=\"center\">\r\n\r\n        <!-- Main Container -->\r\n        <table width=\"600\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse:collapse; border:1px solid #e0e0e0;\">\r\n\r\n          <!-- Header -->\r\n          <tr>\r\n            <td style=\"padding:15px 20px; border-bottom:4px solid #4cc3d9;\">\r\n              <table width=\"100%\">\r\n                <tr>\r\n                  <td align=\"right\">\r\n                    <img src=\"https://kabelectro.in/attached_assets/logo_1756027620126.png\" alt=\"KAB Electro\" height=\"30\" />\r\n                  </td>\r\n                </tr>\r\n              </table>\r\n            </td>\r\n          </tr>\r\n\r\n          <!-- Body -->\r\n          <tr>\r\n            <td style=\"background-color:#f2fbfd; padding:25px 20px; color:#333333; font-size:14px; line-height:22px;\">\r\n\r\n              <p style=\"margin:0 0 15px 0; color:#f57c00; font-size:16px;\">\r\n                <strong>Dear Partner</strong>\r\n              </p>\r\n\r\n              <p style=\"margin:0 0 12px 0;\">\r\n                Greetings from KAB Electro!!!\r\n              </p>\r\n\r\n              <p style=\"margin:0 0 12px 0;\">\r\n                This is in reference to the Invoice Number <strong>"+invoice.InvoiceNumber+"</strong> against the Claim Code\r\n                <strong>"+id+"</strong>.\r\n              </p>\r\n\r\n              <p style=\"margin:0 0 12px 0;\">\r\n                We would like to intimate that the invoice has been <strong>rejected</strong> due to\r\n                <strong>"+remarks+"</strong>.\r\n              </p>\r\n\r\n              <p style=\"margin:0;\">\r\n                Further, we request to rectify the issue and upload the correct invoice as per the requirement.\r\n                Your cooperation and support is highly appreciated in this regard.\r\n              </p>\r\n\r\n            </td>\r\n          </tr>\r\n\r\n          <!-- Footer -->\r\n          <tr>\r\n            <td style=\"background-color:#4cc3d9; padding:12px 20px; color:#ffffff; font-size:13px;\">\r\n              <strong>Thanks</strong><br>\r\n              Team KAB Electro\r\n            </td>\r\n          </tr>\r\n\r\n        </table>\r\n        <!-- End Container -->\r\n\r\n      </td>\r\n    </tr>\r\n  </table>\r\n\r\n</body>\r\n</html>\r\n";                
                await SendEmailAsync(partner.Email, subject, body);
            }
            if (status == "Re Estimate")
            {
                await _context.EstimationImages.Where(x => x.ClaimId == id).ExecuteDeleteAsync();
                await _context.SaveChangesAsync();
            }
            if (status == "Call Closed")
            {
                existingClaim.UtrNumber = utr;
                _context.Entry(existingClaim).Property(x => x.UtrNumber).IsModified = true;
                await _context.SaveChangesAsync();
            }

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
        public async Task<IActionResult> AssignPartner(int id, string status, int partnerId, string? remarks = "")
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
            var subject = partner.ServicePartner + " new claim assigned to you.";
            var  body = "<!DOCTYPE html>\r\n<html>\r\n<body style=\"font-family: Arial, Helvetica, sans-serif; background-color: #f6f6f6; padding: 20px;\">\r\n    <table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\r\n        <tr>\r\n            <td align=\"center\">\r\n                <table width=\"600\" cellpadding=\"20\" cellspacing=\"0\" style=\"background-color: #ffffff; border-radius: 6px;\">\r\n                    <tr>\r\n                        <td style=\"font-size: 14px; color: #333333;\">\r\n                            <p style=\"margin-top: 0;\">\r\n                                Hi <strong>" + partner.ServicePartner + "</strong>,\r\n                            </p>\r\n\r\n                            <p>\r\n                                New claim with claim ID\r\n                                <strong>" + id + "</strong>\r\n                                is assigned to you.\r\n                            </p>\r\n\r\n                            <p>\r\n                                In case of any queries, please call on\r\n                                <strong>+91-8433112032</strong>\r\n                                or alternatively, write to us at\r\n                                <a href=\"mailto:support@kabelectro.in\" style=\"color: #1a73e8;\">\r\n                                    support@kabelectro.in\r\n                                </a>.\r\n                            </p>\r\n\r\n                            <br>\r\n\r\n                            <p style=\"margin-bottom: 0;\">\r\n                                Thank You,<br>\r\n                                <strong>Team KAB Electro</strong>\r\n                            </p>\r\n                        </td>\r\n                    </tr>\r\n                </table>\r\n\r\n                <p style=\"font-size: 12px; color: #999999; margin-top: 10px;\">\r\n                    This is an automated email. Please do not reply.\r\n                </p>\r\n            </td>\r\n        </tr>\r\n    </table>\r\n</body>\r\n</html>\r\n";

            await SendEmailAsync(partner.Email, subject, body);

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

        private async Task SendEmailAsync(string email, string subject, string body)
        {
            using var smtpClient = new SmtpClient("smtp.titan.email")
            {
                Port = 587,
                Credentials = new NetworkCredential(
                    "chetan.sharma@kabelectro.in",
                    "Kab@8433112032"
                ),
                EnableSsl = true
            };

            using var mailMessage = new MailMessage
            {
                From = new MailAddress("chetan.sharma@kabelectro.in", "KAB Electro"),
                Subject = subject,
                Body = body,
                IsBodyHtml = true
            };

            mailMessage.To.Add(email);
            try
            {
                await smtpClient.SendMailAsync(mailMessage);
            }
            catch (SmtpException ex)
            {
                // ❌ SMTP-level failure
            }
            catch (Exception ex)
            {
                // ❌ Unexpected failure
            }
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
                CreatedAt = DateTime.Now
            };
            using var transaction = await _context.Database.BeginTransactionAsync();

            try
            {
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
                            CreatedAt = DateTime.Now
                        };

                        estimation.Images.Add(image);
                    }
                }

                await _context.EstimationDetails.Where(x => x.ClaimId == dto.ClaimId).ExecuteDeleteAsync();
                await _context.EstimationImages.Where(x => x.ClaimId == dto.ClaimId).ExecuteDeleteAsync();


                _context.EstimationDetails.Add(estimation);
                await _context.SaveChangesAsync();
                await transaction.CommitAsync();

                return Ok(new { estimation.Id, Message = "Estimation created successfully." });
            }
            catch
            {
                await transaction.RollbackAsync();
                throw;
            }
        }

        [HttpPost("ShareEstimate")]
        public async Task<IActionResult> ShareEstimation([FromForm] ShareEstimationDetailDto dto)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            using var transaction = await _context.Database.BeginTransactionAsync();
            try
            {

                var estimations = new List<EstimationDetail>();

                if (dto.Items != null)
                {
                    foreach (var item in dto.Items)
                    {
                        var estimation = new EstimationDetail
                        {
                            ClaimId = dto.ClaimId,
                            ClaimType = dto.ClaimType,
                            Observation = dto.Observation,
                            Symptom = dto.Symptom,
                            Type = item.Type,
                            Material = item.Material,
                            HSNCode = item.HSNCode,
                            Price = item.Price,
                            TaxPercent = item.TaxPercent,
                            Remarks = dto.Remarks,
                            CreatedAt = DateTime.Now
                        };

                        estimations.Add(estimation);
                        _context.EstimationDetails.Add(estimation);
                    }
                }

                await _context.SaveChangesAsync();

                if (dto.Images != null && dto.Images.Count > 0)
                {
                    foreach (var file in dto.Images)
                    {
                        using var ms = new MemoryStream();
                        await file.CopyToAsync(ms);

                        var imageRequest = new EstimationImage
                        {
                            ClaimId = dto.ClaimId,
                            EstimationId = 1,
                            FileName = file.FileName,
                            Image = ms.ToArray(),
                            CreatedAt = DateTime.Now
                        };

                        _context.EstimationImages.Add(imageRequest);
                    }

                    await _context.SaveChangesAsync();
                }

                var existingClaim = await _context.Claims.FindAsync(dto.ClaimId);
                await UpdateStatus(dto.ClaimId, "Estimation Shared", "Estimation Shared", existingClaim);
                await transaction.CommitAsync();

                return Ok(new { Message = "Estimation created successfully." });
            }
            catch (Exception ex)
            {
                await transaction.RollbackAsync();
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }

        [HttpPost("ClaimRepair")]
        public async Task<IActionResult> ClaimRepair(
        [FromBody] CreateClaimRepairDto dto)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            // 🔐 Get UserId from JWT (recommended)
            using var transaction = await _context.Database.BeginTransactionAsync();
            try
            {
                var performerEmail = User?.Identity?.Name;
                var user = await _context.Users.FirstOrDefaultAsync(u => u.Email == performerEmail);

                var entity = new ClaimRepairDetail
                {
                    ClaimId = dto.ClaimId,
                    RepairedAt = dto.RepairedAt,
                    Reason = dto.Reason,
                    Remarks = dto.Remarks,
                    ClosureDate = dto.ClosureDate,
                    RepairedByUserId = user.Id,
                    CreatedAt = DateTime.Now
                };

                _context.ClaimRepairDetails.Add(entity);
                await _context.SaveChangesAsync();

                var status = "Repair at Home";
                if (dto.RepairedAt == "Repair Started at Service Center")
                {
                    status = "Repair at SVC";
                }

                var existingClaim = await _context.Claims.FindAsync(dto.ClaimId);
                await UpdateStatus(dto.ClaimId, status, status, existingClaim);
                await transaction.CommitAsync();

                return Ok(new
                {
                    message = "Repair details saved successfully",
                    repairId = entity.RepairId
                });
            }
            catch (Exception ex)
            {
                await transaction.RollbackAsync();
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }

        [HttpPost("CloseWithOrWithoutRepair")]
        public async Task<IActionResult> CloseClaim(
        [FromForm] ClaimCloseRequestDto request)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            using var transaction = await _context.Database.BeginTransactionAsync();
            try
            {
                var performerEmail = User?.Identity?.Name;
                var user = await _context.Users.FirstOrDefaultAsync(u => u.Email == performerEmail);
                var entity = new ClaimClosedWithOrWithoutRepairDetail
                {
                    ClaimId = request.ClaimId,
                    ClaimType = request.ClaimType,
                    Remarks = request.Remarks,

                    JobSheetFileName = request.JobSheet.FileName,
                    JobSheetImage = await ReadFileAsync(request.JobSheet),

                    CustomerSatisfactionFileName = request.CustomerSatisfaction.FileName,
                    CustomerSatisfactionImage = await ReadFileAsync(request.CustomerSatisfaction),
                    CreatedBy = user.Id,
                    CreatedOn = DateTime.Now
                };

                if (request.Additional != null)
                {
                    entity.AdditionalFileName = request.Additional.FileName;
                    entity.AdditionalImage = await ReadFileAsync(request.Additional);
                }

                _context.ClaimClosedWithOrWithoutRepairDetails.Add(entity);
                await _context.SaveChangesAsync();

                var status = "Repair Completed";
                if (request.ClaimType == "Close Without Repair")
                {
                    status = "Call Closed Without Repair";
                }

                var existingClaim = await _context.Claims.FindAsync(request.ClaimId);
                await UpdateStatus(request.ClaimId, status, status, existingClaim);
                await transaction.CommitAsync();

                return Ok(new
                {
                    message = "Claim closed successfully"
                });
            }
            catch (Exception ex)
            {
                await transaction.RollbackAsync();
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }

        }

        [HttpPost("RaiseInvoice")]
        //[Consumes("multipart/form-data")]
        public async Task<IActionResult> RaiseInvoice([FromForm] CreateInvoiceDTO dto)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            if (dto.InvoiceImage.Length == 0)
                return BadRequest("Invoice image is required.");
            using var transaction = await _context.Database.BeginTransactionAsync();
            try
            {
                using var ms = new MemoryStream();
                await dto.InvoiceImage.CopyToAsync(ms);
                var performerEmail = User?.Identity?.Name;
                var user = await _context.Users.FirstOrDefaultAsync(u => u.Email == performerEmail);

                var invoice = new InvoiceDetail
                {
                    ClaimId = dto.ClaimId,
                    InvoiceDate = dto.InvoiceDate,
                    InvoiceNumber = dto.InvoiceNumber,
                    BillAmountBeforeTax = dto.BillAmountBeforeTax,
                    TaxAmount = dto.TaxAmount,
                    TotalBillAmount = dto.TotalBillAmount,
                    Remarks = dto.Remarks,
                    InvoiceFileName = dto.InvoiceImage.FileName,
                    InvoiceImage = ms.ToArray(),
                    IsRejected = dto.IsRejected,
                    CreatedBy = user.Id,
                    CreatedOn = DateTime.Now
                };

                _context.InvoiceDetails.Add(invoice);
                await _context.SaveChangesAsync();
                var existingClaim = await _context.Claims.FindAsync(dto.ClaimId);
                await UpdateStatus(dto.ClaimId, "Invoice Claimed", "Invoice Claimed", existingClaim);
                await transaction.CommitAsync();

                return Ok(new
                {
                    message = "Invoice Raised successfully",
                    invoiceId = invoice.Id
                });
            }
            catch (Exception ex)
            {
                await transaction.RollbackAsync();
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }

        [HttpGet("GetCustomerVisitImages/{claimId}")]
        public async Task<IActionResult> GetCustomerVisitImages(int claimId)
        {
            var images = await _context.ClaimImages
                .Where(x => x.ClaimId == claimId)
                .ToListAsync();

            if (!images.Any())
                return NotFound("No images found for this claim");

            //string ToBase64(byte[] data) =>
            //    $"data:image/jpeg;base64,{Convert.ToBase64String(data)}";

            string ToBase64(byte[] data, string fileName)
            {
                var mimeType = GetMimeTypeFromFileName(fileName);
                return $"data:{mimeType};base64,{Convert.ToBase64String(data)}";
            }

            var response = new ClaimCustomerVisitImagesResponse
            {
                ClaimId = claimId,

                EstimationImage = images
                    .FirstOrDefault(x => x.ImageType == "Estimation")?
                    .ImageData is byte[] est ? ToBase64(est, $"Estimation{GetExtension(est)}") : null,

                ProductSerialNumber = images
                    .FirstOrDefault(x => x.ImageType == "ProductSerialNumber")?
                    .ImageData is byte[] ps ? ToBase64(ps, $"ProductSerialNumber{GetExtension(ps)}") : null,

                ProductImage = images
                    .FirstOrDefault(x => x.ImageType == "ProductImage")?
                    .ImageData is byte[] pi ? ToBase64(pi, $"ProductImage{GetExtension(pi)}") : null,

                ProductDefectImage = images
                    .FirstOrDefault(x => x.ImageType == "ProductDefectImage")?
                    .ImageData is byte[] pd ? ToBase64(pd, $"ProductDefectImage{GetExtension(pd)}") : null,

                Others = images
                    .Where(x => x.ImageType == "Others")
                    .Select(x => ToBase64(x.ImageData, $"Others{GetExtension(x.ImageData)}"))
                    .ToList(),

                Remarks = images.First().Remarks,
                CreatedBy = images.First().CreatedBy,
                CreatedAt = images.First().CreatedAt
            };

            return Ok(response);
        }


        [HttpGet("GetRepairDoneImages/{claimId}")]
        public async Task<IActionResult> GetRepairDoneImages(int claimId)
        {
            var record = await _context.ClaimClosedWithOrWithoutRepairDetails
        .Where(x => x.ClaimId == claimId)
        .FirstOrDefaultAsync();

            if (record == null)
                return NotFound("No record found for this claim");
            //string ToBase64(byte[] data) =>
            //    $"data:image/jpeg;base64,{Convert.ToBase64String(data)}";

            string ToBase64(byte[] data, string fileName)
            {
                var mimeType = GetMimeTypeFromFileName(fileName);
                return $"data:{mimeType};base64,{Convert.ToBase64String(data)}";
            }

            var response = new ClaimClosedWithOrWithoutRepairDTO
            {
                Id = record.Id,
                ClaimId = record.ClaimId,
                ClaimType = record.ClaimType,
                Remarks = record.Remarks,

                JobSheetFileName = record.JobSheetFileName,
                JobSheetImageBase64 = record.JobSheetImage != null ? ToBase64(record.JobSheetImage, record.JobSheetFileName) : null,

                AdditionalFileName = record.AdditionalFileName,
                AdditionalImageBase64 = record.AdditionalImage != null
                    ? ToBase64(record.AdditionalImage, record.AdditionalFileName)
                    : null,

                CustomerSatisfactionFileName = record.CustomerSatisfactionFileName,
                CustomerSatisfactionImageBase64 = record.CustomerSatisfactionImage != null ?
                    ToBase64(record.CustomerSatisfactionImage, record.CustomerSatisfactionFileName) : null,

                CreatedBy = record.CreatedBy,
                CreatedOn = record.CreatedOn
            };

            return Ok(response);
        }

        [HttpGet("GetClaimInvoiceDetail/{claimId}")]
        public async Task<IActionResult> GetClaimInvoiceDetail(int claimId)
        {
            var invoice = await _context.InvoiceDetails
                .Where(x => x.ClaimId == claimId && !x.IsRejected)
                .FirstOrDefaultAsync();

            if (invoice == null)
                return NotFound("Invoice not found");

            //string ToBase64(byte[] data) =>
            //    $"data:image/jpeg;base64,{Convert.ToBase64String(data)}";

            string ToBase64(byte[] data, string fileName)
            {
                var mimeType = GetMimeTypeFromFileName(fileName);
                return $"data:{mimeType};base64,{Convert.ToBase64String(data)}";
            }

            var response = new InvoiceDetailDto
            {
                Id = invoice.Id,
                ClaimId = invoice.ClaimId,
                InvoiceDate = invoice.InvoiceDate,
                InvoiceNumber = invoice.InvoiceNumber,
                BillAmountBeforeTax = invoice.BillAmountBeforeTax,
                TaxAmount = invoice.TaxAmount,
                TotalBillAmount = invoice.TotalBillAmount,
                Remarks = invoice.Remarks,
                InvoiceFileName = invoice.InvoiceFileName,
                InvoiceImageBase64 = invoice.InvoiceImage != null ? ToBase64(invoice.InvoiceImage, invoice.InvoiceFileName) : null,
                IsRejected = invoice.IsRejected,
                CreatedBy = invoice.CreatedBy,
                CreatedOn = invoice.CreatedOn
            };

            return Ok(response);
        }


        [HttpGet("GetClaimEstimationDetails/{claimId}")]
        public async Task<IActionResult> GetEstimationDetails(int claimId)
        {
            var images = await _context.EstimationImages
                .Where(x => x.ClaimId == claimId)
                .ToListAsync();

            string ToBase64(byte[] data, string fileName)
            {
                var mimeType = GetMimeTypeFromFileName(fileName);
                return $"data:{mimeType};base64,{Convert.ToBase64String(data)}";
            }
            var estimationImages = images.Select(x => ToBase64(x.Image, $"{x.FileName}")).ToList();

            var items = await _context.EstimationDetails
                .Where(x => x.ClaimId == claimId)
                .Select(x => new EstimationDetailResponseDto
                {
                    ClaimId = x.ClaimId,
                    Type = x.Type,
                    Material = x.Material,
                    HSNCode = x.HSNCode,
                    Price = x.Price,
                    TaxPercent = x.TaxPercent,
                    TaxAmount = Math.Round(x.Price * x.TaxPercent / 100, 2),
                    TotalCost = Math.Round(
                        x.Price + (x.Price * x.TaxPercent / 100), 2)
                })
                .ToListAsync();

            var response = new EstimationSummaryResponseDto
            {
                Items = items,
                GrandTotal = items.Sum(x => x.TotalCost),
                Images = estimationImages
            };

            return Ok(response);
        }


        [HttpGet("DownloadBulkImages/{claimId}")]
        public async Task<IActionResult> DownloadBulkImages(int claimId)
        {
            var images = await _context.ClaimImages
                .Where(x => x.ClaimId == claimId)
                .ToListAsync();

            var repairImage = await _context.ClaimClosedWithOrWithoutRepairDetails
.Where(x => x.ClaimId == claimId)
.FirstOrDefaultAsync();

            var invoice = await _context.InvoiceDetails
                .Where(x => x.ClaimId == claimId && !x.IsRejected)
                .FirstOrDefaultAsync();

            if (!images.Any())
                return BadRequest("No images found");


            using var zipStream = new MemoryStream();

            using (var archive = new ZipArchive(zipStream, ZipArchiveMode.Create, true))
            {
                foreach (var img in images)
                {
                    // Folder structure inside ZIP
                    var fileName = $"Image_{img.ImageType}{GetExtension(img.ImageData)}";
                    var entryPath = $"{img.ImageType}/{fileName}";

                    var entry = archive.CreateEntry(entryPath, CompressionLevel.Fastest);
                    await using var entryStream = entry.Open();
                    await entryStream.WriteAsync(img.ImageData);
                }
                if (repairImage != null)
                {

                    // Folder structure inside ZIP
                    if (repairImage.JobSheetImage != null)
                    {                        
                        var fileName = $"Image_{repairImage.JobSheetFileName}";
                        var entryPath = $"Repair/JobSheet/{fileName}";

                        var entry = archive.CreateEntry(entryPath, CompressionLevel.Fastest);
                        await using var entryStream = entry.Open();
                        await entryStream.WriteAsync(repairImage.JobSheetImage);
                    }
                    if (repairImage.CustomerSatisfactionImage != null)
                    {
                        var fileName = $"Image_{repairImage.CustomerSatisfactionFileName}";
                        var entryPath = $"Repair/CustomerSatisfaction/{fileName}";

                        var entry = archive.CreateEntry(entryPath, CompressionLevel.Fastest);
                        await using var entryStream = entry.Open();
                        await entryStream.WriteAsync(repairImage.CustomerSatisfactionImage);
                    }
                    if (repairImage.AdditionalImage != null)
                    {
                        var fileName = $"Image_{repairImage.AdditionalFileName}";
                        var entryPath = $"Repair/Additional/{fileName}";

                        var entry = archive.CreateEntry(entryPath, CompressionLevel.Fastest);
                        await using var entryStream = entry.Open();
                        await entryStream.WriteAsync(repairImage.AdditionalImage);
                    }
                    if(invoice !=null && invoice.InvoiceImage != null)
                    {
                        var fileName = $"Image_{invoice.InvoiceFileName}";
                        var entryPath = $"Invoice/{fileName}";

                        var entry = archive.CreateEntry(entryPath, CompressionLevel.Fastest);
                        await using var entryStream = entry.Open();
                        await entryStream.WriteAsync(invoice.InvoiceImage);
                    }
                }

            }

            zipStream.Position = 0;

            return File(
                zipStream.ToArray(),
                "application/zip",
                $"Claim_{claimId}_Images.zip"
            );
        }

        string GetExtension(byte[] bytes)
        {
            if (bytes == null || bytes.Length < 4)
                return ".bin";

            // ========== IMAGES ==========
            if (bytes.Take(3).SequenceEqual(new byte[] { 0xFF, 0xD8, 0xFF }))
                return ".jpg";

            if (bytes.Take(8).SequenceEqual(new byte[] { 0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A }))
                return ".png";

            if (bytes.Take(6).SequenceEqual(new byte[] { 0x47, 0x49, 0x46, 0x38, 0x37, 0x61 }) ||
                bytes.Take(6).SequenceEqual(new byte[] { 0x47, 0x49, 0x46, 0x38, 0x39, 0x61 }))
                return ".gif";

            if (bytes.Take(4).SequenceEqual(new byte[] { 0x52, 0x49, 0x46, 0x46 }))
                return ".webp"; // WEBP

            // ========== DOCUMENTS ==========
            if (bytes.Take(4).SequenceEqual(new byte[] { 0x25, 0x50, 0x44, 0x46 }))
                return ".pdf";

            // DOC / XLS / PPT (old MS Office)
            if (bytes.Take(8).SequenceEqual(new byte[]
            {
        0xD0, 0xCF, 0x11, 0xE0, 0xA1, 0xB1, 0x1A, 0xE1
            }))
                return ".doc"; // could be xls/ppt too

            // DOCX / XLSX / PPTX (ZIP based)
            if (bytes.Take(4).SequenceEqual(new byte[] { 0x50, 0x4B, 0x03, 0x04 }))
                return ".docx"; // or xlsx / pptx / zip

            // ========== AUDIO ==========
            if (bytes.Take(3).SequenceEqual(new byte[] { 0x49, 0x44, 0x33 }))
                return ".mp3";

            if (bytes.Take(4).SequenceEqual(new byte[] { 0x52, 0x49, 0x46, 0x46 }))
                return ".wav";

            // ========== VIDEO ==========
            // MP4 / MOV
            if (bytes.Skip(4).Take(4).SequenceEqual(new byte[] { 0x66, 0x74, 0x79, 0x70 }))
                return ".mp4";

            // AVI
            if (bytes.Take(4).SequenceEqual(new byte[] { 0x52, 0x49, 0x46, 0x46 }))
                return ".avi";

            // MKV
            if (bytes.Take(4).SequenceEqual(new byte[] { 0x1A, 0x45, 0xDF, 0xA3 }))
                return ".mkv";

            // ========== ARCHIVES ==========
            if (bytes.Take(2).SequenceEqual(new byte[] { 0x1F, 0x8B }))
                return ".gz";

            if (bytes.Take(4).SequenceEqual(new byte[] { 0x52, 0x61, 0x72, 0x21 }))
                return ".rar";

            if (bytes.Take(4).SequenceEqual(new byte[] { 0x50, 0x4B, 0x03, 0x04 }))
                return ".zip";

            return ".bin";
        }



        [HttpPost("BulkImportClaims")]
        public async Task<IActionResult> BulkImportClaims(IFormFile file)
        {
            if (file == null || file.Length == 0)
                return BadRequest("File is required");

            var userEmail = User?.Identity?.Name;
            var user = await _context.Users.FirstOrDefaultAsync(x => x.Email == userEmail);
            if (user == null)
                return Unauthorized();

            var subStatus = await _context.SubStatuses
                .FirstAsync(x => x.Name == "Call Initiated");

            var claims = new List<Models.Claim>();
            var failedRows = new List<FailedClaimRowDto>();

            using var stream = file.OpenReadStream();
            using var reader = ExcelReaderFactory.CreateReader(stream);
            var table = reader.AsDataSet().Tables[0];

            for (int i = 1; i < table.Rows.Count; i++) // skip header
            {
                var row = table.Rows[i];
                try
                {
                    //var row = table.Rows[i];
                    DateOnly? invoiceDate = null;

                    var value = row[9];

                    if (value == null)
                    {
                        invoiceDate = null;
                    }
                    else if (value is DateTime dateTime) // ⭐ MOST IMPORTANT
                    {
                        invoiceDate = DateOnly.FromDateTime(dateTime);
                    }
                    else if (value is double oaDate) // Excel numeric date
                    {
                        invoiceDate = DateOnly.FromDateTime(DateTime.FromOADate(oaDate));
                    }
                    else
                    {
                        var text = value.ToString()?.Trim();

                        if (!string.IsNullOrEmpty(text) &&
                            DateTime.TryParseExact(
                                text,
                                "dd-MM-yyyy",
                                CultureInfo.InvariantCulture,
                                DateTimeStyles.None,
                                out var dt))
                        {
                            invoiceDate = DateOnly.FromDateTime(dt);
                        }
                    }

                    var dto = new ClaimImportDto
                    {
                        CustomerName = row[0]?.ToString(),
                        CustomerPhone = row[1]?.ToString(),
                        CustomerEmail = row[2]?.ToString(),
                        Concern = row[3]?.ToString(),
                        ItemName = row[4]?.ToString(),
                        ItemBrand = row[5]?.ToString(),
                        ItemSerialNumber = row[6]?.ToString(),
                        InvoiceNumber = row[7]?.ToString(),
                        ItemCategory = row[8]?.ToString(),
                        InvoiceDate = invoiceDate,
                        ItemPrice = decimal.TryParse(row[10]?.ToString(), out var p) ? p : null,
                        Pincode = int.TryParse(row[11]?.ToString(), out var pin) ? pin : null,
                        CustomerCity = row[12]?.ToString(),
                        CustomerState = row[13]?.ToString(),
                        CustomerAddress = row[14]?.ToString()
                    };

                    claims.Add(BuildClaimFromImport(dto, user, subStatus));
                }
                catch (Exception ex)
                {                    
                    failedRows.Add(new FailedClaimRowDto
                    {
                        RowNumber = i + 1,
                        Error = ex.Message+ ex.InnerException,
                        RawData = string.Join(" | ", row.ItemArray)
                    });
                }
            }

            await _context.Claims.AddRangeAsync(claims);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch(Exception ex)
            {
                throw ex;
            }
            foreach (var claim in claims)
            {
                await AddAuditLog(
                    "Claim",
                    claim.Id,              // now populated
                    "Call Registered",
                    claim.Concern
                );
            }

            return Ok(new
            {
                Total = table.Rows.Count - 1,
                Inserted = claims.Count,
                Failed = failedRows.Count,
                FailedRows = failedRows
            });
        }


        [HttpPost("DownloadFailedClaims")]
        public IActionResult DownloadFailedClaims([FromBody] List<FailedClaimRowDto> failedRows)
        {
            if (failedRows == null || !failedRows.Any())
                return BadRequest("No failed rows provided");

            using var workbook = new XLWorkbook();
            var worksheet = workbook.Worksheets.Add("Failed Claims");

            // Header
            worksheet.Cell(1, 1).Value = "RowNumber";
            worksheet.Cell(1, 2).Value = "Error";
            worksheet.Cell(1, 3).Value = "RawData";

            int rowIndex = 2;

            foreach (var row in failedRows)
            {
                worksheet.Cell(rowIndex, 1).Value = row.RowNumber;
                worksheet.Cell(rowIndex, 2).Value = row.Error;
                worksheet.Cell(rowIndex, 3).Value = row.RawData;
                rowIndex++;
            }

            worksheet.Columns().AdjustToContents();

            using var stream = new MemoryStream();
            workbook.SaveAs(stream);
            stream.Position = 0;

            return File(
                stream.ToArray(),
                "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                "FailedClaims.xlsx"
            );
        }


        private Models.Claim BuildClaimFromImport(
            ClaimImportDto dto,
            User user,
            SubStatus subStatus)
        {
            return new Models.Claim
            {
                // From Excel
                CustomerName = dto.CustomerName,
                CustomerPhone = dto.CustomerPhone,
                CustomerEmail = dto.CustomerEmail,
                Concern = dto.Concern,
                ItemName = dto.ItemName,
                ItemBrand = dto.ItemBrand,
                ItemSerialNumber = dto.ItemSerialNumber,
                ItemCategory= dto.ItemCategory,
                InvoiceNumber = dto.InvoiceNumber,
                InvoiceDate = dto.InvoiceDate,
                PlanSoldDate = (DateOnly)dto.InvoiceDate!,
                ItemPrice = dto.ItemPrice ?? 0,
                Pincode = dto.Pincode ?? 0,
                CustomerCity = dto.CustomerCity,
                CustomerState = dto.CustomerState,
                CustomerAddress = dto.CustomerAddress,

                // System controlled (same as CreateClaim)
                ChannelId = user.Id,
                ChannelName = user.Businessname,
                StoreName = user.Businessname,
                RegisteredBy = user.Id,
                RegisteredByName = $"{user.Firstname} {user.Lastname}",

                Status = subStatus.SubStatusId,
                StatusName = subStatus.Name,
                PreviousStatus = subStatus.SubStatusId,

                Created = DateTime.Now,
                CreatedDate = DateOnly.FromDateTime(DateTime.Now),
                CreatedTime = TimeOnly.FromDateTime(DateTime.Now),

                ClaimRedeemed = false,
                OtpRequired = false,
                RaiseAdditional = false,
                IsAddressEditable = true
            };
        }

        private string GetMimeTypeFromFileName(string fileName)
        {
            var ext = Path.GetExtension(fileName)?.ToLowerInvariant();

            return ext switch
            {
                // 🖼 Images
                ".jpg" or ".jpeg" => "image/jpeg",
                ".png" => "image/png",
                ".gif" => "image/gif",
                ".bmp" => "image/bmp",
                ".webp" => "image/webp",
                ".svg" => "image/svg+xml",

                // 🎥 Videos
                ".mp4" => "video/mp4",
                ".mov" => "video/quicktime",
                ".avi" => "video/x-msvideo",
                ".wmv" => "video/x-ms-wmv",
                ".mkv" => "video/x-matroska",
                ".webm" => "video/webm",

                // 🎵 Audio
                ".mp3" => "audio/mpeg",
                ".wav" => "audio/wav",
                ".ogg" => "audio/ogg",
                ".aac" => "audio/aac",
                ".flac" => "audio/flac",

                // 📄 Documents
                ".pdf" => "application/pdf",
                ".doc" => "application/msword",
                ".docx" => "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
                ".xls" => "application/vnd.ms-excel",
                ".xlsx" => "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                ".ppt" => "application/vnd.ms-powerpoint",
                ".pptx" => "application/vnd.openxmlformats-officedocument.presentationml.presentation",
                ".txt" => "text/plain",
                ".csv" => "text/csv",

                // 📦 Archives
                ".zip" => "application/zip",
                ".rar" => "application/vnd.rar",
                ".7z" => "application/x-7z-compressed",

                // Fallback
                _ => "application/octet-stream"
            };
        }

        private static async Task<byte[]> ReadFileAsync(IFormFile file)
        {
            using var ms = new MemoryStream();
            await file.CopyToAsync(ms);
            return ms.ToArray();
        }
    }
}
