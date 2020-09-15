package com.divs.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Properties;
import java.util.ResourceBundle;

import org.apache.log4j.Logger;

import com.divs.core.Model;
import com.divs.servlets.AdminLogin;
import com.divs.servlets.VoteSubmission;

public class Loader {
	private static ResourceBundle resourceBundle = null;
	static Logger log = Logger.getLogger(Loader.class);

	public void readInputs() {
		System.out.println("loader");
		Connector objConnector = new Connector();
		System.out.println(objConnector);
		FileInputStream fileInput = null;

		try {
			// InputStream fileInput =
			// this.getClass().getClassLoader().getResourceAsStream("/dbcore.properties");
			// InputStream fileInput =
			// this.getClass().getClassLoader().getResourceAsStream("dbcore.properties");
			// File file = new File("dbcore.properties");
			// fileInput = new FileInputStream(file);
			// Properties properties = new Properties();
			// System.out.println("InputStream is: " + fileInput);
			// System.out.println("Try");
			// //File file = new File("dbcore.properties");
			// System.out.println("try2");
			// System.out.println(fileInput);
			// System.out.println(new File(".").getAbsolutePath());
			// fileInput = new FileInputStream(file);
			// System.out.println("try3");
			// System.out.println("dbcore.properties is loading......");
			// log.info("dbcore.properties is loading......");
			// properties.load(fileInput);
			//System.out.println("dbcore.properties loaded succesfully");
			// log.info("dbcore.properties loaded succesfully");

			// objConnector.setDbUrl(properties.getProperty("DBURL"));
			// objConnector.setDbDriver(properties.getProperty("DBDRIVER"));
			// objConnector.setDbUser(properties.getProperty("DBUSER"));
			// objConnector.setDbPassword(properties.getProperty("DBPASSWORD"));
			// objConnector.setDb(properties.getProperty("DB"));

			// Connector.dbURL=getValueFromResourceBundle("DATASOURCE.DBURL");

			objConnector.setDbDriver(getValueFromResourceBundle("DATASOURCE.DRIVER"));
			objConnector.setDbUrl(getValueFromResourceBundle("DATASOURCE.DBURL"));
			objConnector.setDbPort(getValueFromResourceBundle("DATASOURCE.DBPORT"));
			objConnector.setDb(getValueFromResourceBundle("DATASOURCE.DB"));
			objConnector.setDbUser(getValueFromResourceBundle("DATASOURCE.DBUSER"));
			objConnector.setDbPassword(getValueFromResourceBundle("DATASOURCE.DBPASSWORD"));

			System.out.println("DBURL: " + getValueFromResourceBundle("DATASOURCE.DBURL"));
			System.out.println("DRIVER: " + getValueFromResourceBundle("DATASOURCE.DRIVER"));
			System.out.println("DBPORT: " + getValueFromResourceBundle("DATASOURCE.DBPORT"));
			System.out.println("DB: " + getValueFromResourceBundle("DATASOURCE.DB"));
			System.out.println("DBPASSWORD: " + getValueFromResourceBundle("DATASOURCE.DBPASSWORD"));
			System.out.println("DBUSER: " + getValueFromResourceBundle("DATASOURCE.DBUSER"));

		} catch (Exception e) {
			log.debug("ERROR during loading the dbcore.properties!!!! " + e);
		} finally {

		}
	}

	public static String getValueFromResourceBundle(String key) {
		try {
			if (resourceBundle == null) {
				resourceBundle = ResourceBundle.getBundle("dbcore");
			}
			return resourceBundle.getString(key);
		} catch (Exception e) {
			e.printStackTrace();
			// logger.error(e.getMessage());
		}
		return null;
	}
}
