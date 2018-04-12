package Forum;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/updatePersonalInfo")
@MultipartConfig(maxFileSize = 16177215) 
public class updatePersonalInfo extends HttpServlet{
	
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
		
		
		Part filePart = req.getPart("img");
		InputStream inputStream = null;

		
		if(filePart.getSize() == 0) {
			
			System.out.println("image empty");
			
			String nvNom=req.getParameter("Nvnom");
			String nvprenom=req.getParameter("NvPrenom");
			String nvDate=req.getParameter("NvDatNaiss");
			String nvsexe=req.getParameter("Sexe");
			String userId=req.getParameter("userId");
			
			
			
			
			Connection conn = Conn.getCon();
	        String sql = "update user set Nom=?, Prenom=?,Sexe=?, DateNaiss=?  where userId=?";
	        PreparedStatement statement;
	        try {
	        	statement = conn.prepareStatement(sql);
		        statement.setString(1, nvNom);
		        statement.setString(2,nvprenom);
		        statement.setString(3,nvsexe);
		        statement.setString(4,nvDate);
		        statement.setString(5,userId);
		        
		        int row = statement.executeUpdate();
		        
		        if (row > 0) {
		        	
		        	System.out.println("info changed without image");
	    			HttpSession session=req.getSession();  

	    			
	    	        session.setAttribute("Nom",nvNom);
	    	        session.setAttribute("Prenom",nvprenom);
	    	        session.setAttribute("Sexe",nvsexe);
	    	        session.setAttribute("DateNaiss",nvDate);
	    	        
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
			
			
			System.out.println("image not empty");
			System.out.println(" nom image "+filePart.getSize());
			
			
			inputStream = filePart.getInputStream();
			
			
			String nvNom=req.getParameter("Nvnom");
			String nvprenom=req.getParameter("NvPrenom");
			String nvDate=req.getParameter("NvDatNaiss");
			String nvsexe=req.getParameter("Sexe");
			String userId=req.getParameter("userId");
			
			
			
			
			Connection conn = Conn.getCon();
	        String sql = "update user set Nom=?, Prenom=?,Sexe=?, DateNaiss=?,img=? where userId=?";
	        PreparedStatement statement;
	        try {
	        	statement = conn.prepareStatement(sql);
		        statement.setString(1, nvNom);
		        statement.setString(2,nvprenom);
		        statement.setString(3,nvsexe);
		        statement.setString(4,nvDate);
		        
		        if (inputStream != null) {
	                // fetches input stream of the upload file for the blob column
	                statement.setBlob(5, inputStream);
	            }
		        
		        statement.setString(6,userId);

		        
		        int row = statement.executeUpdate();
		        
		        if (row > 0) {
		        	
		        	System.out.println("info changed with image");
	    			HttpSession session=req.getSession();  

	    			
	    	        session.setAttribute("Nom",nvNom);
	    	        session.setAttribute("Prenom",nvprenom);
	    	        session.setAttribute("Sexe",nvsexe);
	    	        session.setAttribute("DateNaiss",nvDate);
	    	        
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
