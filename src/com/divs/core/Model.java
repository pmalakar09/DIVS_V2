package com.divs.core;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.apache.log4j.Logger;

import com.divs.utils.Connector;
import com.divs.utils.Loader;

public class Model {
	private static Logger log = Logger.getLogger(Model.class);
	private static Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	private String voterid;
	private int status;
	private String p_no;
	private String c1;
	private String c2;
	private String c3;
	private String p1;
	private String p2;
	private String p3;
	private String cid1;
	private String cid2;
	private String cid3;

	public Model(Connector objConnector) {
		try {
			// Loader objLoader=new Loader();
			System.out.println("DIVS Engine Initializing....");
			log.debug("DIVS Engine Initializing....");
			// Class.forName("oracle.jdbc.driver.OracleDriver");
			// Class.forName("com.mysql.jdbc.Driver");
			// System.out.println("Driver Loading Done!");
			// con =
			// DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/XE",
			// "admin", "1989");
			// con=DriverManager.getConnection("jdbc:mysql://localhost:3306/prasenjit","root","admin");
			// con=DriverManager.getConnection(dbURL+"/"+db+","+dbUSER+","+dbPASSWORD);
			if(con==null){
			con = objConnector.getConnection();
			System.out.println("Connection Established!");
			log.debug("DB Connection Established!");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void setVoterID(String voterid) {
		this.voterid = voterid;
	}

	public int getStatus() {
		return status;
	}

	public String getC1() {
		return c1;
	}

	public String getP1() {
		return p1;
	}

	public String getCid1() {
		return cid1;
	}

	public String getC2() {
		return c2;
	}

	public String getP2() {
		return p2;
	}

	public String getCid2() {
		return cid2;
	}

	public String getC3() {
		return c3;
	}

	public String getP3() {
		return p3;
	}

	public String getCid3() {
		return cid3;
	}

	public boolean getResult() {

		if ((voterid.length() == 6) && (voterid.charAt(0) == 'w') && (voterid.charAt(1) == 'b'))

		{
			String panchayat_no = "select panchayat_number, vote_status from voters where voter_id=?";
			try {
				pstmt = con.prepareStatement(panchayat_no);
				pstmt.setString(1, voterid);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					p_no = rs.getString(1);
					status = rs.getInt(2);
				}
				String candidatename = "select candidate_id, candidate_name,political_party from candidates where area_code=?";
				pstmt = con.prepareStatement(candidatename);
				pstmt.setString(1, p_no);
				rs = pstmt.executeQuery();
				{
					rs.next();
					cid1 = rs.getString(1);
					c1 = rs.getString(2);
					p1 = rs.getString(3);
					rs.next();
					cid2 = rs.getString(1);
					c2 = rs.getString(2);
					p2 = rs.getString(3);
					rs.next();
					cid3 = rs.getString(1);
					c3 = rs.getString(2);
					p3 = rs.getString(3);

				}

			} catch (Exception e) {
				e.printStackTrace();
			}
			return true;
		} else {
			return false;
		}
	}
}
