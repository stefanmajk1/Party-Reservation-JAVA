<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="beans.*"%>
<%@page import="java.util.*"%>
<%
HttpSession sesija = request.getSession();
Korisnik korisnik = (Korisnik) sesija.getAttribute("korisnik");
ArrayList<Agencija> agencije = (ArrayList<Agencija>) request.getAttribute("agencije");
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
<link rel="stylesheet" href="css/style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto&display=swap"
	rel="stylesheet">

<title>Admin panel</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<%
	if (korisnik == null) {
	%>
	<div class="container-fluid section-1">
		<div class="row">
			<div class="col-md-12 text-center">
				<h1 class="mt-5">
					<b>You are not loged </b>
				</h1>
				<p class="mb-5 mt-0">
					Go to <a href="login.jsp">login</a>.
				</p>
			</div>
		</div>
	</div>
	<%
	} else {
	%>
	 
	<div class="container " style="margin-top: 20px;
                background-color: aliceblue;">
		<div class="card mb-3 content">
            <h1 class="m-3 pt-3">Information</h1>
            <div class="card-body">
              <div class="row">
                <div class="col-md-3">
                  <h5>Name</h5>
                </div>
                <div class="col-md-9 text-secondary">
                  <%=korisnik.getIme()%>
                </div>
              </div>
              <hr />
              <div class="row">
                <div class="col-md-3">
                  <h5>Email</h5>
                </div>
                <div class="col-md-9 text-secondary">
                  <%=korisnik.getEmail()%>
                </div>
              </div>
              <hr />
              <div class="row">
                <div class="col-md-3">
                  <h5>Change Personal Info</h5>
                </div>
                <div class="col-md-9 text-secondary" style='margin-bottom: 20px;'>
                  <button
                    class="btn btn-lg btn-2"
                    data-bs-toggle="modal"
                    data-bs-target="#exampleModal"
                  >
                    Change Personal info
                    <i class="fas fa-edit"></i>
                  </button>
                </div>
                <div class="col-md-4 text-center"></div>
              </div>
            </div>
          </div>
	</div>
               
                
                
	<div class="container " style="margin-top: 20px;
  background-color: aliceblue;">
		<div class="row d-flex justify-content-center">
			<div class="col-md-12 text-center">
				<h1 class="">
					<b>Add new moderator</b>
				</h1>
				
			</div>
                    <button class="btn btn-2 btn-lg purpl " data-bs-toggle="modal" data-bs-target="#exampleModal">
					<i class="fas fa-plus-square"></i> Add moderator
				</button>
		</div>
            
		<div class="row d-flex justify-content-center m-4">
		<%
		if(agencije!=null){
		for (Agencija agencija : agencije) {
		%>
		
			<div class="col-md-12 mb-4 mx-1"
				style="border: 1px solid #02240b; border-radius: 10px">
				<div class="row">
					<div class="col-md-12">
						<p class="m-0 float-start">
							<b><%=agencija.getNaziv()%></b>
						</p>
						
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<p style="font-size: 0.8em" class="m-0 float-start"><%=agencija.getOpis()%></p>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 text-center">
						
						<%=agencija.getMapa()%>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 text-center">
						<p class="mt-3 mb-0">
							<b>Moderator</b>
						</p>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<p class="float-start m-0"><%=agencija.getMenadzer().getIme()%>
							<%=agencija.getMenadzer().getPrezime()%></p>
						<p class="float-end m-0">
							<i class="fas fa-envelope"></i>
							<%=agencija.getMenadzer().getEmail()%></p>
					</div>
				</div>
				<button class="btn btn-danger btn-sm purpl"
							onclick="confirmDeleteAgencija(<%=agencija.getAgencijaid()%>)"
							)>
							<i class="fas fa-trash-alt"></i> Delete 
						</button>
			</div>
		
		<%
		}
		}
		else{
		%>
		<div class="row">
			<div class="col-md-12">
				<h1>No new agency</h1>
			</div>
		</div>
		<%} %>
		
	<%
	}
	%>
	</div>
	<jsp:include page="futer.jsp" />
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true" >
		<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
			<div class="modal-content " style=" background-color:rgb(88,184,255, .65);">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add Menager</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form method="post" action="addMenadzerServlet">
						<div class="mb-3">
							<label for="ime" class="form-control-label">Name</label> <input
								type="text" class="form-control" name="ime" required>
						</div>
						<div class="mb-3">
							<label for="prezime" class="form-control-label">Last Name</label> <input
								type="text" class="form-control" name="prezime" required>
						</div>
						<div class="mb-3">
							<label for="email" class="form-control-label">Email</label> <input
								type="email" class="form-control" name="email" required>
						</div>
						<div class="mb-3">
							<label for="password" class="form-control-label">Password</label> <input
								type="password" class="form-control" name="password" required>
						</div>
						<button class="btn btn-primary purpl">Add</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="secondModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div
			class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
			<div class="modal-content " style=" background-color:rgb(88,184,255, .65);">
				<div class="modal-header ">
					<h5 class="modal-title" id="exampleModalLabel">Edit</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form method="post" action="editKorisnikServlet">
						<div class="mb-3">
							<label for="ime" class="form-control-label">Name</label> <input
								type="text" class="form-control" name="ime"
								value="<%=korisnik.getIme()%>" required>
						</div>
						<div class="mb-3">
							<label for="prezime" class="form-control-label">Last Name</label> <input
								type="text" class="form-control" name="prezime"
								value="<%=korisnik.getPrezime()%>" required>
						</div>
						<div class="mb-3">
							<label for="email" class="form-control-label">Email</label> <input
								type="email" class="form-control" name="email"
								value="<%=korisnik.getEmail()%>" required>
						</div>
						<button class="btn btn-primary">Confirm</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script src="js/adminpanel.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js"
		integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
		crossorigin="anonymous"></script>
</body>
</html>