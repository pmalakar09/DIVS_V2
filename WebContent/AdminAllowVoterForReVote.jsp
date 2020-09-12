<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Voter Details</title>
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
    text-shadow: 1px 1px 22px white, 0 25px 25px red, 0 2px 25px red;
  
}
h3
{
    text-align: center;
    text-decoration: underline;
	  color: green;
    text-shadow: 1px 1px 22px white, 0 25px 25px yellow, 0 2px 25px red;
  
}
.ownership 
{
    position: absolute;
    bottom: 8px;
    right: 16px;
    font-size: 18px;

}
</style>

<body>
<h1>DIGITAL INDIA VOTING SYSTEM (DIVS)</h1>
<h2>Please Enter Voter's ID You Want TO Allow For RE VOTE Submission</h2>
<form action="">
<center>
<input type="text" name="AllowVoterIDByAdmin" autofocus placeholder=" Please Enter Voter ID" size="25px"/>
<input type="submit" value="Allow For RE VOTE">
</center>
</form>

<%!
String  vtrid;
String vtrname;
String vtrfathername;
String vtraddrs;
String vtrsex;
String vtrdob;
String vtrpanchayatno;
String vtrwardno;
String vtrassamblyno;
String vtrparlamentno;
int vtrvotestatus;

Connection con=null;
PreparedStatement pstmt=null;
ResultSet rs=null;
String allow="update voters set vote_status=0 where voter_id=?";
String query="select * from voters where voter_id=?";
public void jspInit()
{
	try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	System.out.println("Driver Loaded");
	con=DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/XE","admin","1989");
	System.out.println("Connection Stablished");
	     }
	catch(Exception e)
	{
		e.printStackTrace();
	}
}
%>
<%

try
{
String voterid=request.getParameter("AllowVoterIDByAdmin");
System.out.println(voterid); pstmt=con.prepareStatement(allow);
pstmt.setString(1,voterid);
rs=pstmt.executeQuery();
 pstmt=con.prepareStatement(query);
 pstmt.setString(1,voterid);
 rs=pstmt.executeQuery();
 while(rs.next())
 {
	  vtrid=rs.getString(1);
	  vtrname=rs.getString(2);
	  vtrfathername=rs.getString(3);
	  vtraddrs=rs.getString(4);
	  vtrsex=rs.getString(5);
	  vtrdob=rs.getString(6);
	  vtrpanchayatno=rs.getString(7);
	  vtrwardno=rs.getString(8);
	  vtrassamblyno=rs.getString(9);
	  vtrparlamentno=rs.getString(10);
	  vtrvotestatus=rs.getInt(11);
 }
  
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
<form action="">
<center>
<br>
<h3>This Voter Is Now Eligible For RE VOTE Submission</h3>
<br>
<br>
<%out.println("Voter ID : ");%>
<%out.println(vtrid); %>
<br>
<%out.println("Voter Name : ");%>
<%out.print(vtrname); %>
<br>
<%out.println("Voter Father Name : ");%>
<%out.print(vtrfathername); %>
<br>
<%out.println("Voter Address : ");%>
<%out.print(vtraddrs); %>
<br>
<%out.println("Voter Sex : ");%>
<%out.print(vtrsex); %>
<br>
<%out.println("Voter DOB : ");%>
<%out.print(vtrdob); %>
<br>
<%out.println("Voter Panchayat Number : ");%>
<%out.print(vtrpanchayatno); %>
<br>
<%out.println("Voter Ward Number : ");%>
<%out.print(vtrwardno); %>
<br>
<%out.println("Voter Assembly Number : ");%>
<%out.print(vtrassamblyno); %>
<br>
<%out.println("Voter Parlament Number : ");%>
<%out.print(vtrparlamentno); %>
<br>
<%out.println("Voter Vote Status : ");%>
<%out.print(vtrvotestatus); %>
<br>
<br>
<a href="AdminAction.html"><input type="button" value="Back" ></a>
</center>
</form>

	<div class="ownership">Powered by JSP <br>
	   Developed by Prasenjit Kr Malakar<br>
       All Rights Reserved.</div>
</body>
</html>