package Forum;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.mysql.jdbc.Statement;


@WebServlet("/addUser")
@MultipartConfig(maxFileSize = 16177215) 
public class addUser extends HttpServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	user u=new user();

	private int insertedId;
	
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
		PrintWriter out =resp.getWriter();
				
				
		try {
			
			u.nom = req.getParameter("nom");
			u.prenom=req.getParameter("prenom");
			u.email=req.getParameter("email");
			
			u.datenaiss=req.getParameter("ann")+"-"+req.getParameter("mois")+"-"+req.getParameter("jour");
			u.pass=req.getParameter("pass");
			u.sexe=req.getParameter("sexe");
			

			
			//out.println(u.nom+" "+u.prenom+" "+u.email+" "+u.datenaiss+" "+u.pass+"  "+u.sexe);
			
			
		}catch(Exception e) {
			
			
			resp.sendRedirect("index.jsp");
			
		}
		
		InputStream inputStream = null;
		
		// obtains the upload file part in this multipart request
        Part filePart = req.getPart("img");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }
        
        
        Connection conn = null;
        
        conn=Conn.getCon();
        
        
        String sql = "INSERT INTO user(Nom, Prenom, Sexe, DateNaiss, Email, pass, img) VALUES (?,?,?,?,?,?,?)";
        PreparedStatement statement;
		try {
			statement = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
	        statement.setString(1, u.nom);
	        statement.setString(2, u.prenom);
	        statement.setString(3, u.sexe);
	        statement.setString(4, u.datenaiss);
	        statement.setString(5, u.email);
	        statement.setString(6, u.pass);
	        
	        if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(7, inputStream);
            }
	        
	        
	        int row = statement.executeUpdate();
	        
	        ResultSet rs = statement.getGeneratedKeys();
	        

	        if (rs.next()){
	            insertedId=rs.getInt(1);
	        }
            if (row > 0) {

    			HttpSession session=req.getSession();  
    	        session.setAttribute("userId",insertedId);
    	        session.setAttribute("Nom",u.nom);
    	        session.setAttribute("Prenom",u.prenom);
    	        session.setAttribute("Sexe",u.sexe);
    	        session.setAttribute("DateNaiss",u.datenaiss);
    	        session.setAttribute("Email",u.email);
    	        session.setAttribute("pass",u.pass);

    	        
    	        conn=null;
    	        resp.sendRedirect("user.jsp"); 
            }
            
	        
	        
	        
	       
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			//out.println("ERRRR :" + e.getMessage());
			e.printStackTrace();
			conn=null;
			resp.sendRedirect("index.jsp"); 
		}

        
        
        
        
        
		
		
		
	}

}
