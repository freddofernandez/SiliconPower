using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SiliconPower.Api.DataTransferObjects;
using SiliconPower.Api.DataTransferObjects.Requests;
using SiliconPower.Api.DataTransferObjects.Responses;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SiliconPower.Api.Controllers
{
    [Route("api/reservations")]
    [ApiController]
    public class ReservationsController : ControllerBase
    {
        /// <summary>
        /// GET api/reservations
        /// Returns a list of Reservations, with Activity Short Information and Current PaymentStatus
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpGet]
        [ProducesResponseType(typeof(List<ReservationResponse>), StatusCodes.Status200OK)]
        public async Task<IActionResult> Get()
        {
            /* TODO:
             * -    Validate user Token
             * -    Retrieve a list of all Reservations for the identified User,
             * -    OrderBy date
             * -    Add Activity information
             * -    Check payment status
             */
            return new JsonResult(new List<ReservationResponse>());
        }

        [Route("{reservationId}/cancel")]
        [HttpPatch]
        public async Task<IActionResult> CancelReservation([FromRoute] Guid reservationId)
        {
            /*TODO:
             * -    Validate user Token
             * -    Check CancellationTime and compare to AppointmentTime
             * -    Apply Cancellation Policy (check if refund is in order)
             */

            return Ok();
        }

        /// <summary>
        /// PUT api/reservations/{reservationId}/review
        /// Creates a review for the first time for that reservation,
        /// if a review already exists, user should use edit review endopint
        /// </summary>
        /// <param name="reservationId"></param>
        /// <param name="review"></param>
        /// <returns></returns>
        [Route("{reservationId}/review")]
        [HttpPut]
        [ProducesResponseType(typeof(ReviewObject), StatusCodes.Status200OK)]
        public async Task<IActionResult> CreateReview([FromRoute] Guid reservationId, [FromBody] ReviewRequest review )
        {
            /*TODO:
             * -    Validate user Token
             * -    Check if Review already exists, or if reservationAppointment has not yet happen
             * -    Convert reviewRequest to ReviewObject filling the TimeStamp and User First Name
             * -    Validate Score
             * -    Update Activity Average Score
             * -    Return review object
             */

            return new JsonResult(new ReviewObject());
        }

        /// <summary>
        /// PATCH api/reservations/{reservationId}/review
        /// Updates an existing review, if not, creates new one
        /// </summary>
        /// <param name="reservationId"></param>
        /// <param name="review"></param>
        /// <returns></returns>
        [Route("{reservationId}/review")]
        [HttpPatch]
        [ProducesResponseType(typeof(ReviewObject), StatusCodes.Status200OK)]
        public async Task<IActionResult> UpdateReview([FromRoute] Guid reservationId, [FromBody] ReviewRequest review)
        {
            /*TODO:
             * -    Validate user Token
             * -    If review exists, update it, if not, create from scratch
             * -    Return review object
             */

            return new JsonResult(new ReviewObject());
        }

        /// <summary>
        /// DELETE api/reservations/{reservationId}/review
        /// Erases existing review for the reservation
        /// </summary>
        /// <param name="reservationId"></param>
        /// <returns></returns>
        [Route("{reservationId}/review")]
        [HttpDelete]
        public async Task<IActionResult> CreateReview([FromRoute] Guid reservationId)
        {
            /*TODO:
             * -    Validate user Token
             * -    Delete review
             * -    Update Activity Average Score
             */

            return new JsonResult(new ReviewObject());
        }


    }
}
