package com.al.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ImpalaHelper {
	
	public static Connection getConnection(){
		Connection conn = null;
		try {
			Class.forName("org.apache.hive.jdbc.HiveDriver");
			conn =  DriverManager.getConnection("jdbc:hive2://cdh01:21050/;auth=noSasl", "", "");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public static void main(String[] args) {
		ImpalaHelper.getConnection();
	}
}
