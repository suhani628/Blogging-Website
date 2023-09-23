package com.tech.blog.helper;

import java.sql.Connection;
import java.sql.*;

public class connectionprovider {
private static Connection con;
	public static Connection getConnection() {
		try {
			if(con==null) {
				//driver class
				Class.forName("com.mysql.cj.jdbc.Driver");
				//create a connection
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog","root","connection");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return con;
	}
}
