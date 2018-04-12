package Forum;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/hh")
public class test extends HttpServlet {
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.doPost(req, resp);
		
		
		
		Connection conn=Conn.getCon();
		
		String requete= "SELECT q.idQ,q.question,c.Cat,u.Nom,u.Prenom,q.Date FROM question q,user u,categorie c WHERE q.userId=u.userId and c.idCat=q.Categorie and u.userId=1 ORDER BY Date DESC";
		Statement stmt;
		try {
			
			
			stmt = conn.createStatement();
			ResultSet res = stmt.executeQuery(requete);
			
			while(res.next()) {

				System.out.println("    q : "+res.getString(2)+" cat   "+res.getString(3)+"   userid"+res.getInt(4) +"  date "+res.getDate(5)+" "+res.getTime(5)+"");
			
			}
			

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
	}

}
