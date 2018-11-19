<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <%
    if ((session.getAttribute("Email") != null)) {
    	
    
%>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="Home.jsp">Lankan AN Global</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
          <li class="nav-item">
              <a class="nav-link" href="User.jsp"><%=session.getAttribute("Email")%></a>
            </li>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <li class="nav-item active">
              <a class="nav-link" href="#">Home
                <span class="sr-only">(current)</span>
              </a>
      
            </li>
            
            
            <li class="nav-item">
              <a class="nav-link" href="Cart.jsp">My Cart</a>
            </li>
            <li class="nav-item">
            	 <a class="nav-link" href="Wishlist.jsp">Wish List</a>
            </li>
            <li class="nav-item">
            	 <a class="nav-link" href="Logout">Logout</a>
            </li>
            
                 </ul>
                       
        </div>
      </div>
    </nav>
 <%
    
  
    }
    else
    {
  %>
 <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="Home.jsp">Lankan AN Global</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
              <a class="nav-link" href="Home.jsp">Home
                <span class="sr-only">(current)</span>
              </a>
      
            </li>
            <li class="nav-item">
              <a class="nav-link" href="Login.jsp">Login</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="Register.jsp">Sign up</a>
            </li>
           
                 </ul>
                       
        </div>
      </div>
    </nav>
 <%
    }

  %>