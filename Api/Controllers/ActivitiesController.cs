using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SiliconPower.Api.DataTransferObjects.Requests;
using SiliconPower.Api.DataTransferObjects.Responses;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace SiliconPower.Controllers
{
    [Route("api/activities")]
    [ApiController]
    public class ActivitiesController : ControllerBase
    {
        /// <summary>
        /// GET activities/
        /// Gets all the activities in the database that match with the request input filters.
        /// </summary>
        /// <returns>List of ActivityShortResponses</returns>
        [HttpGet]
        [ProducesResponseType(typeof(List<ActivityShortResponse>), StatusCodes.Status200OK)]
        public async Task<IActionResult> Get([FromBody] ActivityRequest request)
        {
            /* TODO:
             * Here we should get the matching Activities from de db
             * filtering using the parameters in the ActivityRequest
             * And then converting those to ShortResponses in order to diminish the payload
             * get average score for each activity
             */
            return new JsonResult(new List<ActivityShortResponse>());
        }

        /// <summary>
        /// GET activities/{ActivityId}
        /// Gets the full information on a concrete Activity
        /// </summary>
        /// <returns>
        /// ActivityFullResponse with:
        ///-- Full description
        /// -- Photo Gallery
        /// -- Reviews
        /// -- TimeTable for chosen day 
        /// </returns>
        [HttpGet]
        [Route("{activityId:guid}")]
        [ProducesResponseType(typeof(ActivityFullResponse), StatusCodes.Status200OK)]
        public async Task<IActionResult> Get([FromRoute] Guid activityId, [FromQuery] DateTime chosenDay)
        {
            /* TODO:
             * -    Get all available information in database on the chosen activity asd
             * -    list all availabilities for the chosen day
             * -    list top 3 reviews to lighten the payload
             * -    get average score for activity
             */
            return new JsonResult(new ActivityFullResponse());
        }

        /// <summary>
        /// POST activities/{ActivityId}/purchase?PaymentGateway={string}&Appointment={datetime}
        /// Requests an attempt of payment for the selected Activity, Appointment and PaymentGateway
        /// </summary>
        /// <returns>
        /// Payment Secret for the chosen gateway and Appointment Id
        /// </returns>
        [HttpPost]
        [Route("{activityId:guid}/purchase/")]
        [ProducesResponseType(typeof(PurchaseResponse), StatusCodes.Status200OK)]
        public async Task<IActionResult> Post([FromRoute] Guid activityId, [FromQuery] string paymentGateway, [FromQuery] DateTime appointment)
        {
            /*TODO:
             *  -   Create a Reservation in the system, with status: PENDING PAYMENT
             *  -   Generate de payment attempt with PaymentGateway provider
             *  -   Temporarily Block the availability of the chosen appointment/activity 
             *      (Even if the reservation is not paid, the same entity of reservation can be used as cache to retrieve missing data if frontend loses track of the petition, 
             *      the appointment should be reinstated in availabilities after a while using a timed service that checks the unpaid reservations for timeouts)
             *
             */
            return new JsonResult(new PurchaseResponse());
        }

        /// <summary>
        /// POST activities/confirm-payment?AppointmentIdCode="{string}"
        /// Frontend informs payment was successfully completed
        /// </summary>
        /// <returns>
        /// HTTP200
        /// </returns>
        [HttpPost]
        [Route("confirm-payment")]
        public async Task<IActionResult> Put([FromBody] string reservationId)
        {
            /*
             *TODO:
             *      Depending on the payment gateway the backend can be in charge of listening to a Webhook that informs the payment
             *      Other option is request a double verification with the provider if frontend was in charge of handling the payment
             *      Update the status of the Reservation to ACTIVE
             */
            return Ok();
        }

    }
}
