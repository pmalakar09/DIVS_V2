package com.divs.servlets;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class VoteSubmission extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	private String cndt;
	private int i=0;
	private String vote="select total_votes from candidates where candidate_id=?";
	private String addvote="update candidates set total_votes=? where candidate_id=?";
	private String votingstatusupdate="update voters set vote_status=1 where voter_id=?";
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	
	public void init()
	{
	
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/prasenjit","root","admin");
			
		}
		 catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	public void service(HttpServletRequest req,HttpServletResponse res) throws IOException
	{
		HttpSession hs=req.getSession();
		String vid=(String) hs.getAttribute("VoterID");
		System.out.println("Voter: "+vid);
		cndt=req.getParameter("candidate");
		System.out.println("Candidate: "+cndt);
		if("c1".equals(cndt))
				{
			        try
			        {
			        	String c=(String)hs.getAttribute("CandidateID1");
			        	System.out.println("CandidateID1: "+c);
					    pstmt=con.prepareStatement(vote);
				     	pstmt.setString(1,c);
						rs=pstmt.executeQuery();
						rs.next();
					    i=rs.getInt(1);
						i++;
						pstmt=con.prepareStatement(addvote);
				    	pstmt.setInt(1, i);
						pstmt.setString(2,c);
						pstmt.executeUpdate();
						pstmt=con.prepareStatement(votingstatusupdate);
						pstmt.setString(1,vid);
						pstmt.executeUpdate();
						res.sendRedirect("/Project_DigitalIndiaVotingSystemMVC/ThankYou.html");
					} 
			        
			        catch (SQLException e) 
			        {
						e.printStackTrace();
					}
				}
		else if("c2".equals(cndt))
				{
			 try
		        {
				    String c=(String)hs.getAttribute("CandidateID2");
				    System.out.println("CandidateID2: "+c);
					pstmt=con.prepareStatement(vote);
					pstmt.setString(1,c);
					rs=pstmt.executeQuery();
					rs.next();
					int i=rs.getInt(1);
					i=i+1;
					pstmt=con.prepareStatement(addvote);
					pstmt.setInt(1, i);
					pstmt.setString(2,c);
					pstmt.executeUpdate();
					pstmt=con.prepareStatement(votingstatusupdate);
					pstmt.setString(1,vid);
					pstmt.executeUpdate();
					res.sendRedirect("/Project_DigitalIndiaVotingSystemMVC/ThankYou.html");
				} 
		        
		        catch (SQLException e) 
		        {
					e.printStackTrace();
				}
			
				}
		else{
		          try
                       {
		                	String c=(String)hs.getAttribute("CandidateID3");
		                	System.out.println("CandidateID3: "+c);
		                	pstmt=con.prepareStatement(vote);
		                	pstmt.setString(1,c);
		                	rs=pstmt.executeQuery();
		                	rs.next();
		                	int i=rs.getInt(1);
		                	i=i+1;
		                	pstmt=con.prepareStatement(addvote);
		                	pstmt.setInt(1, i);
		                	pstmt.setString(2,c);
		                	pstmt.executeUpdate();
		                	pstmt=con.prepareStatement(votingstatusupdate);
							pstmt.setString(1,vid);
							pstmt.executeUpdate();
		                	res.sendRedirect("/Project_DigitalIndiaVotingSystemMVC/ThankYou.html");
                       } 
        
		          catch (SQLException e) 
		          	{
		        	  		e.printStackTrace();
		          	}
		System.out.println("vote updated");
			}
	 }
}