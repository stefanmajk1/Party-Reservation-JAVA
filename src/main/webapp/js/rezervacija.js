function potvrdaRezervacije(agencijaid, korisnikid){
	var datum = $('#datum').val();
	var vreme = $('#vreme').val();
	
	if(datum == "" || vreme == ""){
		$('#error').fadeIn();
	}
	else{
		var paket = $('#paket').text();
		var opis = $('#opis').text();
		var cena =  $('#cena').text();
		$.ajax({
			type: 'GET',
			url: 'rezervacijaServlet',
			data: "agencijaid=" + agencijaid + "&korisnikid=" + korisnikid + "&datum=" + datum + "&vreme=" + vreme + "&paket=" + paket + "&opis=" + opis + "&cena=" + cena,
			success: function(){
            $('#success').fadeIn();
			$('#error').fadeOut();
			$('#datum').val("");
			$('#vreme').val("");
        }
		})
	}
}
function getPaketDetails(paket, opis, cena){
	$('#paket').text(paket);
	$('#paket').css("font-weight", "bold");
	$('#opis').text(opis);
	$('#cena').text(cena); 
	$('#cena').css("font-weight", "bold");
	var cena = parseInt(cena);
	cenaSaPopustom = cena - cena/10;
	$('#cenaSaPopustom').text("Nova cena sa popustom: " + cenaSaPopustom + ",00 RSD");
	$('#cenaSaPopustom').css("font-weight", "bold");
}