package classes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class singleproduct {
	public Pclass returnproduct(String id) {
		
		Pclass p = new Pclass();
		final String url = "jdbc:mysql://localhost:3307/iorderapp";
		final String password = "";
		final String user = "root";
	

		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, user, password);
			
			String query = "select * from products where product_id =?";
			
			
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, id);

			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
			
			p.setProduct_id(rs.getInt(1));
			p.setProduct_name(rs.getString(2));
			p.setProduct_price(rs.getFloat(3));
			p.setProduct_url(rs.getString(4));
			}
			
			con.close();
			
			

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			
		}
		return p;

	}


}
