package com.tap.utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

	private static final String URL="jdbc:mysql://localhost:3306/FoodApp";
	private static final String USER="root";
	private static final String PS="root";
	private static Connection connection =null;
	
	   public static Connection getConnection() {
		        try {
		        	Class.forName("com.mysql.cj.jdbc.Driver");
		           connection = DriverManager.getConnection(URL, USER, PS);
		          
		        } 
		        catch (ClassNotFoundException e) {
		        	e.printStackTrace();
		        }
		        catch (SQLException e) {
		            e.printStackTrace();
		        }
		        return connection;
		    
              }

}
