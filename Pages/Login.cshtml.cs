using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using SiliconPower.ViewModel;

namespace SiliconPower.Pages
{
    public class LoginModel : PageModel
    {
        private readonly SignInManager<IdentityUser> signInManager;

        [BindProperty]
        public LoginViewModel Model { get; set; }

        public LoginModel(SignInManager<IdentityUser> signInManager)
        {
            this.signInManager = signInManager;
        }
        public void OnGet()
        {
        }

        public async Task<IActionResult> OnPostAsync(string returnUrl = null)
        {
            if (ModelState.IsValid)
            {
                var result = await signInManager.PasswordSignInAsync(Model.Email, Model.Password, Model.KeepMeLogged, false);
                
                if (result.Succeeded)
                {
                    if(returnUrl == null || returnUrl == "/")
                    {
                        return RedirectToPage("Index");
                    } 
                    else
                    {
                        return RedirectToPage(returnUrl);
                    }
                
                }
                
                ModelState.AddModelError("", "Username or Password incorrect... try again!");

            }
                return Page();

        }
    }
}
