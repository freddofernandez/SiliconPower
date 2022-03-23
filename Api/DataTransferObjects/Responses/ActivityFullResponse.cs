using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SiliconPower.Api.DataTransferObjects.Responses
{
    public class ActivityFullResponse
    {
        public Guid ActivityId { get; set; }
        public string Title { get; set; }
        public decimal Price { get; set; }
        public LocationObject Location { get; set; }
        public string MainPictureUrl { get; set; }
        public string MainPictureBase64 { get; set; }
        public List<string> GalleryAsUrls { get; set; }
        public List<string> GalleryAsBase64 { get; set; }
        public List<ReviewObject> ReviewList { get; set; }
        public List<DateTime> Availabilities { get; set; }
        public decimal AverageScore { get; set; }
    }
}
