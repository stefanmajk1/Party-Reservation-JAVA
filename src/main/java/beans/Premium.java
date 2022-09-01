package beans;

public class Premium {
	private int premiumid;
	private String opis;
	private int cena;
	public int getPremiumid() {
		return premiumid;
	}
	public void setPremiumid(int premiumid) {
		this.premiumid = premiumid;
	}
	public String getOpis() {
		return opis;
	}
	public void setOpis(String opis) {
		this.opis = opis;
	}
	public int getCena() {
		return cena;
	}
	public void setCena(int cena) {
		this.cena = cena;
	}
	public Premium(int premiumid, String opis, int cena) {
		this.premiumid = premiumid;
		this.opis = opis;
		this.cena = cena;
	}
}
