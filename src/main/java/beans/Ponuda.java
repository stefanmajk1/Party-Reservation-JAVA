package beans;

public class Ponuda {
	private int ponudaid;
	private Standard standard;
	private Premium premium;
	private Exclusive exclusive;
	public int getPonudaid() {
		return ponudaid;
	}
	public void setPonudaid(int ponudaid) {
		this.ponudaid = ponudaid;
	}
	public Standard getStandard() {
		return standard;
	}
	public void setStandard(Standard standard) {
		this.standard = standard;
	}
	public Premium getPremium() {
		return premium;
	}
	public void setPremium(Premium premium) {
		this.premium = premium;
	}
	public Exclusive getExclusive() {
		return exclusive;
	}
	public void setExclusive(Exclusive exclusive) {
		this.exclusive = exclusive;
	}
	public Ponuda(int ponudaid, Standard standard, Premium premium, Exclusive exclusive) {
		this.ponudaid = ponudaid;
		this.standard = standard;
		this.premium = premium;
		this.exclusive = exclusive;
	}
}
