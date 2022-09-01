<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="beans.*"%>
<%@page import="java.util.ArrayList"%>
<%
Agencija agencija = (Agencija)request.getAttribute("agencija");
HttpSession sesija = request.getSession();
Korisnik korisnik = (Korisnik)sesija.getAttribute("korisnik");
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

<title><%=agencija.getNaziv()%></title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="container " style="border-radius:25px;
	font-family: 'Nunito', sans-serif;
    font-weight: 600;
	background-color: rgba(255, 255, 255, .15);  
 backdrop-filter: blur(10px); background: whitesmoke;">
            <style>#kartica:hover{
    background-color: red;
    opacity: 1;
        transition: 0.3s;
        
}</style>
		<div class="row d-flex justify-content-center  ">
			<div class="col-md-8 text-center ">
				<h1 class="mt-5">
					<b><%=agencija.getNaziv()%></b>
				</h1>
				<div class="custom-separator my-2 mx-auto bg-warning " style="width: 25rem; height: 6px; border-radius: 1rem;"></div>
				<p class="mb-5"><%=agencija.getOpis()%></p>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12 text-center">
				
				<div class="row row-cols-1 row-cols-md-3 g-5 my-4">
				
      
					<div class="col">
						<div class="card h-100 kartica" id="kartica" style="background-color: rgba(255, 255, 255, .15);  border: none; border-radius: 5%; 
 backdrop-filter: blur(10px);background:#e5e4e2;">
							<div class="card-body d-flex flex-column p-4 text-center">
								<h1 class="h5 text-uppercase font-weight-bold mb-2" style="letter-spacing: 0.2em;">STANDARD</h1>
								<div class="custom-separator my-2 mx-auto bg-warning " style="width: 5rem; height: 6px; border-radius: 1rem;"></div>
								  <h2 class="h1 font-weight-bold mt-2"><%=agencija.getPonuda().getStandard().getCena()%>,00 RSD<span class="text-small font-weight-normal ml-2"></span></h2>
								
								<ul class="list-unstyled my-5 text-small text-left font-weight-normal">
								<li class="mb-3">
								<i class="fa fa-check mr-2 text-primary"></i><%=agencija.getPonuda().getStandard().getOpis()%></li>
								 </ul>
								
								<button class="btn btn-primary mt-auto purpl shadow rounded-pill" data-bs-toggle="modal"
									data-bs-target="#standardModal" onclick="getPaketDetails('STANDARD', '<%=agencija.getPonuda().getStandard().getOpis()%>', '<%=agencija.getPonuda().getStandard().getCena()%>')">BOOK IT</button>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="card h-100 kartica" id="kartica" style="background-color: rgba(255, 255, 255, .15);   border: none; border-radius: 5%; 
 backdrop-filter: blur(10px); background: #e5e4e2;">
							<div class="card-body d-flex flex-column p-4 text-center">
								<h1 class="h5 text-uppercase font-weight-bold mb-2" style="letter-spacing: 0.2em;">PREMIUM</h1>
								<div class="custom-separator my-2 mx-auto bg-warning " style="width: 5rem; height: 6px; border-radius: 1rem;"></div>
								 <h2 class="h1 font-weight-bold mt-2"><%=agencija.getPonuda().getPremium().getCena()%>,00 RSD<span class="text-small font-weight-normal ml-2"></span></h2>
								
								<ul class="list-unstyled my-5 text-small text-left font-weight-normal">
								<li class="mb-3">
								<i class="fa fa-check mr-2 text-primary"></i><%=agencija.getPonuda().getPremium().getOpis()%></ul>
								
								<button class="btn btn-primary mt-auto purpl shadow rounded-pill" data-bs-toggle="modal"
									data-bs-target="#standardModal" onclick="getPaketDetails('PREMIUM', '<%=agencija.getPonuda().getPremium().getOpis()%>', '<%=agencija.getPonuda().getPremium().getCena()%>')">BOOK IT</button>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="card h-100 kartica" id="kartica" style="background-color: rgba(255, 255, 255, .15);  border: none; border-radius: 5%; 
 backdrop-filter: blur(10px); background: #e5e4e2;">
							<div class="card-body d-flex flex-column p-4 text-center">
								<h1 class="h5 text-uppercase font-weight-bold mb-2" style="letter-spacing: 0.2em;">EXCLUSIVE</h1>
								<div class="custom-separator my-2 mx-auto bg-warning " style="width: 5rem; height: 6px; border-radius: 1rem;"></div>
								 <h2 class="h1 font-weight-bold mt-2"><%=agencija.getPonuda().getExclusive().getCena()%>,00 RSD<span class="text-small font-weight-normal ml-2"></span></h2>
								
								<ul class="list-unstyled my-5 text-small text-left font-weight-normal">
								<li class="mb-3">
								<i class="fa fa-check mr-2 text-primary"></i><%=agencija.getPonuda().getExclusive().getOpis()%></ul>
								<button class="btn btn-primary mt-auto purpl shadow rounded-pill" data-bs-toggle="modal"
									data-bs-target="#standardModal" onclick="getPaketDetails('EXCLUSIVE', '<%=agencija.getPonuda().getExclusive().getOpis()%>', '<%=agencija.getPonuda().getExclusive().getCena()%>')">BOOK IT</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid section-1">
		<div class="row d-flex justify-content-center">
			<div class="col-md-12 text-center">
				<h1 class="mt-5">
					<b>Find us at:</b>
				</h1>
				<h4 class="mb-5">
					<i class="fas fa-map-marker-alt"></i>
					<%=agencija.getAdresa()%></h4>
				<%=agencija.getMapa()%>
			</div>
		</div>
	</div>
	
	<div class="container-fluid section-2">
		<div class="row d-flex justify-content-center">
			<div class="col-md-12 text-center">
				<h1 class="mt-5">
					<b>Contact:</b>
				</h1>
				<h4>
					<i class="fas fa-user"></i>
					<%=agencija.getMenadzer().getIme()%>
					<%=agencija.getMenadzer().getPrezime()%></h4>
				<h4 class="mb-5">
					<i class="fas fa-envelope"></i>
					<%=agencija.getMenadzer().getEmail()%></h4>
			</div>
		</div>
	</div>
	<jsp:include page="futer.jsp" />
	<div class="modal fade" id="standardModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div
			class="modal-dialog modal-dialog-scrollable modal-dialog-centered">
			<div class="modal-content" style=" background-color:#e0ffff;">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel"><%=agencija.getNaziv()%></h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body" >
					<div class="row" id="success" style="display:none">
						<div class="col-md-12 section-2 p-3 my-3">
							<p class="mb-0">Uspešno ste izvršili rezervaciju, pregled vaše rezervacije možete pogledati na vašem <a href="profilServlet">profilu.</a></p>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<p class="float-start" id="paket">
							</p>
							<p class="float-start"><b>&nbsp;PAKET</b></p>
							<p class="float-end"><b>,00 RSD</b></p>
							<p class="float-end" id="cena">
							</p>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<p style="font-size: 0.8em" id="opis"></p>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 text-center" style="">
							<p style="font-size: 1.2em">
								<b>REZERVIŠI SVOJ TERMIN</b>
							</p>
							<div class="col-md-12 danger-section p-2" style="display: none" id="error">
								<p class="mb-0">Niste uneli sve potrebne podatke.</p>
							</div>
							<div class="mb-3">
								<label for="datum" class="form-label float-start">
									</label> <input type="date" class="form-control" id="datum">
							</div>
							<div class="mb-3">
								<label for="vreme" class="form-label float-start"></label> <input type="time" class="form-control" id="vreme">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 text-center" >
							<p style="font-size: 1.2em">
								<b>ZAUZETI TERMINI</b>
							</p>
							<%
							if (rezervacije == null) {
							%>
							<div class="row">
								<div class="col-md-12">
									<p>Trenutno nema zakazanih termina</p>
								</div>
							</div>
							<%
							} else {
							for (Rezervacija rezervacija : rezervacije) {
							%>
							<div class="row">
								<div class="col-md-12">
									<p class="float-start mb-0">
										Datum:
										<%=rezervacija.getDatum()%></p>
									<p class="float-end mb-0">
										Vreme:
										<%=rezervacija.getVreme()%></p>
								</div>
							</div>
							<%
							}
							}
							%>
						</div>
					</div>
					<%
					if(korisnik == null) {
					%>
					<div class="row">
						<div class="col-md-12">
							<p style="font-size: 0.8em" class="mb-0 mt-3">
								Ne možete potvrditi rezervaciju ukoliko niste <a
									href="login.jsp">ulogovani</a>
							</p>
							<p style="font-size: 0.8em" class="mb-0">
								Nemate nalog? Registrujte se <a href="registracija.jsp">ovde</a>
							</p>
						</div>
					</div>
					<%
					}
					%>
					<%
					if(korisnik!=null && korisnik.getBodovi() > 0){
					%>
					<div class="row">
						<div class="col-md-12 text-center">
							<p class="mb-0 mt-3">
								<b>Imate 10% popusta na sledeću rezervaciju!</b>
							</p>
							<p class="mb-0" id="cenaSaPopustom">
							</p>
						</div>
					</div>
					<%} %>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Izađi</button>
					<button type="button" class="btn btn-primary" <% if(korisnik==null){ %> disabled <%} %>
						onclick="potvrdaRezervacije('<%= agencija.getAgencijaid() %>', '<% if(korisnik == null){%> 0 <%} else{%><%=korisnik.getKorisnikid() %><% } %>')">Rezerviši</button>
				</div>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js"
		integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
		crossorigin="anonymous"></script>
	<script src="js/rezervacija.js"></script>
</body>
</html>