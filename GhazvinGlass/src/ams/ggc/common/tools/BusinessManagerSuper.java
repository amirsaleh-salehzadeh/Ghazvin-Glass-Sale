package ams.ggc.common.tools;

import java.sql.DriverManager;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;

public class BusinessManagerSuper {
	public Connection cn(){
		Connection cn = null ;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception ex) {
			ex.printStackTrace();

		}
		try {
			cn =(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/ggc?characterEncoding=utf8", "root", "root");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cn;
	} 
}
