<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SIGN UP</title>

    <!-- Bootstrap core CSS -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    

  
      <link rel="stylesheet" href="bootstrap/css/style.css">
    

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
            </li>
            <li class="nav-item">
              <a class="nav-link" href="Login.jsp">LOGIN</a>
            </li>
            
          </ul>
        </div>
      </div>
    </nav>

    <!-- Page Content -->
    
   <div class="user">
    <header class="user__header">
       
        <h1>SIGN UP</h1>
    </header>
    
    <form class="form" action="Add_Member" method="post">
        <div class="form__group">
            <input type="text" placeholder="Name" name="Name" class="form__input" required  />
        </div>
                
         <div class="form__group">
            <input type="text" placeholder="Address" name="Address" class="form__input" required />
        </div>
        
         <div class="form__group">
            <input type="text" placeholder="Mobile" name="Mobile" class="form__input" required />
        </div>
        
         <div class="form__group">
            <input type="date" name="Bday" class="form__input" required />
        </div>
        
        <div class="form__group">
            <input type="email" placeholder="Email" name="Email" class="form__input" required  />
        </div>
        
        <div class="form__group">
            <input type="password" placeholder="Password" name="Password" class="form__input" required />
        </div>
         <div class="form__group">
            <input type="password" placeholder=" Re-enter Password" name="Re_password" class="form__input" required/>
        </div>
        
       <input type="submit" value="ADD" class="btn" onclick="allLetter(Name)" >
      
    </form>
</div>
  
  

          
    

  </body>

</html>
