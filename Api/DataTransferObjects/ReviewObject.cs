using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SiliconPower.Api.DataTransferObjects
{
    public class ReviewObject
    {
        public string Title { get; set; }
        public string Description { get; set; }
        public decimal Score { get; set; }
        public string UserFirstName { get; set; }
        public DateTime TimeStamp { get; set; }
    }
}
