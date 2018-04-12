<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    
    import="Forum.fun"
    %>


<%
if(session.getAttribute("userId") == null){
	  response.sendRedirect("index.jsp");
}
%>

<%!
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

                <li class="active">
                    <a href="user.jsp">
                        <i class="ti-user"></i>
                        <p>Mon Profile</p>
                    </a>
                </li>
                <li>
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
                    <a class="navbar-brand" >Mon Profile</a>
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
                    <div class="col-lg-4 col-md-5">
                        <div class="card card-user">
                            <div class="image">
                                <img src="assets/img/background.jpg" alt="..."/>
                            </div>
                            <div class="content">
                                <div class="author">
                                  <img class="avatar border-white" src="img.jsp?imgID=<%=userID%>" alt="..."/>
                                  <h4 class="title" style=" font-family:'PoiretOne-Regular'; color: grey; font-size: 2.5em; font-weight: 100 "><%=nom+"  "+prenom %><br />
                                     
                                  </h4>
                                  <a><small style="font-family:'PoiretOne-Regular'; color: #b7bbbe; font-size: 1.15em"><%=email %></small></a>
                                </div>
                                
                            </div>
                            <hr>
                            <div class="text-center">
                                <div class="row">
                                    <div class="col-md-3 col-md-offset-1">
                                        <h5><%=fun.GetNbrQuestionPoser(userID) %><br /><small>Questions</small></h5>
                                    </div>
                                    <div class="col-md-4">
                                        <h5>  <br /><small>      </small></h5>
                                    </div>
                                    <div class="col-md-3">
                                        <h5><%=fun.GetNbrReponsePoser(userID) %><br /><small>Reponses</small></h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <form action="poserQ" method="post">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Poser une question</h4>
                            </div>
                            <div class="content">
                                <br>
                        <div class="row">
                                                <div class="col-md-12">
                                            		<div class="form-group">
                                                		<label>Categorie</label>
                                                		<select class="form-control border-input" name="Categorie" >
	                                                		<option value="1" selected>JEE-WEB</option> 
														</select>				  
                                            		</div>
                                        		</div>
                                        		</div>
                                         
                                            
                                                <div class="row">
	                                        		<div class="col-md-12">
		                                            	<div class="form-group">
		                                                	<label>Question</label>
		                                                	<textarea rows="2" class="form-control border-input" name="question" placeholder="Question" required></textarea>
	                                            		</div>
                                        			</div>
                                    			</div>
                                    			<br>
                   			                     <input type="hidden" name="userId" value="<%=userID%>">
                                    			
                                    			<div class="text-center">
                                        <input type="submit" name="submit" value="Poser" class="btn btn-info btn-fill btn-wd">
                                    </div>
                                    <div class="clearfix"></div>
                                    </form>
                                            
                                            
                                            
                                        
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8 col-md-7">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Modifier les informations personnels</h4>
                            </div>
                            <div class="content">
                                <form action="updatePersonalInfo" method="post" enctype="multipart/form-data" >
                                	<br>
                                    <div class="row" align="center">
										<img type ="image" class="img-circle"  id="blah" width="150" height="150" src="img.jsp?imgID=<%=userID%>"><br>
									
										<div class="image-upload">
											<input type="file" name="img" id="file-3" class="inputfile inputfile-3" onchange="readURL(this);" accept="image/gif, image/jpeg, image/png" />
											<label for="file-3"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="17" viewBox="0 0 20 17"><path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/></svg> <span>Choisie une image&hellip;</span></label>
										</div>
                                    </div>
                                    
                                    <br>
                                   <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Nom</label>
                                                <input type="text" name="Nvnom" class="form-control border-input" placeholder="Nom" value="<%=nom%>" required>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Prenom</label>
                                                <input type="text" name="NvPrenom" class="form-control border-input" placeholder="Prenom" value="<%=prenom%>" required>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    




                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Date de naissance</label>
                                                <input type="date" name="NvDatNaiss" class="form-control border-input" placeholder="Date de naissance" value="<%=datenaiss%>" required>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Sexe</label>
                                                	<select class="form-control border-input" name="Sexe" >
                                                	
                                                	<%if(male){
                                                	
                                                	%>
                                                	<option value="m" selected>Male</option>       
													<option value="f" >Female</option> 
													<%
                                                	}else {
                                                		
                                                	%>	
                                                	<option value="m" >Male</option>       
													<option value="f" selected>Female</option> 
													<%
                                                	}
													%>
                                                	
                     								    
													 		    
													</select>			
													  
                                            </div>
                                        </div>
                                    </div>
                                    
                                    
                                    <input type="hidden" name="userId" value="<%=userID%>">

                                    

                                    
                                    <div class="text-center">
                                        <input type="submit" name="submit" value="Modifier Profile" class="btn btn-info btn-fill btn-wd">
                                    </div>
                                    <div class="clearfix"></div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8 col-md-7">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Modifier les informations du compte</h4>
                            </div>
                            <div class="content">
                                <form action="updateAccountInfo" method="post">
                                	<br>
									<div class="row">
                                        
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">Email</label>
                                                <input type="email" name="Nvemail" class="form-control border-input" value="<%=email %>" placeholder="Email">
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Nouveau mot de passe</label>
                                                <input type="password" name="NvPass" id="password" onabort="cheche()" onkeyup='check();'  class="form-control border-input" placeholder="Company" >
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Retapez le nouveau mot de passe</label>
                                                <input type="password" id="confirm_password" onabort="cheche()" onkeyup='check();' class="form-control border-input" placeholder="Last Name" >
                                            </div>
                                        </div>
                                    </div>
                                    <span id="message"></span>
                                    
                                    <input type="hidden" name="userId" value="<%=userID%>">
                                    
                                    <div class="text-center">
                                        <input type="submit" id="submitPass" class="btn btn-info btn-fill btn-wd" value="Modifier Profile">
                                    </div>
                                    <div class="clearfix"></div>
                                </form>
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
