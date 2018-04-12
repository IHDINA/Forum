package Forum;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/poserQ")
public class poserQ extends HttpServlet {

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
		Connection conn=null;
		
		try {
			
			DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	        Date date = new Date();
	        System.out.println(dateFormat.format(date));
	        
	        
			String Cat = req.getParameter("Categorie");
			
			String Q=req.getParameter("question");
			
			String userId= req.getParameter("userId");
			
			conn = Conn.getCon();
			
			String sql = "INSERT INTO Question(question, Categorie, userId, Date) VALUES (?,?,?,'"+dateFormat.format(date)+"')";
	        PreparedStatement statement;
	        
	        statement = conn.prepareStatement(sql);
	        statement.setString(1, Q);
	        statement.setString(2, Cat);
	        statement.setString(3,userId );
	        
	        
	        
	        
	        
	        int row = statement.executeUpdate();
	        
	        if (row > 0) {
	        	
	        	System.out.println("Question posed");
    			
    	        
	        	conn=null;
    	        resp.sendRedirect("user.jsp"); 
    	        

	        }
	        
			
			
		}catch(Exception e) {
			conn=null;
			System.out.println("Err "+e.getMessage());
			//resp.sendRedirect("index.jsp");
			
		}
		
		
	}
}
