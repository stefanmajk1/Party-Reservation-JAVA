<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="beans.*"%>
<%
HttpSession sesija = request.getSession();
Korisnik korisnik = (Korisnik) sesija.getAttribute("korisnik");
boolean error;
if(request.getAttribute("error")==null){
	error = false;
}
else{
	error = true;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/style2.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto&display=swap"
	rel="stylesheet">

<title>Login</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	
	<div class="container">
		<div class="row">
			<div class="col-md-12 text-center">
				
			</div>
		</div>
	</div>
	<% if(korisnik == null){ %>
	<div class="container-container text-center">
	
		<% if(error){ %>
		<div class="row  justify-content-center">
			<div class="col-md-3  p-4 mt-5 loginError" style="border: 1px solid #02240b; border-radius: 10px; background-color:  #bfe2e9;">
				<p class="m-0">You'r password or email is wrong.</p>
			</div>
		</div>
		<% } %>
	<div class="main">

		<section class="sign-in">
			<div class="container">
				<div class="signin-content">
					<div class="signin-image">
						<figure>
							<img src="images/signin-image.jpg" alt="sing up image">
						</figure>
						<a href="registracija.jsp" class="signup-image-link">Create an
							account</a>
					</div>
					<div class="signin-form">
						<h2 class="form-title">Sign in</h2>
						<form method="post" action="loginServlet" class="register-form"
							id="login-form">
							<div class="form-group">
								<label for="username"><i
									class="zmdi zmdi-account material-icons-email"></i></label> <input
									type="text" name="email" id="email"
                                                                        placeholder="Email"  required/>
							</div>
							<div class="form-group">
								<label for="password"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="password" id="password"
									placeholder="Password" required/>
							</div>
							<div class="form-group form-button">
								<input type="submit" name="signin" id="signin"
									class="form-submit" value="Log in" />
							</div>
						</form>
						
					</div>
				</div>
			</div>
		</section>

	</div>
			<%}
	else{%>
	<div class="container section-1">
		<div class="row justify-content-center">
			<div class="col-md-6 text-center">
				<h4 class="my-5">
					Desila se greska.
				</h4>
			</div>
		</div>
	</div>
	
	<%} %>
		</div>
	</div>
	
	
	
	
	
	
	
	<jsp:include page="futer.jsp" />
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js"
		integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
		crossorigin="anonymous"></script>
</body>
</html>