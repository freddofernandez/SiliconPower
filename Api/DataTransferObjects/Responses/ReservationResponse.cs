using SiliconPower.Api.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SiliconPower.Api.DataTransferObjects.Responses
{
    public class ReservationResponse
    {
        public Guid ReservationId { get; set; }
        public Guid ActivityId { get; set; }
        public ActivityShortResponse ActivityInformation { get; set; }
        public DateTime Appointment { get; set; }
        public ReservationStatusEnum ReservationStatus { get; set; }
        public ReviewObject UserReview { get; set; }
    }
}
