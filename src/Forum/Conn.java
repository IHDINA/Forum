package Forum;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conn {

	static Connection con;

	public static Connection getCon(){
		try{
			Class.forName(Data.DRIVER);
			con=DriverManager.getConnection(Data.URL,Data.USERNAME,Data.PASSWORD);
			
		}catch(Exception e){}
		return con;
	}

}

