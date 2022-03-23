using SiliconPower.Api.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SiliconPower.Api.DataTransferObjects
{
    public class UserAdditionalInformation
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string IdentificationNumber { get; set; }
        public LocationObject Location { get; set; }
        public PaymentMethodEnum PreferredPaymentMethod { get; set; }
    }
}
