function confirmDeleteAgencija(id){
	if(confirm("Da li ste sigurni da zelite da obrisete ovu agenciju?")){
		window.location.href = "deleteAgencijaServlet?id=" + id;
	}
}