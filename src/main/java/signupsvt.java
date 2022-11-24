import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/signupsvt")
public class signupsvt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public signupsvt() {
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
		String uname = request.getParameter("username");
		String phone = request.getParameter("phone");
		String pass = request.getParameter("pass");
		String email = request.getParameter("email");
		
		 
		
		try {
			 String URL = "jdbc:mysql://localhost:3307/iorderapp";
			final  String DPASS = "";
		    final String USER = "root";
		    final String DRIVER = "com.mysql.jdbc.Driver";
		    Class.forName(DRIVER);
			Connection con = DriverManager.getConnection(URL,USER,DPASS);
			String vquery = "select user_id from users where user_phone=?";
			PreparedStatement st2 = con.prepareStatement(vquery);
			st2.setString(1, phone);
			ResultSet rs2 = st2.executeQuery();
			if(rs2.next()) {
				out.append("User already Exists with Phone - "+phone+ "<br>Redirecting to Login page in 5 sec ");
			}
			else {
				
				
				String query = "insert into users(user_name,user_phone,user_email,user_pass) values (?,?,?,?)";
				 PreparedStatement st = con.prepareStatement(query);
					
				 st.setString(1,uname);
				 st.setString(2, phone);
				 st.setString(3,email);
				 st.setString(4,pass);
				 int rows = st.executeUpdate();
			 
				 if(rows>0) {
					out.append("User created with Phone - "+phone);
					
				 }
				 else out.append("Problem occured..");
			}
			
			
			 
			 
				
			
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	    
	   
		
		
		
		
		
	}

}
