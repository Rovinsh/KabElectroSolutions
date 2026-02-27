using System.ComponentModel.DataAnnotations;

namespace MSSolutions.Models
{
   public class PhonePeSettings
{
    public string Environment { get; set; }
    public PhonePeEnvConfig UAT { get; set; }
    public PhonePeEnvConfig PROD { get; set; }
}

public class PhonePeEnvConfig
{
    public string MerchantId { get; set; }
    public string SaltKey { get; set; }
    public string SaltIndex { get; set; }
    public string GatewayUrl { get; set; }
    public string ApiUrl { get; set; }
    public string FrontendUrl { get; set; }
}
}
