<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    
    import="Forum.*"
    import="java.io.IOException"
	import="java.sql.Connection"
	import="java.sql.ResultSet"
	import="java.sql.SQLException"
	import="java.sql.Statement"
    
    
    %>


<%
if(session.getAttribute("userId") == null){
	  response.sendRedirect("index.jsp");
}
%>

<%!

Connection conn=null;
String requete;
Statement stmt;
ResultSet res;




String userID;
String nom;
String prenom;
String email;
String datenaiss;
String sexe;
String pass;
boolean male=false;
%>
<% 
if(session.getAttribute("userId") != null){
	userID=session.getAttribute("userId").toString();
	nom= session.getAttribute("Nom").toString();
	prenom=session.getAttribute("Prenom").toString();
	email=session.getAttribute("Email").toString();
	datenaiss=session.getAttribute("DateNaiss").toString();
	sexe=session.getAttribute("Sexe").toString();
	
	if(session.getAttribute("Sexe").toString().equalsIgnoreCase("m")){
		male=true;
	}
	pass=session.getAttribute("pass").toString();
	
	System.out.println(sexe);
	System.out.println(male);
	
	
}

%>





<!doctype html>
<html lang="en">

<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>Mon compte</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="assets/css/animate.min.css" rel="stylesheet"/>

    <!--  Paper Dashboard core CSS    -->
    <link href="assets/css/paper-dashboard.css" rel="stylesheet"/>

    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="assets/css/demo.css" rel="stylesheet" />

    <!--  Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
    <link href="assets/css/themify-icons.css" rel="stylesheet">
    
    <link href="css/img.css" rel="stylesheet">
    
    <script  src="js/Q.js"></script>
    
    <style type="text/css">
    
    .e:hover{
   		background-color:#f4f3ef !important;
	}
	</style>

<script type="text/javascript">


function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#blah')
                .attr('src', e.target.result)
                .width(150)
                .height(150);
        };

        reader.readAsDataURL(input.files[0]);
    }
}

</script>

<script type="text/javascript">

var check = function() {
	  if (document.getElementById('password').value ==
	    document.getElementById('confirm_password').value) {
		 
	    document.getElementById('message').style.color = 'green';
	    document.getElementById('message').innerHTML = 'matching';
	    document.getElementById('submitPass').disabled = false;
	  }

	  else {
	    document.getElementById('message').style.color = 'red';
	    document.getElementById('message').innerHTML = 'not matching';
	    document.getElementById('submitPass').disabled = true;
	  }
	}
	
var cheche = function() {
	  if (document.getElementById('password').value ==
	    document.getElementById('confirm_password').value =="") {
		document.getElementById('message').innerHTML = '';

	  }

	}

</script>

<script type="text/javascript">

var idQActive;
var nbrRActiv;
var QuestionActive;

function changeElement(id,q,nbrRep) {
	
	document.getElementById("btnRep").disabled=false;

	
	idQActive=id;
	nbrRActiv=nbrRep;
	QuestionActive=q;

  
  var x = document.getElementsByClassName("e");
  var i;
  for (i = 0; i < x.length; i++) {
      x[i].style.backgroundColor = "#ffffff";
  }
  
  var div = document.getElementById(id);

  div.style.backgroundColor="#f4f3ef";
  
  document.getElementById('ReponseQ').innerHTML = ""+nbrRep+" Reponse to "+q;
  
  //document.getElementById("Rep").innerHTML='<object type="text/html" data="GetAllResponse.jsp" ></object>';
  

  $("#Rep").load("GetAllResponse.jsp?id='"+id+"'");


}

function AddReponse(userId){
	
	
	//var text = $('txtRep').val();
	//var Question = document.getElementById('txtRep').value;
	
		//alert(Question);
		//return;
		
		var myText = document.getElementById("txtRep");
		var s = myText.value;
	
		if(s==''){
			alert('Entrer la reponse');
			return;
		}else{
			
			
			var replaced = s.split(' ').join('--');
			
			var user=userId;
			var Qid=idQActive;
			
			$("#insert").load("insert.jsp?id="+user+"&Qid="+Qid+"&s="+replaced+"");
			
			$("#Rep").empty();
			
			var n = parseInt(nbrRActiv);
			nbrRActiv=parseInt(nbrRActiv);
			nbrRActiv++;
			n++;
			
			
			 document.getElementById('ReponseQ').innerHTML = ""+n+" Reponse to "+QuestionActive;

			 $("#Rep").empty();
			$("#Rep").load("GetAllResponse.jsp?id="+Qid+"");
			$("#Rep").empty();
			$("#Rep").load("GetAllResponse.jsp?id="+Qid+"");

			myText.value='';
			
			var elm=document.getElementById(Qid);
			elm.removeAttribute("onclick");
			
			elm.setAttribute("onclick", "changeElement('"+Qid+"','"+QuestionActive+"','"+n+"')");
			
			var elm2=document.getElementById('nbr'+Qid);
			elm2.innerHTML=""+n;
			
			
			
			
			

			
			
			
		}
	
	


	
	
	
}
</script>


</head>
<body>

<div class="wrapper">
	<div class="sidebar" data-background-color="white" data-active-color="danger">

    <!--
		Tip 1: you can change the color of the sidebar's background using: data-background-color="white | black"
		Tip 2: you can change the color of the active button using the data-active-color="primary | info | success | warning | danger"
	-->

    	<div class="sidebar-wrapper">
            <div class="logo">
                <a href="http://www.creative-tim.com" class="simple-text">
                    <%=nom+" "+prenom%>
                </a>
            </div>

            <ul class="nav">

                <li >
                    <a href="user.jsp">
                        <i class="ti-user"></i>
                        <p>Mon Profile</p>
                    </a>
                </li>
                <li class="active">
                    <a href="MesQuestion.jsp">
                        <i class="ti-view-list"></i>
                        <p>Mes questions</p>
                    </a>
                </li>
                <li>
                    <a href="TousLesQuestion.jsp">
                        <i class="ti-view-list-alt"></i>
                        <p>Tous les questions</p>
                    </a>
                </li>
                
            </ul>
    	</div>
    </div>

    <div class="main-panel">
		<nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar bar1"></span>
                        <span class="icon-bar bar2"></span>
                        <span class="icon-bar bar3"></span>
                    </button>
                    <a class="navbar-brand" >Mes Questions</a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">


                       <li>
                           <a href="logout.jsp">
								<i class="ti-direction"></i>
								<p>Deconnexion</p>
                            </a>
                        </li>
                        
						<li>
						
							<a href="user.jsp">
								<i class="ti-pencil"></i>
								<p>Modifer profile</p>
                            </a>
                            

                            
                        </li>
                        
 
                       
                       
                            <a href="#">
                            
                                  <img style="border-radius: 50%; width: 75px ; height: 75px;" src="img.jsp?imgID=<%=userID%>">

                            </a>
                       
                    </ul>

                </div>
            </div>
        </nav>


        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-5 col-md-5">
                        <div class="card " >
                             <div class="header">
                                <h4 class="title">Mes questions</h4>
                            </div>
                            <hr>
                            
                        
                        <div style="max-height: 555px; height: 555px ; overflow-y: scroll;" >
                                                    <div class="content" style="align-items: center;">
                        
                            <%
								
								conn=Conn.getCon();
								requete= "SELECT q.idQ,q.question,c.Cat,u.Nom,u.Prenom,q.Date FROM question q,user u,categorie c WHERE q.userId=u.userId and c.idCat=q.Categorie and u.userId="+userID+" ORDER BY Date DESC";
								try{
									stmt = conn.createStatement();
									ResultSet res = stmt.executeQuery(requete);
									
									if (res.next() == false) {
										out.print("0 Question");
										
									}
									res.beforeFirst();

									
									
                            while(res.next()) {
                            	
                            %>
                            
                                <div class="row e" onclick="changeElement('<%=res.getString(1)%>','<%=res.getString(2)%>','<%=fun.getNbrReponse(res.getString(1)) %>')" id="<%=res.getString(1)%>">
                                	<div class=" col-md-12 ">
                                		<h5><%=res.getString(2)%><br /><small>by <%=res.getString(4)%> <%=res.getString(5)%> on <%=res.getDate(6)%> <%=res.getTime(6)%> in <%=res.getString(3)%><br><small id="nbr<%=res.getString(1)%>"><%=fun.getNbrReponse(res.getString(1)) %></small> reponse</small></h5>
                                		
                                	</div>
                                </div> <hr>
                            <%} 
                            
                       			}catch(SQLException e){
									System.out.println(e.getMessage());
									
								}%>
                                                          
                            </div>
                            
                        </div>
                        
                            
                            
                            
                        </div>
                        
                        
                                            
                                            
                                            
                                        
                            </div>
                            
                            <div class="col-lg-7 col-md-7">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Reponses</h4>
                            </div>
                            <hr>
                            <div class="content" style="max-height: 350px; height: 350px ;overflow-y: scroll;">
                                	
									<div class="row">
                                        
                                        <div class=" col-md-12 ">
                                		<h5 id="ReponseQ"></h5><br>
                                		
                                	</div>
                                	
                                	
                                       
                                    </div>
                                    
                                    <div class="row" >
                                    
                                     <div  class="col-md-12" id="Rep">

                                     
                                     </div>
                                    
                                    
                                	</div>

                                    
                                
                            </div>

								
				                        
				                            <div class="content">
				                                <br>
				                                <div class="row">
	                                        		<div class="col-md-12">
		                                            	<div class="form-group">
		                                                	<label>Repondre</label>
		                                                	<textarea rows="2" class="form-control border-input" id="txtRep" placeholder="Repondre" required></textarea>
	                                            		</div>
                                        			</div>
                                    			</div>
                                    			<br>
                                    			
                                    			<div class="text-center">
                                    			<input type="submit" id="btnRep" value="Repondre" onclick="AddReponse('<%=userID %>')" class="btn btn-info  btn-wd" disabled>
                                    </div>
                                    <div class="clearfix"></div>
                                    


                        </div>
                    
                    
                        </div>
                    </div>
                    
                    


                </div>
            </div>
        </div>


        <footer class="footer">
            <div class="container-fluid">

				<div class="copyright pull-right">
                    &copy; <script>document.write(new Date().getFullYear())</script>, made with <i class="fa fa-heart heart"></i> by Karam Mohamed
                </div>
            </div>
        </footer>

    </div>
</div>


<div hidden="true" id="insert"></div>

</body>

    <!--   Core JS Files   -->
    <script src="assets/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

	<!--  Checkbox, Radio & Switch Plugins -->
	<script src="assets/js/bootstrap-checkbox-radio.js"></script>

	<!--  Charts Plugin -->
	<script src="assets/js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="assets/js/bootstrap-notify.js"></script>

    <!--  Google Maps Plugin    -->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>

    <!-- Paper Dashboard Core javascript and methods for Demo purpose -->
	<script src="assets/js/paper-dashboard.js"></script>

	<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
	<script src="assets/js/demo.js"></script>

</html>

<%conn=null; %>
