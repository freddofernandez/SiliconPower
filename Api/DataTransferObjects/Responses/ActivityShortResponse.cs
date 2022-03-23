using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SiliconPower.Api.DataTransferObjects.Responses
{
    public class ActivityShortResponse
    {
        public Guid ActivityId { get; set; }
        public string Title { get; set; }
        public decimal Price { get; set; }
        public LocationObject Location { get; set; }
        public string MainPictureUrl { get; set; }
        public string MainPictureBase64 { get; set; }
        public decimal AverageScore { get; set; }
    }
}
