package beans;

public class Exclusive {
	private int exclusiveid;
	private String opis;
	private int cena;
	public int getExclusiveid() {
		return exclusiveid;
	}
	public void setExclusiveid(int exclusiveid) {
		this.exclusiveid = exclusiveid;
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
	public Exclusive(int exclusiveid, String opis, int cena) {
		this.exclusiveid = exclusiveid;
		this.opis = opis;
		this.cena = cena;
	}
}
