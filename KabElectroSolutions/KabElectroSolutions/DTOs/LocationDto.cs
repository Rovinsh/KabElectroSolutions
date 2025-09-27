namespace KabElectroSolutions.DTOs
{
    public class LocationDto
    {
        public string Name { get; set; }
        public Dictionary<string, CityDto> Cities { get; set; }
    }
}
