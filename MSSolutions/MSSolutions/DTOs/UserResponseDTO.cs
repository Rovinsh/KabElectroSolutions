namespace MSSolutions.DTOs
{
    public class UsersResponseDTO
    {
        public List<UsersDTO> Data { get; set; }
        public int Status { get; set; }
        public string Message { get; set; }

    }
}
