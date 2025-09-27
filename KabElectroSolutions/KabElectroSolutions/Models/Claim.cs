using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json;

namespace KabElectroSolutions.Models
{
    public class Claim
    {
        [Key]
        public int Id { get; set; }
        public string? TechnicianName { get; set; }
        public string? LmStatus { get; set; }
        public string? ItemName { get; set; }
        public int? Rating { get; set; }
        public DateTime? L3ApprovalDate { get; set; }
        public int ServicePartner { get; set; }
        public bool OtpRequired { get; set; }
        public string? DisplayName { get; set; }
        public string? Reasons { get; set; }
        public string? CallCloseRemarks { get; set; }
        public string? Concern { get; set; }
        public string? ClaimRegisteredPhoneNumber { get; set; }
        public string? ReasonOfLoss { get; set; }
        public decimal? EstimationFirst { get; set; }
        public string? SolvyPan { get; set; }
        public string? L2ServiceRejectionRemarks { get; set; }
        public string? ServicePartnerName { get; set; }
        public string? VoiceUrl { get; set; }
        public string? EstimationParts { get; set; }
        public string? CustomerAddress { get; set; }
        public string? BrandComplaintNumber { get; set; }
        public int Address { get; set; }
        public DateTime? OtpVerificationTimestamp { get; set; }
        public DateOnly? WarrantyStartDate { get; set; }
        public int ChannelId { get; set; }
        public string? Phone { get; set; }
        public decimal ItemPrice { get; set; }
        public int WarrantyDuration { get; set; }
        public DateOnly? InvoiceDate { get; set; }
        public string? AssignedExecutiveName { get; set; }
        public string? AlternateContact { get; set; }
        public DateOnly PlanSoldDate { get; set; }
        public bool RaiseAdditional { get; set; }
        public int WarrantyTypeId { get; set; }
        public string? CustomerState { get; set; }
        public string? ItemSerialNumber { get; set; }
        public string? SolvyAddress { get; set; }
        public DateOnly? EndDate { get; set; }
        public string? ItemBrand { get; set; }
        public DateTime? L2ServiceApprovalDate { get; set; }
        public DateTime? ClaimVerificationDocumentUploadTimestamp { get; set; }
        public string? CustomerEmail { get; set; }
        public string? ChannelName { get; set; }
        public string? ClaimRedeemStatus { get; set; }
        public TimeOnly CreatedTime { get; set; }
        public string? EndStatus { get; set; }
        public string? L2InsuranceRejectionRemarks { get; set; }
        public DateTime? CallAbortDateTime { get; set; }
        public string? ServicePartnerCity { get; set; }
        public DateTime? EstimationDateTime { get; set; }
        public DateTime? EstimationActionDate { get; set; }
        public DateTime? RepairCompletionDate { get; set; }
        public string? WarrantyActivationCode { get; set; }
        public DateTime? InvoiceActionDate { get; set; }
        public int Status { get; set; }
        public string? ItemImei { get; set; }
        public bool HsnRequired { get; set; }
        public int Pincode { get; set; }
        public decimal? EstimationLast { get; set; }
        public string? ServicePartnerPhone { get; set; }
        public string? ItemCategory { get; set; }
        public string? Technician { get; set; }
        public DateOnly? StartDate { get; set; }
        public string? CustomerAlternateEmail { get; set; }
        public string? ServicePartnerState { get; set; }
        public DateTime? ClaimRedeemedDate { get; set; }
        public DateTime? L2InsuranceApprovalDate { get; set; }
        public string? UtrNumber { get; set; }
        public string? ExtraInfo { get; set; }
        public DateTime? AppointmentConfirmationTime { get; set; }
        public DateTime Created { get; set; }
        public bool ClaimRedeemed { get; set; }
        public string? PreviousVisitProductSerialNumber { get; set; }
        public string? ServicePartnerGST { get; set; }
        public string? CallAbortReason { get; set; }
        public string? InsuredCompany { get; set; }
        public string? SolvyGST { get; set; }
        public string? PaymentDone { get; set; }
        public int ServicePartnerPincode { get; set; }
        public int ClaimApproved { get; set; }
        public string? AppointmentPendingReason { get; set; }
        public string? Insured { get; set; }
        public string? StatusName { get; set; }
        public string? SelfInvoice { get; set; }
        public string? ServicePartnerPAN { get; set; }
        public string? ServicePartnerAddress { get; set; }
        public string? StoreName { get; set; }
        public DateTime? L1ApprovalDate { get; set; }
        public int PreviousStatus { get; set; }
        public int? FirstVisitTAT { get; set; }
        public string? PaymentStatus { get; set; }
        public decimal? EstimationPaymentAmount { get; set; }
        public string? CustomerPhone { get; set; }
        public int Warranty { get; set; }
        public string? ClaimPaymentStatus { get; set; }
        public int RegisteredBy { get; set; }
        public string? L1RejectionRemarks { get; set; }
        public DateTime? DropDate { get; set; }
        public string? Cta { get; set; }
        public string? CustomerCity { get; set; }
        public int Item { get; set; }
        public bool IsAddressEditable { get; set; }
        public string? RegisteredByName { get; set; }
        public string? L3RejectionRemarks { get; set; }
        public DateOnly CreatedDate { get; set; }
        public int ClaimType { get; set; }
        public int? RepairDoneTAT { get; set; }
        public string? WarrantyType { get; set; }
        public DateTime? PickupDate { get; set; }
        public int ItemCategoryId { get; set; }
        public string? PaymentId { get; set; }
        public string? Remarks { get; set; }
        public string? Type { get; set; }
        public decimal? ClaimAmount { get; set; }
        public long Appointment { get; set; }
        public string? SolvyStateCode { get; set; }
        public string? PaymentTxnId { get; set; }
        public decimal? PaymentAmount { get; set; }
        public decimal? Amount { get; set; }
        public string? InvoiceNumber { get; set; }
        public string? CustomerName { get; set; }

        // Collections (empty lists in your JSON)
        public string? SGST { get; set; }
        public string? CGST { get; set; }
        public string? IGST { get; set; }

        [NotMapped]
        public List<string> SGSTList
        {
            get => string.IsNullOrEmpty(SGST) ? new List<string>() : JsonSerializer.Deserialize<List<string>>(SGST)!;
            set => SGST = JsonSerializer.Serialize(value);
        }
        [NotMapped]
        public List<string> CGSTList
        {
            get => string.IsNullOrEmpty(CGST) ? new List<string>() : JsonSerializer.Deserialize<List<string>>(CGST)!;
            set => CGST = JsonSerializer.Serialize(value);
        }
        [NotMapped]
        public List<string> IGSTList
        {
            get => string.IsNullOrEmpty(IGST) ? new List<string>() : JsonSerializer.Deserialize<List<string>>(IGST)!;
            set => IGST = JsonSerializer.Serialize(value);
        }
    }
}
