<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,  com.divs.utils.Connector, org.apache.log4j.Logger" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Candidate Details</title>
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
<h2>Search Candidate Details By Candidate ID</h2>
<form action="">
<center>
<input type="text" name="CandidateIDByAdmin" autofocus placeholder=" Please Enter Candidate ID" size="25px"/>
<input type="submit" value="Submit">
</center>
</form>
<%!
String  cndid;
String cndname;
int cndage;
String cndaddrs;
String cndareacode;
String cndvtrid;
String cndsex;
String cndparty;
int cndvote;

//Connection con=null;

private static Connection con = null;
Connector objConnector = new Connector();
private static Logger log = Logger.getLogger("AdminSearchCandidateDetails");

PreparedStatement pstmt=null;
ResultSet rs=null;
String query="select * from candidates where candidate_id=?";
public void jspInit()
{
	try{
	//Class.forName("oracle.jdbc.driver.OracleDriver");
	System.out.println("Driver Loaded");
	//con=DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/XE","admin","1989");
	if(con==null){
		con = objConnector.getConnection();
		System.out.println("Connection Established For AdminSearchVoteResultBy Area!");
		log.debug("DB Connection Established For Admin!");
	}
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
String candidateid=request.getParameter("CandidateIDByAdmin");
System.out.println(candidateid);
 pstmt=con.prepareStatement(query);
 pstmt.setString(1,candidateid);
 rs=pstmt.executeQuery();
 while(rs.next())
 {
	  cndid=rs.getString(1);
	  cndname=rs.getString(2);
	  cndage=rs.getInt(3);
	  cndaddrs=rs.getString(4);
	  cndareacode=rs.getString(5);
	  cndvtrid=rs.getString(6);
	  cndsex=rs.getString(7);
	  cndparty=rs.getString(8);
	  cndvote=rs.getInt(9);
	
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
<h3>The Candidate Details Are Given Below</h3>
<br>
<br>
<%out.println("Candidate ID : ");%>
<%out.println(cndid); %>
<br>
<%out.println("Candidate Name : ");%>
<%out.print(cndname); %>
<br>
<%out.println("Candidate Age : ");%>
<%out.print(cndage); %>
<br>
<%out.println("Candidate Address : ");%>
<%out.print(cndaddrs); %>
<br>
<%out.println("Candidate Area Code : ");%>
<%out.print(cndareacode); %>
<br>
<%out.println("Candidate Voter ID Number : ");%>
<%out.print(cndvtrid); %>
<br>
<%out.println("Candidate Sex : ");%>
<%out.print(cndsex); %>
<br>
<%out.println("Candidate Political Party : ");%>
<%out.print(cndparty); %>
<br>
<%out.println("Candidate Total Vote : ");%>
<%out.print(cndvote); %>
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