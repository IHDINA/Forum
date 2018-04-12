<%@ page import = "Forum.*" %>
<%@ page import = "java.io.*" %>
<%@ page import = "java.sql.Connection" %>

<jsp:useBean id="photo" class="Forum.images" scope="session" />
<%
 
  int iNumPhoto ;
  Connection conn = null;
  
  if ( request.getParameter("imgID") != null )
  {
   
    iNumPhoto = Integer.parseInt(request.getParameter("imgID")) ;   
  
    try
    {  
       conn = Conn.getCon();
       conn.setAutoCommit (false);  
  
       // get the image from the database
       byte[] imgData = photo.getPhoto( conn, iNumPhoto  ) ;   
       // display the image
       response.setContentType("image/png");
       OutputStream o = response.getOutputStream();
       o.write(imgData);
       o.flush(); 
       o.close();
    }
    catch (Exception e)
    {
      e.printStackTrace();
      throw e;
    }
    finally
    {
      conn=null;
    }  
  }
%>