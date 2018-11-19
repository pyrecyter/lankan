<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <title>W3Adda Index Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width">
</head>
<body>
<form action="testemailprocess.jsp">
            <table>
                <tr><td><b>To:</b>
                    </td>
                    <td><b><input type="text" name="mail" value="Enter Sender Email"/></b><br/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Subject:</b>
                    </td>
                    <td>
                        <input type="text" name="sub" value="Enter Subject"><br/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Message Text:</b>
                    </td>
                    <td>
                        <textarea rows="12" cols="80" name="mess"></textarea><br/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" value="Send">
                    </td>
                    <td>
                        <input type="reset" value="Reset">
                    </td>
                </tr>
            </table>
        </form>
</body>
</html>