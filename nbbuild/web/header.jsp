<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="beans.*"%>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid navigacija" style="list-style: none;">
			<a class="navbar-brand" href="index.jsp"> Birthday Agency</a>
                        
                        <li class="nav-item mx-0 mx-lg-1"><a style="color:gray;" class="nav-link py-3 px-0 px-lg-3 rounded" href="http://localhost:8080/index.jsp#header" >Home</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a style="color:gray;" class="nav-link py-3 px-0 px-lg-3 rounded" href="http://localhost:8080/index.jsp#about">About us</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a style="color:gray;" class="nav-link py-3 px-0 px-lg-3 rounded" href="http://localhost:8080/index.jsp#offers">Agencies</a></li><!-- comment -->
                        <li class="nav-item mx-0 mx-lg-1"><a style="color:gray;" class="nav-link py-3 px-0 px-lg-3 rounded" href="http://localhost:8080/index.jsp#map">Location</a></li><!-- comment -->
                         
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
                            
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0 mr-0">
					<%
					HttpSession sesija = request.getSession();
					Korisnik korisnik = (Korisnik)sesija.getAttribute("korisnik");
					if (korisnik == null) {
					%>
                                         <li class="nav-item dropdown" style='margin-right: 50px;'>
                                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                          Sign in
                                        </a>
                                             <div class="dropdown-menu">
                                                <a class="dropdown-item" href="login.jsp"><i class="fas fa-sign-in-alt"></i> Log in</a>
                                                <a class="dropdown-item" href="registracija.jsp"><i class="fas fa-user-plus"></i> Register</a>
                                             </div>
					<%
					} else if (korisnik.getRole().equals("admin")) {
					%>
					<li class="nav-item"><a class="nav-link" href="adminServlet">Admin
							</a></li>
					<li class="nav-item"><a class="nav-link" href="logoutServlet"><i class="fas fa-sign-out-alt"></i> LogOut</a></li>
					<%
					} else if(korisnik.getRole().equals("menadzer")) {
					%>
					<li class="nav-item"><a class="nav-link" href="menadzerServlet">Menadzer</a></li>
					<li class="nav-item"><a class="nav-link" href="logoutServlet"><i class="fas fa-sign-out-alt"></i> LogOut</a></li>
					<%
					} else{
					%>
                                        <li class="nav-item dropdown" style='margin-right: 50px;'>
                                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                          Profile
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item" href="profilServlet">Profile settings</a>
                                            <a class="dropdown-item" href="logoutServlet">LogOut</a>
                                        </div>
                                      </li>
					<%} %>
				</ul>
			</div>
		</div>
	</nav>