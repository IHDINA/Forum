package Forum;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class images
{
  /*-------------------------
   *   Get the Blob image
   *------------------------*/
  public static byte[] getPhoto (Connection conn, int iNumPhoto)
       throws Exception, SQLException
  {

    String req = "" ;
    Blob img ;
    byte[] imgData = null ;
    Statement stmt = conn.createStatement ();
    
    // Query
    req = "Select img From user Where userId = " + iNumPhoto ;
    
    ResultSet rset  = stmt.executeQuery ( req ); 
    
    while (rset.next ())
    {    
      img = rset.getBlob(1);
      imgData = img.getBytes(1,(int)img.length());
    }    
    
    rset.close();
    stmt.close();
    
    return imgData ;

  }
  
} 