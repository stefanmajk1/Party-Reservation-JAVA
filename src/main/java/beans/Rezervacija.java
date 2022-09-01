package beans;

public class Rezervacija {
	private int rezervacijaid;
	private String datum;
	private String vreme;
	private String paket;
	private String opispaketa;
	private int cenapaketa;
	private Agencija agencija;
	private Korisnik korisnik;
	public int getRezervacijaid() {
		return rezervacijaid;
	}
	public void setRezervacijaid(int rezervacijaid) {
		this.rezervacijaid = rezervacijaid;
	}
	public String getDatum() {
		return datum;
	}
	public void setDatum(String datum) {
		this.datum = datum;
	}
	public String getVreme() {
		return vreme;
	}
	public void setVreme(String vreme) {
		this.vreme = vreme;
	}
	public String getPaket() {
		return paket;
	}
	public void setPaket(String paket) {
		this.paket = paket;
	}
	public String getOpispaketa() {
		return opispaketa;
	}
	public void setOpispaketa(String opispaketa) {
		this.opispaketa = opispaketa;
	}
	public int getCenapaketa() {
		return cenapaketa;
	}
	public void setCenapaketa(int cenapaketa) {
		this.cenapaketa = cenapaketa;
	}
	public Agencija getAgencija() {
		return agencija;
	}
	public void setAgencija(Agencija agencija) {
		this.agencija = agencija;
	}
	public Korisnik getKorisnik() {
		return korisnik;
	}
	public void setKorisnik(Korisnik korisnik) {
		this.korisnik = korisnik;
	}
	public Rezervacija(int rezervacijaid, String datum, String vreme, String paket, String opispaketa,
			int cenapaketa, Agencija agencija, Korisnik korisnik) {
		this.rezervacijaid = rezervacijaid;
		this.datum = datum;
		this.vreme = vreme;
		this.paket = paket;
		this.opispaketa = opispaketa;
		this.cenapaketa = cenapaketa;
		this.agencija = agencija;
		this.korisnik = korisnik;
	}
}
