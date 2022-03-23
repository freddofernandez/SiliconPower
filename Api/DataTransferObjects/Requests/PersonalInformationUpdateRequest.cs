using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SiliconPower.Api.DataTransferObjects.Requests
{
    public class PersonalInformationUpdateRequest
    {
        public string PhoneNumber { get; set; }
        public UserAdditionalInformation AdditionalInformation { get; set; 
    }
}
