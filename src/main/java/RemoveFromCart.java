

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import classes.ConnectToDB;


@WebServlet("/RemoveFromCart")
public class RemoveFromCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String cid = request.getParameter("cart_id");
		HttpSession session = request.getSession();
		
		if(session.getAttribute("uid")!=null) {
			
			
			ConnectToDB db = new ConnectToDB();
			Connection con = db.getConn();
				try {
			String query = "delete from cart where cart_id=?";
				 PreparedStatement st = con.prepareStatement(query);
				 st.setString(1,cid);
				 int rows = st.executeUpdate();
				 con.close();
				 if(rows>0) {
					out.print("item removed");
					
				 }
				 else out.print("Problem occured..");
		}catch(Exception e){
			e.printStackTrace();
		}
		}
		else {
			out.print("login first");
			
		}
	}

}
