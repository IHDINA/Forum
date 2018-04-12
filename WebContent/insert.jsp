<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    
    import="Forum.*"
    import="java.io.IOException"
	import="java.sql.Connection"
	import="java.sql.ResultSet"
	import="java.sql.SQLException"
	import="java.sql.Statement"
	
	import="java.sql.PreparedStatement"
	import="java.text.DateFormat"
	import="java.text.SimpleDateFormat"
	import="java.util.Date"
    
    
    %>
    
    <%!

Connection conn=null;
String requete;
Statement stmt;
ResultSet res;

%>



    
    

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%

try{
	
	
	DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	Date date = new Date();
	
	
	String id = request.getParameter("id");
	
	String Qid=request.getParameter("Qid");
	
	String s= request.getParameter("s");
	System.out.println("reponse "+s);

	String r = s.replace("--"," ");
	
	conn = Conn.getCon();
	
	String sql = "INSERT INTO reponse (Reponse,userId,DateR,idQ) VALUES (?,?,'"+dateFormat.format(date)+"',?)";
	PreparedStatement statement;
	
	statement = conn.prepareStatement(sql);
	statement.setString(1, r);
	statement.setString(2, id);
	statement.setString(3, Qid );
	


	int row = statement.executeUpdate();
	
	if (row > 0) {
			
		System.out.println("insert secc");
		conn=null;    

	}

}catch(Exception e) {
conn=null;
System.out.println("Err "+e.getMessage());
//resp.sendRedirect("index.jsp");

}

%>
    
</body>
</html>