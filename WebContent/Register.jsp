<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import ="Forum.*"
    import="java.io.IOException"
	import="java.sql.Connection"
	import="java.sql.ResultSet"
	import="java.sql.SQLException"
	import="java.sql.Statement"
    %>
    
    

    
<%

if( request.getParameter("nom") == null ||  fun.Exist(request.getParameter("email")) ){
	response.sendRedirect("index.jsp");
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="css/Register.css" rel="stylesheet" type="text/css" media="all"/>
<link href="css/img.css" rel="stylesheet" type="text/css" media="all"/>

<link rel="stylesheet" type="text/css" href="css/normalize.css" />
<link rel="stylesheet" type="text/css" href="css/demo.css" />
<link rel="stylesheet" type="text/css" href="css/component.css" />
		

<style type="text/css">

#wrapp{
width: 100%;
}

.left{
float: left;
}
.center{
float: center;
}
.right{
float: right;}


</style>
		

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!--script-->
<script type="text/javascript">
var check = function() {
	  if (document.getElementById('password').value ==
	    document.getElementById('confirm_password').value) {
		 
	    document.getElementById('message').style.color = 'green';
	    document.getElementById('message').innerHTML = 'matching';
	    document.getElementById('submit').disabled = false;
	  } else {
	    document.getElementById('message').style.color = 'red';
	    document.getElementById('message').innerHTML = 'not matching';
	    document.getElementById('submit').disabled = true;
	  }
	}

</script>

		<script>(function(e,t,n){var r=e.querySelectorAll("html")[0];r.className=r.className.replace(/(^|\s)no-js(\s|$)/,"$1js$2")})(document,window,0);</script>
		<script src="js/custom-file-input.js"></script>


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
<div class="head" style="
    margin-top: center;
    margin-top: 100px;
">
		
		<div class="login">
			<div class="sap_tabs">
				<div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
					<ul class="resp-tabs-list">
						<li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><label></label><span style="size: 15px"></span></li>
						
					</ul>
					<div class="resp-tabs-container">
						
						<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-1">
						<div class="login-top">
								<form action="addUser" method="post"  enctype="multipart/form-data">
								
									<input type="hidden" name="nom" value="<%out.print(request.getParameter("nom"));%>"/>
									<input type="hidden" name="prenom" value="<%out.print(request.getParameter("prenom"));%>"/>
									<input type="hidden" name="email" value="<%out.print(request.getParameter("email") );%>"/>
									<input type="hidden" name="sexe" value="<%out.print(request.getParameter("sexe") );%>"/>
									
								
									<div align="center">
									<img type ="image" class="img-circle"  id="blah" width="150" height="150" src="images/<% out.print( request.getParameter("sexe") ); %>.png"><br>
									
										<div class="image-upload">
											<input type="file" name="img" id="file-3" class="inputfile inputfile-3" onchange="readURL(this);" accept="image/gif, image/jpeg, image/png" required/>
											<label for="file-3"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="17" viewBox="0 0 20 17"><path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/></svg> <span>Choisie une image&hellip;</span></label>
										</div>
					
						
									
									
									<div class="logo-top">
										<h1 style="color: grey"><% out.print( request.getParameter("nom")+" "+request.getParameter("prenom")+""); %> </h1>
									</div>
									<% out.print( request.getParameter("email"));%>
								
			
									</div>
								
									
									
									<select name="mois"  required> 
									    <option value="01">January</option>       
									    <option value="02">February</option>       
									    <option value="03">March</option>       
									    <option value="04">April</option>       
									    <option value="05">May</option>       
									    <option value="06">June</option>       
									    <option value="07">July</option>       
									    <option value="08">August</option>       
									    <option value="09">September</option>       
									    <option value="10">October</option>       
									    <option value="11">November</option>       
									    <option value="12">December</option>       
									  </select>
									  
									  <select name="jour"  required> 
										    <option value="01">1</option>       
											<option value="02">2</option>       
											<option value="03">3</option>       
											<option value="04">4</option>       
											<option value="05">5</option>       
											<option value="06">6</option>       
											<option value="07">7</option>       
											<option value="08">8</option>       
											<option value="09">9</option>       
											<option value="10">10</option>       
											<option value="11">11</option>       
											<option value="12">12</option>       
											<option value="13">13</option>       
											<option value="14">14</option>       
											<option value="15">15</option>       
											<option value="16">16</option>       
											<option value="17">17</option>       
											<option value="18">18</option>       
											<option value="19">19</option>       
											<option value="20">20</option>       
											<option value="21">21</option>       
											<option value="22">22</option>       
											<option value="23">23</option>       
											<option value="24">24</option>       
											<option value="25">25</option>       
											<option value="26">26</option>       
											<option value="27">27</option>       
											<option value="28">28</option>       
											<option value="29">29</option>       
											<option value="30">30</option>       
											<option value="31">31</option>        
										  </select>
									
									<select name="ann" required > 
										    <option value="1995">1995</option>       
										    <option value="1996">1996</option>       
										    <option value="1997">1997</option>       
     
										  </select> 
									
									<input type="password" name="pass" class="password" id="password" onkeyup='check();' placeholder="Mot de passe" required/>	
									<input type="password" name="repass" class="password"  id="confirm_password" onkeyup='check();' placeholder="Retaper le mot de passe" required/><br><span id='message'></span>	
									
									<div class="login-bottom">
									<div class="submit">
										<input type="submit" id="submit" value="SIGN UP"/>
									</div>

									<div class="clear"></div>
								</div>
								
								</form>
								

									<div class="clear"></div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="clear"></div>
	</div>
						
							
						
						
</body>
</html>