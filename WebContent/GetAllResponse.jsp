<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    
    import="Forum.*"
    import="java.io.IOException"
	import="java.sql.Connection"
	import="java.sql.ResultSet"
	import="java.sql.SQLException"
	import="java.sql.Statement"
    
    
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
								
								conn=Conn.getCon();
								requete= "select r.userId,u.nom,u.prenom,r.DateR,r.Reponse from user u,question q,reponse r where u.userId=r.userId and r.idQ = q.idQ and q.idQ="+request.getParameter("id")+" order by r.DateR desc";
								try{
									stmt = conn.createStatement();
									ResultSet res = stmt.executeQuery(requete);
									
                            while(res.next()) {
                            	
                            %>
								                            
								<div class="row" style="background-color: #f4f3ef;margin-left: -10;margin-right: 0px;margin-left: 0px;">
								                                    
								                                    <div class="col-md-3 col-md-offset-1" style="
																		    padding-left: 0px;
																		    padding-right: 0px;
																		    width: 100px;
																		    margin-left: 0px;
																		    left: 10px;
																		"><br>
								                                        <img style="border-radius: 50%; width: 75px ; height: 75px;" src="img.jsp?imgID=<%=res.getString(1)%>">
								                                    </div>
								                                    
								                                        <h5><%= res.getString(2) %> <%= res.getString(3) %><br><small><%=res.getDate(4)%> <%=res.getTime(4)%></small><br></h5><h5 style="
								    margin-left: 10px;
								"><%=res.getString(5)%></h5>
								                                        
								                                        
								                                    
								           
								                                    </div><br>
                            <%} 
                            
                            System.out.println("GetAllResponse");
                            conn=null;
                       			}catch(SQLException e){
                       				conn=null;
                       			
									System.out.println(e.getMessage());
									
								}%>
								
								
								
								
								

</body>
</html>