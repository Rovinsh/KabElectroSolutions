namespace KabElectroSolutions.DTOs
{
    public class LocationResponseDto
    {
        public int Status { get; set; }
        public string Message { get; set; }
        public Dictionary<string, LocationDto> Data { get; set; }
    }
}
