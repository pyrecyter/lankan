<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Repair Request Form</title>
 <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
 <link rel="stylesheet" href="bootstrap/css/style.css">
<link href="bootstrap/css/RRForm.css" rel="stylesheet">
  
    
</head>
<body background="images/r.jpg">

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
      <div class="container">
        <a class="navbar-brand" href="#">Lankan AN Global</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li>
              <a class="nav-link" href="#">HOME
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="Register.jsp">SIGN UP</a>
            </li>
            
          </ul>
        </div>
      </div>
    </nav>>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String fid = request.getParameter("reportId");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "lankan";
String userid = "root";
String password = "root";

String repairId=request.getParameter("repairId");

try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from repair_req_tab where repairId='"+repairId+"';";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>

<form  action="UpdateRepairReqFormProcess"  method="POST">
<table>
<tr><th colspan="2" id="head1">Personal Details</th></tr>
<tr>
<th>Repair Id</th>
<th>Name</th>
</tr>
<tr>
<th><input type="text" name="Rid" id="ex1"></th>
<th><input type="text" name="name" id="ex1"></th>
</tr>
<tr><th>Email</th>
<th></th></tr>
<tr>
<th><input type="email" name="email" id="ex1"></th>
<th></th>
</tr>
<tr>
<th>Contact Number</th>
<th>Order Number</th>
</tr>
<tr>
<th><input type="text" name="Cnumber" id="ex1"></th>
<th><input type="text" name="Onumber" id="ex1"></th>
</tr>
<tr><th colspan="2" id="head1">Details</th></tr>
<tr>
<th>Reason for Repair</th>
<th>Priority</th>
</tr>
<tr>
<th><input type="text" name="reason" id="ex1"></th>
<th> <select name="priority">
    <option value="Low">Low</option>
    <option value="Medium">Medium</option>
    <option value="High">High</option>
    </select></th>
</tr>
<tr>
<th>Current Date</th>
<th></th>
</tr>
<tr>
<th><input type="date" name="date"></th>
<th></th>
</tr>
<tr>
<th colspan="2">Reason for Repair in Details</th>
</tr>
<tr>
<th colspan="2"><textarea name="comment"></textarea></th>
</tr>
<tr>
<td></td>
<td><input type="submit" value="Submit"></td>
</tr> 
</table>
</form>

<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

</body>
</html>