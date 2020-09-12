<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
.ownership 
{
    position: absolute;
    bottom: 8px;
    right: 16px;
    font-size: 18px;

}
</style>
<body>
<h2>View Vote Result By Area</h2>
<h1>DIGITAL INDIA VOTING SYSTEM (DIVS)</h1>
<form action="">
<center>
<input type="text" name="AreaCodeByAdmin" autofocus placeholder=" Please Enter The Area Code" size="25px"/>
<input type="submit" value="Submit">
</center>
</form>
<%!
String areacode;
String  cnd1id;
String cnd1name;
String cnd1party;
int cnd1vote;
String  cnd2id;
String cnd2name;
String cnd2party;
int cnd2vote;
String  cnd3id;
String cnd3name;
String cnd3party;
int cnd3vote;

Connection con=null;
PreparedStatement pstmt=null;
ResultSet rs=null;
String query="select candidate_id,candidate_name,political_party, total_votes from candidates where area_code=? order by total_votes desc";
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
areacode=request.getParameter("AreaCodeByAdmin");
System.out.println(areacode);
 pstmt=con.prepareStatement(query);
 pstmt.setString(1,areacode);
 rs=pstmt.executeQuery();
 while(rs.next())
 {
	  cnd1id=rs.getString(1);
	  cnd1name=rs.getString(2);
	  cnd1party=rs.getString(3);
	  cnd1vote=rs.getInt(4); 
	  rs.next();
      cnd2id=rs.getString(1);
	  cnd2name=rs.getString(2);
	  cnd2party=rs.getString(3);
	  cnd2vote=rs.getInt(4); 
	  rs.next();
	  cnd3id=rs.getString(1);
	  cnd3name=rs.getString(2);
	  cnd3party=rs.getString(3);
	  cnd3vote=rs.getInt(4);
	
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
<% out.println("The Election Result Of Area '"+areacode+"' Are Given Below :");%>
<br>
<%out.println("_______________________________________________");%>
<br>
<br>
<%out.println("*LEADING IN VOTE"); %>
<br>
<%out.println("_______________________________________________"); %>
<br>
<br>
<%out.println(" Leading Candidate's ID : ");%>
<%out.println(cnd1id); %>
<br>
<%out.println("Leading Candidate's Name : ");%>
<%out.print(cnd1name); %>
<br>
<%out.println("Leading Candidate's Political Party : "); %>
<%out.print(cnd1party); %>
<br>
<%out.println("Leading Candidate's Total Votes : ");%>
<%out.print(cnd1vote); %>
<br>
<%out.println("_______________________________________________"); %>
<br>
<br>
<%out.println("**2nd POSITION IN VOTE"); %>
<br>
<%out.println("_______________________________________________"); %>
<br>
<br>
<%out.println("In 2nd Position Candidate's ID : ");%>
<%out.println(cnd2id); %>
<br>
<%out.println("In 2nd Position Candidate's Name : ");%>
<%out.print(cnd2name); %>
<br>
<%out.println("In 2nd Position Candidate's Political Party : "); %>
<%out.print(cnd2party); %>
<br>
<%out.println("In 2nd Position Candidate's Total Votes : ");%>
<%out.print(cnd2vote); %>
<br>
<%out.println("_______________________________________________"); %>
<br>
<br>
<%out.println("***3rd POSITION VOTE"); %>
<br>
<%out.println("_______________________________________________"); %>
<br>
<br>
<%out.println("In 3rd Position Candidate's ID : ");%>
<%out.println(cnd3id); %>
<br>
<%out.println("In 3rd Position Candidate's Name : ");%>
<%out.print(cnd3name); %>
<br>
<%out.println("In 3rd Position Candidate's Political Party : "); %>
<%out.print(cnd3party); %>
<br>
<%out.println("In 3rd Position Candidate's Total Votes : ");%>
<%out.print(cnd3vote); %>
<br>
<%out.println("_______________________________________________"); %>
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