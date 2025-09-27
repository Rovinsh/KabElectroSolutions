namespace KabElectroSolutions.DTOs
{
    public class StateResponseDTO
    {
        public List<StateDTO> Data { get; set; }       
        public int Status { get; set; }
        public string Message { get; set; }
    }
}
