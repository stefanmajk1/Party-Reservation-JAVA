<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="beans.*"%>
<%@page import="java.util.ArrayList"%>
<%
HttpSession sesija = request.getSession();
Korisnik korisnik = (Korisnik) sesija.getAttribute("korisnik");
Agencija agencija = (Agencija) request.getAttribute("agencija");
ArrayList<Rezervacija> rezervacije = (ArrayList<Rezervacija>) request.getAttribute("rezervacije");
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

<title>Manager </title>
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
					<b>Niste ulogovani
					</b>
				</h1>
				<p class="mb-5 mt-0">Idite na <a href="login.jsp">login</a> stranicu da bi se ulogovali.</p>
			</div>
		</div>
	</div>
	<%
	}
	else{
	%>
        
	<div class="container-fluid section-1">
		<div class="row">
			<div class="col-md-12 text-center">
				
			</div>
		</div>
	</div>
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
		  <%=korisnik.getPrezime()%>
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
                  <h5>Delete account</h5>
                </div>
                <div class="col-md-9 text-secondary" style='margin-bottom: 20px;'>
                  <button class="btn btn-danger btn-lg"
					onclick="confirmDelete(<%=korisnik.getKorisnikid()%>)">Obrisi profil</button>
                </div>
            </div>
                <div class="row">
                <div class="col-md-3">
                  <h5>Add Agency</h5>
                </div>
                <div class="col-md-9 text-secondary" style='margin-bottom: 20px;'>
                  <button class="btn btn-primary "
					data-bs-toggle="modal" data-bs-target="#secondModal">
					Add
				</button>
                </div>
            </div>
          </div>
	</div>
                <div id="test" class="container pb-2 my-4 "style="background-color: rgba(255, 255, 255, .15);  
 backdrop-filter: blur(10px); background: #e8f8f5; 
	 border-radius:25px;">
		<div class="row d-flex justify-content-center mb-4" id="test">
			<div class="col-md-2">
				<h1 class=" mt-5">
					<b>Agency </b>
				</h1>
				
			</div>
		</div>
		<div class="row d-flex justify-content-center">
			<div class="col-md-6 text-center">
				<h1 class="mt-4">
					<b><%=agencija.getNaziv()%> </b>
				</h1>
			</div>
		</div>
		
		
		<div class="row d-flex justify-content-center mb-5">
			<div class="col-md-6 text-center">
				<%=agencija.getMapa()%>
			</div>
		</div>
	</div>

	<div class="container" id="test" style="background-color: #e8f8f5;  
 backdrop-filter: blur(10px); 
	 border-radius:25px;">
		<div class="row">
			<div class="col-md-12 text-center">
				<h1 class="mt-5">
					<b>Reservation</b>
				</h1>
				
			</div>
		</div>
		<div class="row justify-content-center">
		<%
		if (rezervacije != null) {
			for (Rezervacija rezervacija : rezervacije) {
		%>
		
			<div class="col-md-12 mb-4 mx-1"
				style="border: 1px solid #02240b; border-radius: 10px">
				<div class="row">
					<div class="col-md-12">
						<p class="float-start m-0">
							<b><%=rezervacija.getPaket()%></b>
						</p>
						<p class="float-end m-0">
							<b><%=rezervacija.getCenapaketa()%>,00 RSD</b>
						</p>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<p class="float-start m-0" style="font-size: 0.8em">
							<%=rezervacija.getOpispaketa()%>
						</p>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12" >
						<p class="float-start mt-3">
							<%=rezervacija.getDatum()%>
						</p>
						<p class="float-end mt-3">
							<%=rezervacija.getVreme()%>
						</p>
					</div>
					<div class="custom-separator my-2 mx-auto bg-primary " style="width: 25rem; height: 6px; border-radius: 1rem;"></div>
				</div>
				<div class="row">
					<div class="col-md-12 text-center">
						<p class="mt-2 mb-0">
							<b>CONTACT </b>
						</p>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<p class="float-start m-0"><%=rezervacija.getKorisnik().getIme()%>
							<%=rezervacija.getKorisnik().getPrezime()%></p>
						<p class="float-end m-0">
							<i class="fas fa-envelope"></i>
							<%=rezervacija.getKorisnik().getEmail()%></p>
					</div>
				</div>
			</div>
		
		<%
		}
		} else {
		%>
		<div class="row d-flex justify-content-center">
			<div class="col-md-4 text-center section-2 p-4" style="border: 1px solid #02240b; border-radius: 10px; border: none;">
				<p class="h5 m-0">No reservations.</p>
			</div>
		</div>
		<%
		}
		%>
		</div>
	</div>
	<div class="container-fluid section-1">
		
	</div>
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div
			class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
			<div class="modal-content" style=" background-color:rgb(88,184,255, .65);">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Change info</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
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
	<div class="modal fade" id="secondModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div
			class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
			<div class="modal-content" style=" background-color:#323539">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Change Agency</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form method="post" action="editAgencijaServlet">
						<input type="hidden" name="agencijaid" value="<%= agencija.getAgencijaid() %>">
						<div class="mb-3">
                                                    <p>Naziv</p>
							 <input
								type="text" class="form-control" name="naziv"
								value="<%=agencija.getNaziv()%>" required>
						</div>
						<div class="mb-3">
                                                     <p>Opis</p>
							<textarea rows="6" class="form-control" name="opis"> <%=agencija.getOpis()%></textarea>
						</div>
						<div class="mb-3">
                                                    <p>Adresa</p>
							<label for="adresa" class="form-control-label">Adresa</label> <input
								type="text" class="form-control" name="adresa"
								value="<%=agencija.getAdresa()%>" required>
						</div>
						<div class="mb-3">
                                                    <p for="mapa">Koordinate(iframe)</p>
							<textarea rows="6" class="form-control" name="mapa" aria-describedby="mapaHelp"><%= agencija.getMapa() %></textarea>
							<div id="mapaHelp" class="form-text">Google maps html kod</div>
						</div>
						<div class="mb-3 text-center">
							<p class="h5 m-0"><b>STANDARD PAKET</b>
						</div>
						<input type="hidden" name="standardid" value="<%= agencija.getPonuda().getStandard().getStandardid() %>">
						<div class="mb-3">
							<label for="opisStandard" class="form-control-label"></label> 
							<input type="text" class="form-control" name="opisStandard" value="<%=agencija.getPonuda().getStandard().getOpis() %>" required>
						</div>
						<div class="mb-3">
							<label for="cenaStandard" class="form-control-label"></label> 
							<input type="text" class="form-control" name="cenaStandard" value="<%=agencija.getPonuda().getStandard().getCena() %>" required>
						</div>
						<div class="mb-3 text-center">
							<p class="h5 m-0"><b>PREMIUM PAKET</b>
						</div>
						<input type="hidden" name="premiumid" value="<%= agencija.getPonuda().getPremium().getPremiumid() %>">
						<div class="mb-3">
							<label for="opisPremium" class="form-control-label"></label> 
							<input type="text" class="form-control" name="opisPremium" value="<%=agencija.getPonuda().getPremium().getOpis() %>" required>
						</div>
						<div class="mb-3">
							<label for="cenaPremium" class="form-control-label"></label> 
							<input type="text" class="form-control" name="cenaPremium" value="<%=agencija.getPonuda().getPremium().getCena() %>" required>
						</div>
						<div class="mb-3 text-center">
							<p class="h5 m-0"><b>EXCLUSIVE PAKET</b>
						</div>
						<input type="hidden" name="exclusiveid" value="<%= agencija.getPonuda().getExclusive().getExclusiveid() %>">
						<div class="mb-3">
							<label for="opisExclusive" class="form-control-label"></label> 
							<input type="text" class="form-control" name="opisExclusive" value="<%=agencija.getPonuda().getExclusive().getOpis() %>" required>
						</div>
						<div class="mb-3">
							<label for="cenaExclusive" class="form-control-label"></label> 
							<input type="text" class="form-control" name="cenaExclusive" value="<%=agencija.getPonuda().getExclusive().getCena() %>" required>
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