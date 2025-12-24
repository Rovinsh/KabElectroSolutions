using MSSolutions.Models;
namespace MSSolutions.DTOs
{
    public class ClaimsResponseDto
    {
        public int Status { get; set; }
        public string Message { get; set; } = "List of calls";
        public ClaimsDataDto Data { get; set; }
    }

    public class ClaimsDataDto
    {
        public int Count { get; set; }
        public List<Claim> Results { get; set; }
    }
}
