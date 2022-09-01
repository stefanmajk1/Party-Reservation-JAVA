package beans;

public class Korisnik {
	private int korisnikid;
	private String ime;
	private String prezime;
	private String email;
	private String password;
	private int bodovi;
	private String role;
	public int getKorisnikid() {
		return korisnikid;
	}
	public void setKorisnikid(int korisnikid) {
		this.korisnikid = korisnikid;
	}
	public String getIme() {
		return ime;
	}
	public void setIme(String ime) {
		this.ime = ime;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPrezime() {
		return prezime;
	}
	public void setPrezime(String prezime) {
		this.prezime = prezime;
	}
	public int getBodovi() {
		return bodovi;
	}
	public void setBodovi(int bodovi) {
		this.bodovi = bodovi;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public Korisnik(int korisnikid, String ime, String prezime, String email, String password, int bodovi,
			String role) {
		super();
		this.korisnikid = korisnikid;
		this.ime = ime;
		this.prezime = prezime;
		this.email = email;
		this.password = password;
		this.bodovi = bodovi;
		this.role = role;
	}
}
