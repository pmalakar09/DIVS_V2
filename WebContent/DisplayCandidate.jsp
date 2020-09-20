<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Candidates</title>
<script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
</script>
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
h2
{
    text-align: center;
	  color: green;
    text-shadow: 1px 1px 22px white, 0 25px 25px red, 0 2px 25px limegreen;
  
}
h4
{
    text-align: center;
	  color: green;
    text-shadow: 1px 1px 22px white, 0 25px 25px red, 0 2px 25px limegreen;
  
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
<h2>Dear Voter In You Area The Candidates Names Are</h2>
<%! 
String c1;
String c2;
String c3;
String p1;
String p2;
String p3;
%>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");//HTTP 1.1
response.setHeader("Pragma", "no-cache");//HTTP 1.0
response.setHeader("Expires", "0");// Proxy Server
response.setDateHeader( "Expires", 0 );
HttpSession hs=request.getSession();
 c1=(String)hs.getAttribute("Candidate1");
 p1=(String)hs.getAttribute("Party1");
 c2=(String)hs.getAttribute("Candidate2");
 p2=(String)hs.getAttribute("Party2");
 c3=(String)hs.getAttribute("Candidate3");
 p3=(String)hs.getAttribute("Party3");
 hs.setMaxInactiveInterval(10);
//out.println(c1);
//out.println(c2);
//out.println(c3);
//request.setAttribute("candidate1",c1);
//request.setAttribute("candidate2",c2);
//request.setAttribute("candidate3",c3);
%>
<form action="VoteSubmission">
<center>
<input type="radio" name="candidate" value="c1"/><%out.println(c1+" ("+p1+")"); %>
<br>
<input type="radio" name="candidate" value="c2"/><%out.println(c2+" ("+p2+")"); %>
<br>
<input type="radio" name="candidate" value="c3"/><%out.println(c3+" ("+p3+")"); %>
<br>
<br>
<input type="submit" value="Submit Vote"/>
</center>
</form>
<h4>**Dear Voter, You Only Get "10 Seconds" To Submit Your Vote, After That This Link Will Expire**</h4>
<div class="ownership">Powered by JSP <br>
	   Developed by Prasenjit Kr Malakar<br>
       All Rights Reserved.</div>
<script>
window.alert("Dear Voter, you only get '10 Seconds' to submit your vote, after that this link will expire!!");
</script>
</body>
</html>