using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SiliconPower.Api.DataTransferObjects.Requests
{
    public class ActivityRequest
    {
        public DateTime ChosenDay { get; set; }
        public LocationObject Location { get; set; }
        public string[] Categories { get; set; }
    }
}
