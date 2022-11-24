

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class loginsvt
 */
@WebServlet("/loginsvt")
public class loginsvt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginsvt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		String phone = request.getParameter("phone");
		String pass = request.getParameter("pass");
		try {
			 String URL = "jdbc:mysql://localhost:3307/iorderapp";
			final  String DPASS = "";
		    final String USER = "root";
		    final String DRIVER = "com.mysql.jdbc.Driver";
		    Class.forName(DRIVER);
			Connection con = DriverManager.getConnection(URL,USER,DPASS);
			String query = "select user_id from users where user_phone=? and user_pass=?";
			PreparedStatement st = con.prepareStatement(query);
			st.setString(1, phone);
			st.setString(2, pass);
			ResultSet rs = st.executeQuery();
			String id = null;
			if(rs.next()) {
				id = rs.getString(1);
			}
			
			if(id!=null) {
				out.print(id);
				session.setAttribute("uid", id);
				session.setAttribute("upass", pass);
			}
			else {
				out.append("Wrong Details...");
			}
			con.close();

		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
