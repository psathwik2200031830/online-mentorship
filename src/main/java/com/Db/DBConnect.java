package com.Db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {

	private static Connection conn;
	
	public static Connection getConn() {
		try {
			// Correct JDBC Driver class for MySQL
			Class.forName("com.mysql.cj.jdbc.Driver");
			// Establish connection
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinecourse", "root", "venki1234");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}
