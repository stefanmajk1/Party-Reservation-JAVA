<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="beans.*"%>
<%@page import="java.util.ArrayList"%>
<%
HttpSession sesija = request.getSession();
Korisnik korisnik = (Korisnik) sesija.getAttribute("korisnik");
ArrayList<Rezervacija> rezervacije = (ArrayList<Rezervacija>) request.getAttribute("rezervacijeNaProfilu");
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
<link rel="stylesheet" href="css/profile.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto&display=swap"
	rel="stylesheet">

<title>Profil</title>
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
					<b>You are not Loged!
					</b>
				</h1>
				<p class="mb-5 mt-0">Go to <a href="login.jsp">login</a> page.</p>
			</div>
		</div>
	</div>
	<%
	}
	else{
	%>
	<div class="container-fluid section-1">
		<div class="row">
			
		</div>
	</div>
	<div class="container " style="margin-top: 20px;
  background-color: aliceblue;">
		<div class="card mb-3 content">
            <h1 class="m-3 pt-3">Information</h1>
            <div class="card-body">
              <div class="row">
                <div class="col-md-3">
                  <h5>Full Name</h5>
                </div>
                <div class="col-md-9 text-secondary">
                  <%=korisnik.getIme()%> <%=korisnik.getPrezime()%>
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
              <div class="row">
                <div class="col-md-3">
                  <h5>Delete Account</h5>
                </div>
                <div class="col-md-9 text-secondary">
                  <button
                    class="btn btn-danger btn-lg"
                    onclick="confirmDelete(<%=korisnik.getKorisnikid()%>)"
                  >
                    Delete Profile
                  </button>
                </div>
              </div>
            </div>
          </div>
          <div class="card mb-3 content">
            <h1 class="m-3">Discount</h1>
            <div class="card-body">
              <div class="row">
                <% if (korisnik.getBodovi() > 0) { %>
                <div class="col-md-9 text-secondary">
                  You are entitled to a 10% discount on your next reservation!
                </div>
                <% } else { %>
                <div class="col-md-9 text-secondary">
                  You have not earned enought points for the discount
                </div>
                <% } %>
              </div>
            </div>
          </div>
	</div>
	</div>
	<div class="container mt-4 profilbox">
		<div class="row d-flex justify-content-center">
			<div class="col-md-6 text-center p-3 m-2">
				<h1 class="mt-5">
					<b>Reservations </b>
				</h1>
				
			</div>
		</div>
		<div class="row justify-content-center">
		<%
		if(rezervacije!=null){
		for (Rezervacija rezervacija : rezervacije) {
		%>
		
			<div class="col-md-5 mb-3 mx-1"
				style="border: 1px solid #02240b; border-radius: 10px">
				<div class="row">
					<div class="col-md-12 text-center p-3 pb-0">
						<h4><%=rezervacija.getAgencija().getNaziv()%></h4>
					</div>
					<div class="custom-separator my-2 mx-auto bg-primary " style="width: 10rem; height: 6px; border-radius: 1rem;"></div>
					<div class="col-md-12 p-3 pb-0">
						<p class="float-start m-0">
							<b><%=rezervacija.getPaket()%> PACKAGE</b>
						</p>
						<p class="float-end m-0">
							<b><%=rezervacija.getCenapaketa()%>,00 RSD</b>
						</p>
					</div>
					<div class="col-md-12 p-3 pt-0">
						<p style="font-size: 0.8em" class="float-start m-0"><%=rezervacija.getOpispaketa()%></p>
					</div>
					<div class="col-md-12 p-3 pb-0">
						<p class="float-start m-0">
							Date of maintenance:
							<%=rezervacija.getDatum()%></p>
						<p class="float-end m-0">
							Start time:
							<%=rezervacija.getVreme()%></p>
					</div>
					
					<div class="col-md-12 px-3 pt-0 pb-3" style="text-align:center; width:586px; margin-left:auto; margin-right:auto;"
						>
						<%=rezervacija.getAgencija().getMapa()%>
					</div>
					<div class="custom-separator my-2 mx-auto bg-primary " style="width: 10rem; height: 6px; border-radius: 1rem;"></div>
					<div class="col-md-12 p-3 pb-0 text-center">
						<h4 class="m-0">
							<b>KONTAKT</b>
						</h4>
						
					</div>
					<div class="col-md-12 p-3 pb-0">
						<p class="float-start m-0"><%=rezervacija.getAgencija().getMenadzer().getIme()%>
							<%=rezervacija.getAgencija().getMenadzer().getPrezime()%></p>
						<p class="float-end m-0">
							<i class="fas fa-envelope"></i>
							<%=rezervacija.getAgencija().getMenadzer().getEmail()%></p>
					</div>
				</div>
			</div>
		
		<%
		}
		}
		else{
		%>
		<div class="row">
			<div class="col-md-12 text-center">
				<h4>You don't have any reservations.</h4>
			</div>
		</div>
		<%} %>
		</div>
	</div>
	
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div
			class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
			<div class="modal-content" style=" background-color:#c1e0d9;">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Change info</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body ">
					<form method="post" action="editKorisnikServlet">
						<div class="mb-3">
							<label for="ime" class="form-control-label"></label> <input
								type="text" class="form-control" name="ime"
								value="<%=korisnik.getIme()%>" required>
						</div>
						<div class="mb-3">
							<label for="prezime" class="form-control-label"></label> <input
								type="text" class="form-control" name="prezime"
								value="<%=korisnik.getPrezime()%>" required>
						</div>
						<div class="mb-3">
							<label for="email" class="form-control-label"></label> <input
								type="email" class="form-control" name="email"
								value="<%=korisnik.getEmail()%>" required>
						</div>
						<button class="btn btn-primary purpl">Change</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%} %>
	<jsp:include page="futer.jsp" />
	<script src="js/profil.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js"
		integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
		crossorigin="anonymous"></script>
</body>
</html>