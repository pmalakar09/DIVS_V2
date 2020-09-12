<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Incorrect Voter ID</title>
</head>
		<style>
body {
    background-image: url(IF.jpg);
	background-position: center;
    background-attachment: fixed;

}
h1 
{
    text-align: center;
	  color: darkblue;
    text-shadow: 1px 1px 22px white, 0 25px 25px red, 0 2px 25px green;
  
}
.ownership 
{
    position: absolute;
    bottom: 8px;
    right: 16px;
    font-size: 18px;

}
<body>
</style>
<h1>DIGITAL INDIA VOTING SYSTEM (DIVS)</h1>
<%!
String incorrectvi;
%>
<%
HttpSession hs=request.getSession();
incorrectvi=(String)hs.getAttribute("VoterID");
out.println("Dear Voter Your Entered Voter ID Number Is : '"+incorrectvi+"' Which Is Incorrect. So Please Enter Your Voter ID Number Correctly");
%>
<center>
<br>
<a href="VoterLogin.html"><input type="button" value="Back" ></a>
</center>

	<div class="ownership">Powered by JSP <br>
	   Developed by Prasenjit Kr Malakar<br>
       All Rights Reserved.</div>
</body>
</html>