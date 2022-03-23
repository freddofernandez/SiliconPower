using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SiliconPower.Api.DataTransferObjects
{
    public class LocationObject
    {
        public string NormalizedAddress { get; set; } = "";
        public string AddressLineOne { get; set; } = "";
        public string AddressLineTwo { get; set; } = "";
        public string City { get; set; } = "";
        public string Country { get; set; } = "";
        public string Comments { get; set; } = "";
        public string ZipCode { get; set; }
        public decimal Latitude { get; set; }
        public decimal Longitude { get; set; }

        public LocationObject(decimal latitude, decimal longitude, string zipCode)
        {
            Latitude = latitude;
            Longitude = longitude;
            ZipCode = zipCode;
        }
    }
}
