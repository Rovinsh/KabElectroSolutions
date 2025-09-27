namespace KabElectroSolutions.DTOs
{
    public class PincodeResponseDto
    {
        public List<PincodeDto> Data { get; set; }
        public int Status { get; set; }
        public string Message { get; set; }
    }
}
