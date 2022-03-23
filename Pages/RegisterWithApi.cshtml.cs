using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Json;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using SiliconPower.ViewModel;

namespace SiliconPower.Pages
{
    public class RegisterWithApiModel : PageModel
    {

        private readonly UserManager<IdentityUser> userManager;
        private readonly SignInManager<IdentityUser> signInManager;
        private readonly IHttpContextAccessor context;

        [BindProperty]
        public RegisterViewModel Model { get; set; }

        public SignInManager<IdentityUser> SignInManager => signInManager;

        public RegisterWithApiModel(UserManager<IdentityUser> userManager, SignInManager<IdentityUser> signInManager, IHttpContextAccessor context)
        {
            this.userManager = userManager;
            this.signInManager = signInManager;
            this.context = context;
        }

        public void OnGet()
        {
        }

        public async Task<IActionResult> OnPostHttpAsync()
        {
            if (ModelState.IsValid)
            {
                var user = new IdentityUser()
                {
                    UserName = Model.Email,
                    Email = Model.Email,
                    PhoneNumber = Model.PhoneNumber,

                };


                var request = context.HttpContext.Request;
                var baseUrl = $"{request.Scheme}://{request.Host}";

                HttpClient client = new();
                HttpResponseMessage response = await client.PutAsJsonAsync($"{baseUrl}/api/user/register", Model);

                if (response.IsSuccessStatusCode)
                {
                    await SignInManager.SignInAsync(user, false);
                    return RedirectToPage("Index");
                }
                
                ModelState.AddModelError("", response.ReasonPhrase);   
            }

            return Page();
        }
    }
}

