using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SiliconPower.Api.Helpers
{
    public enum ReservationStatusEnum
    {
        ReservationInitialized = 0,
        PaymentProcessed = 1,
        PaymentConfirmed = 2,
        ReservationCancelled = 3,
        ReservationDropped = 4
    }
}
