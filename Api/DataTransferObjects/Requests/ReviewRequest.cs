using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SiliconPower.Api.DataTransferObjects.Requests
{
    public class ReviewRequest
    {
        public string Title { get; set; }
        public string Description { get; set; }
        public decimal Score { get; set; }

    }
}
