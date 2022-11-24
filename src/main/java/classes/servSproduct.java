package classes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class servSproduct {
	final String url = "jdbc:mysql://localhost:3307/iorderapp";
	final String password = "";
	final String user = "root";
	public ArrayList<Pclass> returnSproduct(String value){
		ArrayList<Pclass> Sproducts = new ArrayList<Pclass>();
	try {
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, user, password);
			
			String query = "select * from products where product_name like ?";
			
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, value);

			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				Pclass p  = new Pclass();
				p.setProduct_id(rs.getInt(1));
				p.setProduct_name(rs.getString(2));
				p.setProduct_price(rs.getFloat(3));
				p.setProduct_url(rs.getString(4));
				System.out.println("Search completed in serveproduct servlet with names" + rs.getString(2));
				Sproducts.add(p);
			}
			System.out.println("Search completed in serveproduct servlet");
			con.close();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			
		}
		
		return Sproducts;
	}
}
