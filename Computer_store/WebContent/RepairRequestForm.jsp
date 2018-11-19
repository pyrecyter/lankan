<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
    if ((session.getAttribute("Email") == null) || (session.getAttribute("Email") == "")) {
    	response.sendRedirect("Login.jsp");
    }
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Repair Request Form</title>
<link href="bootstrap/css/1.css" rel="stylesheet">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body background="images/register.jpg" fontface = "Verdana" >

    <%@ include file="navigationbar.jsp"%>
	<br />
	<br />
	<br />

<br><br>
<h1 align="center">Repair Request Form</h1><br><br>
<form  action="RepairReqFormServlet"  method="POST">
<table bgcolor="white" frame="box">
<tr><th colspan="2" id="head1">Personal Details</th></tr>
<tr>
<th>Name</th>
<th>Email</th>
</tr>
<tr><th><input type="text" name="name" id="ex1" required></th>
<th><input type="email" name="email" id="ex1" required></th>
</tr>
<tr>
<th>Contact Number</th>
<th>Order Number</th>
</tr>
<tr>
<th><input type="text" name="Cnumber" id="ex1" required></th>
<th><input type="text" name="Onumber" id="ex1" required></th>
</tr>
<tr><th colspan="2" id="head1">Details</th></tr>
<tr>
<th>Reason for Repair</th>
<th>Priority</th>
</tr>
<tr>
<th><input type="text" name="reason" id="ex1" required></th>
<th> <select name="priority" required>
    <option value="Low">Low</option>
    <option value="Medium">Medium</option>
    <option value="High">High</option>
    </select></th>
</tr>
<tr>
<th>Date</th>
<th></th>
</tr>
<tr>
<th><input type="date" name="date" required></th>
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
<td colspan="2"><input type="submit" class="class ="btn btn-info""  value="Submit Repair Request"></td>
</tr> 
</table>
</form>
<script src="AddItemValidation.js"></script>

</body>
</html>