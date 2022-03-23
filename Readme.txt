Hi!
This project was made with Razor Pages but also includes an API folder with all the content needed for de API.

To run this properly you should:
1) Check the connection string in appsettings.json to match with your server or local database
2) run these commands in Package Manager Console:
-	Add-Migration MigrationOne
-	Update-Database

Quick Recap!

1 - The API folder has all the necessary endpoints (that I could think of) for the application to work and satisfy the needs of the user.

2 - The Razor pages simplified the SignUp / LogIn situation... 
	but the test stated that you needed the Register Endpoint to be actually used. 
	So you have two different Register Forms to try out!

3 - I installed SWAGGER for better endpoint documentation (accessable adding /swagger to root uri), 
	but also provide a Postman documentation just in case. 
	You can find id here: 
	https://documenter.getpostman.com/view/15499154/UVsSNP7g#29442d89-3fa8-491a-a002-d5b42c1df98f

4 - The database diagram screenshot can be found in "../wwwroot/resources/SiliconPowerDbDiagram.png".

5 - The generated database script can be found in "../wwwroot/resources/script.sql"

If you have any doubts, reach me out!
Federico Fernandez Dominguez
(+34) 682 814 925