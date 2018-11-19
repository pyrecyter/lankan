<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html >
<html>
<head>

<link rel="stylesheet" type="text/css" href="CSS/headr.css">
<link type="text/css" rel="stylesheet" href="CSS/NW.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Update Profile</title>
</head>
<body background="images/profile.jpg">



<h2>Profile Update</h2>
<form action="home.jsp">
<input type="submit" value="Back" >
</form>
<form method="post" action="update">
<table id="customers">


<tr>
 
<th>First name</th>
<th>Last name</th>
<th>Address</th>
<th>Mobile No</th>
<th>Password</th>
</tr>
<tr><td><input type="text" placeholder="First Name" name="first_name" required></td>
			<td><input type="text" placeholder="Last_name" name="last_name"  required></td>
			<td><input type="text" placeholder="Address" name="address"  required></td>
			<td><input type="number" placeholder="Mobile Number" name="mobno"  required></td>
			<td><input type="password" placeholder="Password" name="pass"  required></td>
			<td><input type="hidden" name="email"value="<%=session.getAttribute("email")%>">
			<td><input type="submit" value="submit"></td>
		
</table>
</form>





</body>
</html>