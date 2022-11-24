

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import classes.ConnectToDB;

/**
 * Servlet implementation class AddToCart
 */
@WebServlet("/AddToCart")
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		if(session.getAttribute("uid")!=null) {
			String uid = (String) session.getAttribute("uid");
			String pid = request.getParameter("p_id");
			ConnectToDB db = new ConnectToDB();
			Connection con = db.getConn();
				try {
			String query = "insert into cart(user_id,product_id) values(?,?)";
				 PreparedStatement st = con.prepareStatement(query);
					
				 st.setString(1,uid);
				 st.setString(2, pid);
				
				 int rows = st.executeUpdate();
			 
				 if(rows>0) {
					out.print("item added");
					con.close();
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
