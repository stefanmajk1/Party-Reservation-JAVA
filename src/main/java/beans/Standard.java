package beans;

public class Standard {
	private int standardid;
	private String opis;
	private int cena;
	public int getStandardid() {
		return standardid;
	}
	public void setStandardid(int standardid) {
		this.standardid = standardid;
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
	public Standard(int standardid, String opis, int cena) {
		this.standardid = standardid;
		this.opis = opis;
		this.cena = cena;
	}
}
