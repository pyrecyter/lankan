<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>


<html lang="en">

  <head>
  <%String val="none";
  if(session.getAttribute("logad")!=null)
  if((int)session.getAttribute("logad")==1)
  val="center";
  else
  val="none"; %>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin</title>

    <!-- Bootstrap core CSS -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="bootstrap/css/style.css">
    <style>
	.error{
	display:<%=val%>;
	}
	</style>
    
  </head>

  <body background="images/register.jpg">

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
      <div class="container">
        <a class="navbar-brand" href="Home.jsp">Lankan AN Global</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li>
              <a class="nav-link" href="Home.jsp">HOME
                <span class="sr-only">(current)</span>
              </a>
            
          </ul>
        </div>
      </div>
    </nav>

    <!-- Page Content -->
    
   <div class="user">
    <header class="user__header">
       
        <h1>ADMINISTRATOR</h1>
    </header>
    
    <form class="form" action="Admincheck" method="post">
        <div class="form__group">
            <input type="text" placeholder="Username" name="Name" class="form__input" required />
        </div>
                
           
        <div class="form__group">
            <input type="password" placeholder="Password" name="Password" class="form__input" required />
        </div>
        <div class="error" style="text-align:center;color:red;a">
         <br>Incorrect username or password !<br><br>
         </div><%session.setAttribute("logad", 0); %>
                 
        <input type="submit" value="LOGIN" class="btn">
        
        
    </form>
    
</div>
  
  

          
    
   

  </body>

</html>
