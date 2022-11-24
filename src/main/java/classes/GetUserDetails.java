package classes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class GetUserDetails {
	public User getuserByid(long id) {
		User u = new User();
		ConnectToDB d  = new ConnectToDB();
		Connection con = d.getConn();
		String query = "select * from users where user_id =?";
		
		
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(query);
			ps.setLong(1, id);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
			u.setUser_id(rs.getLong(1));
			u.setUser_email(rs.getString(4));
			u.setUser_phone(rs.getString(3));
			u.setUser_name(rs.getString(2));
			con.close();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return u;
	}
}
