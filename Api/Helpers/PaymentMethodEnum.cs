using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SiliconPower.Api.Helpers
{
    public enum PaymentMethodEnum
    {
        Stripe = 1,
        Adyen = 2,
        Paypal = 3,
        Cash = 4
    }
}
