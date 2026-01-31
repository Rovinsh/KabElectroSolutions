namespace KabElectroSolutions.DTOs
{
    public class FailedClaimRowDto
    {
        public int RowNumber { get; set; }
        public string Error { get; set; } = string.Empty;
        public string RawData { get; set; } = string.Empty;
    }
}
