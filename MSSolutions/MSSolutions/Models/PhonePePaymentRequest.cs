using System.ComponentModel.DataAnnotations;

namespace MSSolutions.Models
{
    public class PhonePePaymentRequest
{
    public string MerchantId { get; set; }
    public string MerchantTransactionId { get; set; }
    public long Amount { get; set; } // paisa me (₹1 = 100)
    public string RedirectUrl { get; set; }
    public string CallbackUrl { get; set; }
    public string MobileNumber { get; set; }
    public string PaymentInstrument { get; set; } = "PAY_PAGE";
}
}
