using MSSolutions.Models;

namespace MSSolutions.DTOs
{
    public class GstResponseDTO
    {
        public List<GstDTO> Data { get; set; }
        public int Status { get; set; }
        public string Message { get; set; }

    }
}
