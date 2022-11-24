package classes;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectToDB {
	final String url = "jdbc:mysql://localhost:3307/iorderapp";
	final String password = "";
	final String user = "root";
	public Connection getConn() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, user, password);
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		
		return con;
	}

}
