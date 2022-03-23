using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using SiliconPower.Api.DataTransferObjects.Requests;
using SiliconPower.Api.DataTransferObjects.Responses;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SiliconPower.Api.Controllers
{
    [Route("api/user")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly UserManager<IdentityUser> userManager;

        public UserController(UserManager<IdentityUser> userManager)
        {
            this.userManager = userManager;
        }

        /// <summary>
        /// PUT /api/user/register
        /// Alternative API Method to the Razor Page Register Logic
        /// Catches minimal user Data to initialize registry in UserTable
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPut]
        [Route("register")]
        public async Task<IActionResult> RegisterUserAsync([FromBody] RegistrationRequest request)
        {
            if (ModelState.IsValid)
            {
                var user = new IdentityUser()
                {
                    UserName = request.Email,
                    Email = request.Email,
                    PhoneNumber = request.PhoneNumber,

                };

                var result = await userManager.CreateAsync(user, request.Password);

                if (result.Succeeded)
                {
                    return Ok();
                }

                foreach (var error in result.Errors)
                {
                    ModelState.AddModelError("", error.Description);
                }

                return BadRequest(ModelState);
            }

            return BadRequest(ModelState);
        }

        /// <summary>
        /// GET /api/user/personal-information
        /// Returns User visible information
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [Route("personal-information")]
        [ProducesResponseType(typeof(UserInformationResponse), StatusCodes.Status200OK)]
        public async Task<IActionResult> GetPersonalInformation()
        {
            /*
             * TODO:
             * Check identity with TOKEN
             * Return User Additional Information
             */

            return new JsonResult(new UserInformationResponse());
        }

        /// <summary>
        /// PATCH /api/user/personal-information
        /// Let's the user update the non-core user information
        /// Fields could be left empty, the validation of existing or non-existing fields is done by the backend
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPatch]
        [Route("personal-information")]
        public async Task<IActionResult> UpdatePersonalInformation([FromBody] PersonalInformationUpdateRequest request)
        {
            /*
             * TODO:
             * Check with TOKEN if identity is valid 
             * Update Phone from AspNetUser table 
             * Update AdditionalData from AdditionalUserInformation (checking for nulls in Request to ignore)
             */

            return Ok();
        }

        /// <summary>
        /// PATCH /api/user/update-password
        /// </summary>
        /// <param name="oldPassword"></param>
        /// <param name="newPassword"></param>
        /// <returns></returns>
        [HttpPatch]
        [Route("update-password")]
        public async Task<IActionResult> UpdatePassword([FromQuery] string oldPassword, string newPassword)
        {
            /*
             * TODO:
             * Check with TOKEN if identity is valid 
             * Verify integrity of oldPassword
             * if ok, change it to the newPassword
             */

            return Ok();
        }
    }
}
