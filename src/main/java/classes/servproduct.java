package classes;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import classes.Pclass;



public class servproduct {
	final String url = "jdbc:mysql://localhost:3307/iorderapp";
	final String password = "";
	final String user = "root";
	public ArrayList<Pclass> returnproduct() {
		ArrayList<Pclass> products = new ArrayList<Pclass>();
		
		
		

		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, user, password);
			
			String query = "select * from products";
			
			Statement stmt = (Statement) con.createStatement();

			ResultSet rs = stmt.executeQuery(query);
			while(rs.next()){
				Pclass p  = new Pclass();
				p.setProduct_id(rs.getInt(1));
				p.setProduct_name(rs.getString(2));
				p.setProduct_price(rs.getFloat(3));
				p.setProduct_url(rs.getString(4));
				products.add(p);
			}
			con.close();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			
		}
		return products;

	}
	
	

}
