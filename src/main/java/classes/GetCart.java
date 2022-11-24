package classes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class GetCart {
	
	public ArrayList<CartProduct> getCart(String uid) {
		ArrayList<CartProduct> products = new ArrayList<CartProduct>();
		try {
			ConnectToDB db = new ConnectToDB();
			Connection con = db.getConn();
			String query = "select * from cart natural join users natural join products where user_id=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, uid);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				CartProduct p  = new CartProduct();
				p.setCart_id(rs.getString("cart_id"));
				p.setP_id(rs.getString("product_id"));
				p.setP_name(rs.getString("product_name"));
				p.setP_price(rs.getFloat("product_price"));
				p.setP_url(rs.getString("product_img_url"));
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
