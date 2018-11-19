<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
              <a class="nav-link" href="User.jsp" style="text-transform:capitalize;"><%
            		  try{
            			  String driver2 = "com.mysql.jdbc.Driver";
            			  String connectionUrl2 = "jdbc:mysql://localhost:3306/";
            			  String database2 = "lankan";
            			  String userid2 = "root";
            			  String password2 = "root";
            				 Connection connection2 = DriverManager.getConnection(connectionUrl2+database2, userid2, password2);
            				 Statement statement2= connection2.createStatement();
            				 String sql ="select Name from member where Email='"+session.getAttribute("Email")+"';";
            				 ResultSet resultSet2 = statement2.executeQuery(sql);
            				 while(resultSet2.next()){
           %>logged in as <%=resultSet2.getString(1)%><%
            				 }
            				 connection2.close();
            				 } catch (Exception e) {
            				 e.printStackTrace();
            				 }
				%></a>
            </li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <li class="nav-item active">
              <a class="nav-link" href="Home.jsp">Home
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
  