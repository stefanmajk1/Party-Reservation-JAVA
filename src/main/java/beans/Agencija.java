package beans;

public class Agencija {
	private int agencijaid;
	private String naziv;
	private String opis;
	private String adresa;
	private String mapa;
	private Ponuda ponuda;
	private Korisnik menadzer;
	public int getAgencijaid() {
		return agencijaid;
	}
	public void setAgencijaid(int agencijaid) {
		this.agencijaid = agencijaid;
	}
	public String getNaziv() {
		return naziv;
	}
	public void setNaziv(String naziv) {
		this.naziv = naziv;
	}
	public String getOpis() {
		return opis;
	}
	public void setOpis(String opis) {
		this.opis = opis;
	}
	public String getAdresa() {
		return adresa;
	}
	public void setAdresa(String adresa) {
		this.adresa = adresa;
	}
	public String getMapa() {
		return mapa;
	}
	public void setMapa(String mapa) {
		this.mapa = mapa;
	}
	public Ponuda getPonuda() {
		return ponuda;
	}
	public void setPonuda(Ponuda ponuda) {
		this.ponuda = ponuda;
	}
	public Korisnik getMenadzer() {
		return menadzer;
	}
	public void setMenadzer(Korisnik menadzer) {
		this.menadzer = menadzer;
	}
	public Agencija(int agencijaid, String naziv, String opis, String adresa, String mapa, Ponuda ponuda,
			Korisnik menadzer) {
		this.agencijaid = agencijaid;
		this.naziv = naziv;
		this.opis = opis;
		this.adresa = adresa;
		this.mapa = mapa;
		this.ponuda = ponuda;
		this.menadzer = menadzer;
	}
}
