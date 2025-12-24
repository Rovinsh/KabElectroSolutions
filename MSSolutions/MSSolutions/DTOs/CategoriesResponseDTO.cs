using MSSolutions.Models;

namespace MSSolutions.DTOs
{
    public class CategoriesResponseDTO
    {
        public List<CategoriesDTO> Data { get; set; }
        public int Status { get; set; }
        public string Message { get; set; }

    }
}
