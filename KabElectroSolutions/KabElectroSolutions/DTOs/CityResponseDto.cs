namespace KabElectroSolutions.DTOs
{
    public class CityResponseDto
    {
        public List<CitiesDto> Data { get; set; }
        public int Status { get; set; }
        public string Message { get; set; }
    }
}
