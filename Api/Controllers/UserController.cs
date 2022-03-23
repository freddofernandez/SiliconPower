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

        [HttpPatch]
        [Route("personal-information")]
        public async Task<IActionResult> UpdatePersonalInformation([FromBody] PersonalInformationUpdateRequest request)
        {
            /*
             * TODO:
             * Check with TOKEN if identity is valid 
             * Update Phone from IdentityDb Main table
             * Update AdditionalData from IdentityDb additional table
             */

            return Ok();
        }
    }
}
