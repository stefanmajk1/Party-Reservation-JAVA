function confirmDelete(id){
	if(confirm("Da li ste sigurni da želite da obrišete svoj profil?")){
		window.location.href = "deleteKorisnikServlet?id=" + id;
	}
}