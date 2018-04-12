package Forum;


import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/TraitementLogin")
public class TraitementLogin extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.doGet(req, resp);
		resp.sendRedirect("index.jsp");

	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.doPost(req, resp);
		
		
		
		
		String Email=req.getParameter("email");  
	    String pass=req.getParameter("pass");
	    
		Connection con=Conn.getCon();
		
		String rqt="select * from user where email='"+Email+"' and pass='"+pass+"'";
		
		Statement stmt;
		try {
			
			stmt = con.createStatement();
			ResultSet res = stmt.executeQuery(rqt); 
			res.next();
			
			HttpSession session=req.getSession();  
	        session.setAttribute("userId",res.getInt(1));
	        session.setAttribute("Nom",res.getString(2));
	        session.setAttribute("Prenom",res.getString(3));
	        session.setAttribute("Sexe",res.getString(4));
	        session.setAttribute("DateNaiss",res.getDate(5));
	        session.setAttribute("Email",res.getString(6));
	        session.setAttribute("pass",pass);
	        
	        con=null;
			resp.sendRedirect("user.jsp");
	        
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
				req.setAttribute("err", 1);
				con=null;
				
				
				req.getRequestDispatcher("index.jsp").forward(req, resp);
				 
			
			
		} 
	    

		
		
		
		

		


	    
	    
	    
	    
	}

}
