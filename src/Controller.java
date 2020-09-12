import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Controller extends HttpServlet
{
	
	private static final long serialVersionUID = 1L;

	public void service(HttpServletRequest req,HttpServletResponse res)
	{
		HttpSession hs=req.getSession(true);
		String voterid=req.getParameter("VoterID");
		System.out.println(voterid);
		hs.setAttribute("VoterID", voterid);
		Model m=new Model();
		m.setVoterID(voterid);
		boolean b=m.getResult();
		int status=m.getStatus();
		if(status==1)
		{
			try
			{
				res.sendRedirect("/Project_DigitalIndiaVotingSystemMVC/VoteAlreadySubmitted.html");
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		else if(b==true)
		{
			String c1=m.getC1();
			String c2=m.getC2();
			String c3=m.getC3();
			String p1=m.getP1();
			String p2=m.getP2();
			String p3=m.getP3();
			String cid1=m.getCid1();
			String cid2=m.getCid2();
			String cid3=m.getCid3();
			
			hs.setAttribute("Candidate1",c1);
			hs.setAttribute("Party1", p1);
			hs.setAttribute("CandidateID1", cid1);
			hs.setAttribute("Candidate2",c2);
			hs.setAttribute("Party2", p2);
			hs.setAttribute("CandidateID2", cid2);
			hs.setAttribute("Candidate3",c3);
			hs.setAttribute("Party3", p3);
			hs.setAttribute("CandidateID3", cid3);
			
			try
			{
				res.sendRedirect("/Project_DigitalIndiaVotingSystemMVC/DisplayCandidate.jsp");
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		else
		{
			try
			{
			 res.sendRedirect("/Project_DigitalIndiaVotingSystemMVC/IncorrectVI.jsp");	
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
	}
}