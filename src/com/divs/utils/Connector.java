package com.divs.utils;

import java.sql.Connection;
import java.sql.DriverManager;

import org.apache.log4j.Logger;

public class Connector {
	private static Logger log = Logger.getLogger(Connector.class.getName());
	private static Connection connection;
	private static String dbURL = null;
	private static String dbUSER = null;
	private static String dbDriver = null;
	private static String dbPASSWORD = null;
	private static String db = null;
	private static String dbPort = "3306"; // Default PORT assigned.

	public static void setDbUrl(String dbURL) {
		Connector.dbURL = dbURL;
	}

	public static void setDbUser(String dbUSER) {
		Connector.dbUSER = dbUSER;
	}

	public static void setDbPassword(String dbPASSWORD) {
		Connector.dbPASSWORD = dbPASSWORD;
	}

	public static void setDb(String db) {
		Connector.db = db;
	}

	public static void setDbDriver(String dbDriver) {
		Connector.dbDriver = dbDriver;
	}

	public static void setDbPort(String dbPort) {
		Connector.dbPort = dbPort;
	}

	public Connection getConnection() {
		try {
			Loader objLoader = new Loader();
			//System.out.println("con");
			//System.out.println(objLoader);
			objLoader.readInputs();
			System.out.println("Static values: " + dbURL);
			System.out.println("Static values: " + db);
			System.out.println("Static values: " + dbDriver);
			System.out.println("Static values: " + dbPASSWORD);
			System.out.println("Static values: " + dbUSER);
			System.out.println("Static values: " + dbPort);
			
			log.debug("Static values: " + dbURL);
			log.debug("Static values: " + db);
			log.debug("Static values: " + dbDriver);
			log.debug("Static values: " + dbPASSWORD);
			log.debug("Static values: " + dbUSER);
			log.debug("Static values: " + dbPort);
			
			if (this.connection != null || dbURL == null || dbUSER == null || dbPASSWORD == null || db == null) {
				//System.out.println("Inside if");
				 log.debug("In dbcore.properties file mandatory fields are empty ==> " + "DBURL= " + dbURL + ";"
				 + "DBUSER= " + dbUSER + ";" + "DBPASSWORD= " + dbPASSWORD +
				 "\n"
				 + "Please fill the dbcore.properties properly!!");
			}

			else {
				//System.out.println("Inside else!");
				Class.forName(dbDriver);
				log.info("Driver Loading Is Done Successfully");
				this.connection = DriverManager.getConnection(dbURL.concat(":") + dbPort.concat("/") + db, dbUSER,
						dbPASSWORD);
				log.info("Connecting To The DB : " + dbUSER);
				log.info("DB connection done successfully");
				return this.connection;
			}
		} catch (Exception e) {
			log.debug(e);
		}
		return connection;

	}

}
