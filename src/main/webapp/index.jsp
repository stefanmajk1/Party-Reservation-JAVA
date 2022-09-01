<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="beans.*"%>
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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/style2.css">

<title>Birthay Agency</title>
<style>
    .kartica:hover{
        background-color: whitesmoke;
        opacity: 1;
        transition: 0.3s;
        border: none;
    }
</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="container-fluid section-1">
		<div class="row">
			<div class="col-md-12 text-center">
				
				
			</div>
		</div>
	</div>
        <header class="masthead text-white text-center" id="header">
            <div class="container d-flex align-items-center flex-column">
			<!-- Masthead Avatar Image-->
                        <img style="border-radius: 70%; width: 400px;" class="masthead-avatar mb-5" src="images/logo1.png" alt=""/>
			<!-- Masthead Heading-->
			<h1 class="masthead-heading text-uppercase mb-0" style="color:black;">Welcome To Birthay Agency</h1>
                        <h2>BEST AGENCY FOR PARTIES</h2>
			<!-- Icon Divider-->
			<div class="divider-custom divider-light">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon" style="color: #ffc107;">
					<i style="" class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- Masthead Subheading-->
                        <h5 class="masthead-subheading  font-weight-light mb-0" style="color: gray">Over 50,000 positive reviews</h5>
		</div>
	</header>
        <div class="container-fluid section-2" id="about">
		<div class="row">
			<div class="col-md-12 text-center ">
				
				<div class="row row-cols-1 row-cols-md-12 g-5 my-4">
					<div class="col">
                                            <div class="card h-100 kartica"style="background-color: #FAFAD2; border: none;">
							<div class="card-body p-4 kartica">
								<h3 class="card-title pb-3">Quick and easy online reservation of space for children's birthdays.
A wide selection of venues and organizers of birthday celebrations. Guaranteed quality.
								</h3>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="card h-100 kartica" style="background-color: #FAFAD2; border: none;"">
							<div class="card-body p-4 kartica">
								<h2 class="card-title pb-3">About us</h2>
								<p class="card-text">BirthdayAgency is a service to help you choose an agency for organizing and decorating birthday parties. With the desire to enable your little ones to fully enjoy their birthday, we offer a wide selection of agencies that can enable you to do so.

Thanks to many years of experience, we have a large number of successfully organized celebrations behind us, which guarantees that together we will create the celebration you dreamed about. We can help you with all aspects of the organization and together define the celebration protocol that contains all the details that will allow you to face the day of the party completely relieved and satisfied.

Birthdays are the most beautiful event in people's lives. However, organizing a birthday party is not an easy task at all, because it is necessary to allocate a lot of time and patience to find a suitable space, music, service and other little things. If you want to stress-free enjoy the preparations, as well as the celebration itself, BirthdayAgency is the right address for you.</p>
							</div>
						</div>
					</div>
					
					
				</div>
			</div>
		</div>
            <div class="row justify-content-center" id="offers">
			<div class="col-md-4 text-center my-5">
                            <a href="agencijeServlet" ><button class="btn btn-success btn-lg btn-2 p-4 w-100">Agency</button></a>
			</div>
		</div>
	</div>
	<div class="container-fluid section-1" id="map">
		<div class="row">
			<div class="col-md-12 text-center">
				<h1 class="mt-5"><i class="fas fa-map-marker-alt"></i><b> You can find us here:</b></h1>
				
<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d101767.51828322433!2d73.78003172643552!3d18.57593100561026!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bc2bf7e4fffffff%3A0x7afc4ec6872cdaea!2sPerfect%20Celebrations!5e0!3m2!1ssr!2srs!4v1661502848969!5m2!1ssr!2srs" width="1300" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>	</div>
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