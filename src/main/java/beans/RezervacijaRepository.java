package beans;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class RezervacijaRepository {
	public ArrayList<Rezervacija> getRezervacijeByAgencija(Agencija agencija){
		ArrayList<Rezervacija> rezervacije = new ArrayList<Rezervacija>();
		DatabaseConnection dbconn = new DatabaseConnection();
		dbconn.connect();
		Connection conn = dbconn.getConnection();
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from rezervacija join korisnik on rezervacija.korisnikid = korisnik.korisnikid where agencijaid=" + agencija.getAgencijaid() + " order by datum desc");
			while(rs.next()) {
				Korisnik korisnik = new Korisnik(rs.getInt("korisnikid"), rs.getString("ime"), rs.getString("prezime"), rs.getString("email"), rs.getString("password"), rs.getInt("bodovi"), rs.getString("role"));
				Rezervacija rezervacija = new Rezervacija(rs.getInt("rezervacijaid"), rs.getString("datum"), rs.getString("vreme"), rs.getString("paket"), rs.getString("opispaketa"), rs.getInt("cenapaketa"), agencija, korisnik);
				rezervacije.add(rezervacija);
			}
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(rezervacije.isEmpty()) {
			dbconn.disconnect(conn);
			return null;
		}
		else {
			dbconn.disconnect(conn);
			return rezervacije;
		}
	}
	public void add(int agencijaid, int korisnikid, String datum, String vreme, String paket, String opis, int cena) {
		DatabaseConnection dbconn = new DatabaseConnection();
		dbconn.connect();
		Connection conn = dbconn.getConnection();
		try {
			Statement stmt = conn.createStatement();
			stmt.executeUpdate("INSERT INTO `rezervacija` (`datum`, `vreme`, `paket`, `opispaketa`, `cenapaketa`, `agencijaid`, `korisnikid`) VALUES ('" + datum + "', '" + vreme + "', '" + paket + "', '" + opis + "', '" + cena + "', '" + agencijaid + "', '" + korisnikid + "');");
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dbconn.disconnect(conn);
	}
	public ArrayList<Rezervacija> getRezervacijeByKorisnik(Korisnik korisnik){
		ArrayList<Rezervacija> rezervacije = new ArrayList<Rezervacija>();
		DatabaseConnection dbconn = new DatabaseConnection();
		dbconn.connect();
		Connection conn = dbconn.getConnection();
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select r.rezervacijaid, r.datum, r.vreme, r.paket, r.opispaketa, r.cenapaketa, a.agencijaid, a.naziv, a.opis as opisagencije, a.adresa, a.mapa, p.ponudaid, s.standardid, s.opis as opisstandard, s.cena as cenastandard, pr.premiumid, pr.opis as opispremium, pr.cena as cenapremium, e.exclusiveid, e.opis as opisexclusive, e.cena as cenaexclusive, k.korisnikid, k.ime, k.prezime, k.email, k.password, k.bodovi, k.role, m.korisnikid as menadzerid, m.ime as menadzerime, m.prezime as menadzerprezime, m.email as menadzeremail, m.password as menadzerpassword, m.bodovi as menadzerbodovi, m.role as menadzerrole\r\n"
					+ "from rezervacija r join korisnik k on r.korisnikid = k.korisnikid join agencija a on r.agencijaid=a.agencijaid join ponuda p on a.ponudaid = p.ponudaid join standard s on p.standardid = s.standardid join premium pr on p.premiumid = pr.premiumid join exclusive e on p.ponudaid = e.exclusiveid join korisnik m on a.menadzerid=m.korisnikid\r\n"
					+ "where k.korisnikid= " + korisnik.getKorisnikid() + " order by r.datum desc");
			while(rs.next()) {
				Standard standard = new Standard(rs.getInt("standardid"), rs.getString("opisstandard"),
						rs.getInt("cenastandard"));
				Premium premium = new Premium(rs.getInt("premiumid"), rs.getString("opispremium"),
						rs.getInt("cenapremium"));
				Exclusive exclusive = new Exclusive(rs.getInt("exclusiveid"), rs.getString("opisexclusive"),
						rs.getInt("cenaexclusive"));
				Ponuda ponuda = new Ponuda(rs.getInt("ponudaid"), standard, premium, exclusive);
				Korisnik menadzer = new Korisnik(rs.getInt("menadzerid"), rs.getString("menadzerime"), rs.getString("menadzerprezime"),
						rs.getString("menadzeremail"), rs.getString("menadzerpassword"), rs.getInt("menadzerbodovi"), rs.getString("menadzerrole"));
				Agencija agencija = new Agencija(rs.getInt("agencijaid"), rs.getString("naziv"),
						rs.getString("opisagencije"), rs.getString("adresa"), rs.getString("mapa"), ponuda, menadzer);
				Rezervacija rezervacija = new Rezervacija(rs.getInt("rezervacijaid"), rs.getString("datum"), rs.getString("vreme"), rs.getString("paket"), rs.getString("opispaketa"), rs.getInt("cenapaketa"), agencija, korisnik);
				rezervacije.add(rezervacija);
			}
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(rezervacije.isEmpty()) {
			dbconn.disconnect(conn);
			return null;
		}
		else {
			dbconn.disconnect(conn);
			return rezervacije;
		}
	}
	
}
