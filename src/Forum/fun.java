package Forum;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class fun {
	
	public static int getNbrReponse(String idQ) {

		
		int nbr=-1;
		
		Connection conn=Conn.getCon();
		
		String requete= "select count(*) from reponse where idQ="+idQ+"" ;
		Statement stmt;
		try {
			
			
			stmt = conn.createStatement();
			ResultSet res = stmt.executeQuery(requete);
			
			while(res.next()) {
				
				nbr=res.getInt(1);
			}
			

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			nbr=-1;
		}
		
		conn=null;
		
		return nbr;
	}

	
	public static boolean Exist(String Email) {
		
		
		int count=-1;
		Connection conn=Conn.getCon();
		
		String requete= "select count(*) from user where Email='"+Email+"'" ;
		Statement stmt;
		try {
			
			
			stmt = conn.createStatement();
			ResultSet res = stmt.executeQuery(requete);
			
			while (res.next()) {
				count=res.getInt(1);
				System.out.println(count);
			}
			

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
		System.out.println(e.getMessage());
			
		}
		conn=null;
		
		
		if(count==0) {
			return false;
		}else
		return true;

	}
	
	
	public static int GetNbrQuestionPoser(String userId) {

		
		int nbr=-1;
		
		Connection conn=Conn.getCon();
		
		String requete= "select count(*) from question where userId="+userId+"" ;
		Statement stmt;
		try {
			
			
			stmt = conn.createStatement();
			ResultSet res = stmt.executeQuery(requete);
			
			while(res.next()) {
				
				nbr=res.getInt(1);
			}
			

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			nbr=-1;
		}
		
		conn=null;
		
		return nbr;
	}
	
	public static int GetNbrReponsePoser(String userId) {

		
		int nbr=-1;
		
		Connection conn=Conn.getCon();
		
		String requete= "select count(*) from reponse where userId="+userId+"" ;
		Statement stmt;
		try {
			
			
			stmt = conn.createStatement();
			ResultSet res = stmt.executeQuery(requete);
			
			while(res.next()) {
				
				nbr=res.getInt(1);
			}
			

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			nbr=-1;
		}
		
		conn=null;
		
		return nbr;
	}
	
	
	
}
