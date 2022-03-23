using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SiliconPower.Api.DataTransferObjects.Responses
{
    public class UserInformationResponse
    {
        public string PhoneNumber { get; set; }
        public string Email { get; set; }
        public string UserName { get; set; }
        public UserAdditionalInformation AdditionalInformation { get; set; }
    }
}
