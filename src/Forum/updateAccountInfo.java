package Forum;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Statement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;;

@WebServlet("/updateAccountInfo")
public class updateAccountInfo extends HttpServlet{

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
		
		
		String nvEmail = req.getParameter("Nvemail");
		
		String nvPass = req.getParameter("NvPass");
		
		String user = req.getParameter("userId");
		
		if(nvPass.equals("")) {
			
			Connection conn = Conn.getCon();
	        String sql = "update user set Email=? where userId=?";
	        PreparedStatement statement;
	        try {
	        	statement = conn.prepareStatement(sql);
		        statement.setString(1, nvEmail);
		        statement.setString(2,user);
		        
		        int row = statement.executeUpdate();
		        
		        if (row > 0) {
		        	
		        	System.out.println("email changed succes");
	    			HttpSession session=req.getSession();  

	    	        session.setAttribute("Email",nvEmail);
	    	        
	    	        conn=null;
	    	        resp.sendRedirect("user.jsp"); 
	    	        

		        }
		        
		        
		        
		        	
	        }catch (SQLException e) {
				// TODO: handle exception
	        	conn=null;
	        	resp.sendRedirect("index.jsp");
			}
	
		}
		else {
			
			
			System.out.println("pass not empty");
			
			Connection conn = Conn.getCon();
	        String sql = "update user set Email=? , pass=? where userId=?";
	        PreparedStatement statement;
	        try {
	        	statement = conn.prepareStatement(sql);
		        statement.setString(1, nvEmail);
		        statement.setString(2, nvPass);		        
		        statement.setString(3,user);
		        
		        int row = statement.executeUpdate();
		        
		        if (row > 0) {
		        	
		        	System.out.println("email and pass changed succes");
	    			HttpSession session=req.getSession();  

	    	        session.setAttribute("Email",nvEmail);
	    	        session.setAttribute("pass",nvPass);

	    	        
	    	        conn=null;
	    	        resp.sendRedirect("user.jsp"); 
	    	        

		        }
		        
		        
		        
		        	
	        }catch (SQLException e) {
				// TODO: handle exception
	        	conn=null;
	        	resp.sendRedirect("index.jsp");
	        	
			}
			
			
		}
		
		
		
		
		
		
	}
	

}
