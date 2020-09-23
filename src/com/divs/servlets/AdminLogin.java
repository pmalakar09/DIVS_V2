package com.divs.servlets;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.divs.core.Model;
import com.divs.utils.Connector;

public class AdminLogin extends HttpServlet
{
	private static Logger log = Logger.getLogger(AdminLogin.class);
	private static Connection con = null;
	Connector objConnector = new Connector();
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	private String adminquery="select user_name,password from admins where admin_id=?";
	private String adminusernamefromdatabase;
	private String adminpasswordfromdatabase;
	private static final long serialVersionUID = 1L;
	public void init()
	{
		try 
		{
//			Class.forName("oracle.jdbc.driver.OracleDriver");
//			con=DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/XE","admin","1989");
//			Class.forName("com.mysql.jdbc.Driver");  
//			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/prasenjit","root","admin");  
			if(con==null){
				con = objConnector.getConnection();
				System.out.println("Connection Established For Admin!");
				log.debug("DB Connection Established For Admin!");
			}
		}
		 catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	public void service(HttpServletRequest req,HttpServletResponse res)
		{
		String adminid=req.getParameter("AdminID");
		String adminusername=req.getParameter("AdminUserName");
		String adminpassword=req.getParameter("AdminPassword");
		System.out.println(adminid);
		System.out.println(adminusername);
		System.out.println(adminpassword);
		try 
		{
			pstmt=con.prepareStatement(adminquery);
			pstmt.setString(1, adminid);
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				adminusernamefromdatabase=rs.getString(1);
				adminpasswordfromdatabase=rs.getString(2);
				System.out.println(adminusernamefromdatabase);
				System.out.println(adminpasswordfromdatabase);
			}
		if((adminusernamefromdatabase.equals(adminusername))&&(adminpasswordfromdatabase.equals(adminpassword)))
		{
			try 
			{
				res.sendRedirect("/Project_DigitalIndiaVotingSystemMVC/AdminAction.html");
			} 
			catch (Exception e)
			{
				e.printStackTrace();
			}
		}
		else
		{
			try
			{
				res.sendRedirect("/Project_DigitalIndiaVotingSystemMVC/IncorrectAdminCredentials.html");
			}
			
			catch (Exception e) 
			{
				e.printStackTrace();
			}
		}
			
			
		} 
		
		catch (SQLException e) 
		{
			
			e.printStackTrace();
		}
		}
	
	
	
}