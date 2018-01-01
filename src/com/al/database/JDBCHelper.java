package com.al.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCHelper {
	
	public static Connection getConnection(){
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://cdh01:3306/al?useUnicode=true&characterEncoding=utf-8";
			String username = "root";
			String password = "adminal";
			url += "&user=" + username + "&password=" + password;
			// System.out.println(url);
			conn = DriverManager.getConnection(url);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public static void main(String[] args) {
		JDBCHelper.getConnection();
	}
}
