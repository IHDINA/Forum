<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    
    <%
if(session.getAttribute("userId")!=null){
	  response.sendRedirect("user.jsp");
	}
%>
<!--Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
<head>
<title>Login</title>
<!-- Custom Theme files -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
<link href="css/alert.css" rel="stylesheet" type="text/css" media="all"/>


<!-- Custom Theme files -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Static Login Form Responsive, Login form web template, Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<!--script-->
<script src="js/jquery.min.js"></script>
<script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
		    <script type="text/javascript">
			    $(document).ready(function () {
			        $('#horizontalTab').easyResponsiveTabs({
			            type: 'default', //Types: default, vertical, accordion
			            width: 'auto', //auto or any width like 600px
			            fit: true   // 100% fit in a container
			        });
			    });

</script>
<!--script-->

</head>
<body>
		

	<div class="head">
	<% 
	int err;
	try{
		 err= (int)request.getAttribute("err");
	}catch(Exception e){
		err=-1;
	}
	
	
	if(err==1){
		%>
		
            	<div class="alert">
                <p><strong>Acc�s non disponible !</strong></p>
            </div>
        
		
	<%}%>
	
	


			
                
                
		<div class="logo">
			
		 
			<div class="logo-top">
				<h1>LP-DIAI Forum</h1>

			</div>
			<div class="logo-top">
				

			</div>


			<div class="logo-center">

					<h1>Made by KARAM Mohamed</h1>
					<h1>JEE Project</h1>
					<h1>2017</h1>
			</div>
		</div>

                
		<div class="login">

		


			<div class="sap_tabs">
				<div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
					<ul class="resp-tabs-list">
						<li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span>Login</span></li>
						<li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><label>/</label><span>Sign up</span></li>
						
					</ul>
					<div class="resp-tabs-container">
						<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
							<div class="login-top">
								<form action="TraitementLogin" method="post">
									<input type="text" name="email" class="email" placeholder="Email" required/>
									<input type="password" name ="pass"class="password" placeholder="Password" required/>
									
									<div class="login-bottom login-bottom1">
										<div class="submit">
											<input type="submit" value="LOGIN"/>
										</div>

										<div class="clear"></div>
									</div>
									
								</form>

							</div>
						</div>
						<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-1">
						<div class="login-top">
								<form action="Register.jsp" method="post">
									<input type="text" name="nom" class="name active" placeholder="Nom" required/>
									<input type="text" name="prenom" class="name" placeholder="Prenom" required/>									
									<input type="text" name="email" class="email" placeholder="Email" required/><br>
									<input type="radio" name="sexe" value="m" checked> M    <input type="radio" name="sexe" value="f"> F
   						
									<div class="login-bottom">
									<div class="submit">
										<input type="submit" value="SIGN UP"/>
									</div>

									<div class="clear"></div>
								</div>
								
								</form>
								
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="clear"></div>
	</div>

	<div class="footer">
		<p>2017 LP-DIAI Forum . All Rights Reserved | Design by  KARAM Mohamed </p>
	</div>
	
	</script>
</body>
</html>
