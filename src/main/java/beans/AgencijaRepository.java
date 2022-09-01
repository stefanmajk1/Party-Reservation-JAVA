package beans;

import java.util.ArrayList;

import java.sql.*;

public class AgencijaRepository {

	public ArrayList<Agencija> getAllAgencije() {
		DatabaseConnection dbconn = new DatabaseConnection();
		dbconn.connect();
		Connection conn = dbconn.getConnection();
		ArrayList<Agencija> agencije = new ArrayList<Agencija>();
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(
					"select a.agencijaid, a.naziv, a.opis as opisagencije, a.adresa, a.mapa, p.ponudaid, s.standardid, s.opis as opisstandard, s.cena as cenastandard, pr.premiumid, pr.opis as opispremium, pr.cena as cenapremium, e.exclusiveid, e.opis as opisexclusive, e.cena as cenaexclusive, k.korisnikid, k.ime, k.prezime, k.email, k.password, k.bodovi, k.role\r\n"
							+ "from agencija a join ponuda p on a.ponudaid = p.ponudaid join standard s on p.standardid = s.standardid join premium pr on p.premiumid = pr.premiumid join exclusive e on p.ponudaid = e.exclusiveid join korisnik k on a.menadzerid = k.korisnikid;");
			while (rs.next()) {
				Standard standard = new Standard(rs.getInt("standardid"), rs.getString("opisstandard"),
						rs.getInt("cenastandard"));
				Premium premium = new Premium(rs.getInt("premiumid"), rs.getString("opispremium"),
						rs.getInt("cenapremium"));
				Exclusive exclusive = new Exclusive(rs.getInt("exclusiveid"), rs.getString("opisexclusive"),
						rs.getInt("cenaexclusive"));
				Ponuda ponuda = new Ponuda(rs.getInt("ponudaid"), standard, premium, exclusive);
				Korisnik menadzer = new Korisnik(rs.getInt("korisnikid"), rs.getString("ime"), rs.getString("prezime"),
						rs.getString("email"), rs.getString("password"), rs.getInt("bodovi"), rs.getString("role"));
				Agencija agencija = new Agencija(rs.getInt("agencijaid"), rs.getString("naziv"),
						rs.getString("opisagencije"), rs.getString("adresa"), rs.getString("mapa"), ponuda, menadzer);
				agencije.add(agencija);
			}
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dbconn.disconnect(conn);
		return agencije;
	}

	public Agencija getAgencijaById(int id) {
		Agencija agencija = null;
		DatabaseConnection dbconn = new DatabaseConnection();
		dbconn.connect();
		Connection conn = dbconn.getConnection();
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(
					"select a.agencijaid, a.naziv, a.opis as opisagencije, a.adresa, a.mapa, p.ponudaid, s.standardid, s.opis as opisstandard, s.cena as cenastandard, pr.premiumid, pr.opis as opispremium, pr.cena as cenapremium, e.exclusiveid, e.opis as opisexclusive, e.cena as cenaexclusive, k.korisnikid, k.ime, k.prezime, k.email, k.password, k.bodovi, k.role\r\n"
							+ "from agencija a join ponuda p on a.ponudaid = p.ponudaid join standard s on p.standardid = s.standardid join premium pr on p.premiumid = pr.premiumid join exclusive e on p.ponudaid = e.exclusiveid join korisnik k on a.menadzerid = k.korisnikid where agencijaid=" + id);
			if(rs.next()) {
				Standard standard = new Standard(rs.getInt("standardid"), rs.getString("opisstandard"),
						rs.getInt("cenastandard"));
				Premium premium = new Premium(rs.getInt("premiumid"), rs.getString("opispremium"),
						rs.getInt("cenapremium"));
				Exclusive exclusive = new Exclusive(rs.getInt("exclusiveid"), rs.getString("opisexclusive"),
						rs.getInt("cenaexclusive"));
				Ponuda ponuda = new Ponuda(rs.getInt("ponudaid"), standard, premium, exclusive);
				Korisnik menadzer = new Korisnik(rs.getInt("korisnikid"), rs.getString("ime"), rs.getString("prezime"),
						rs.getString("email"), rs.getString("password"), rs.getInt("bodovi"), rs.getString("role"));
				agencija = new Agencija(rs.getInt("agencijaid"), rs.getString("naziv"),
						rs.getString("opisagencije"), rs.getString("adresa"), rs.getString("mapa"), ponuda, menadzer);
				
			}
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dbconn.disconnect(conn);
		return agencija;
	}
	public Agencija getAgencijaByMenadzer(Korisnik menadzer) {
		Agencija agencija = null;
		DatabaseConnection dbconn = new DatabaseConnection();
		dbconn.connect();
		Connection conn = dbconn.getConnection();
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(
					"select a.agencijaid, a.naziv, a.opis as opisagencije, a.adresa, a.mapa, p.ponudaid, s.standardid, s.opis as opisstandard, s.cena as cenastandard, pr.premiumid, pr.opis as opispremium, pr.cena as cenapremium, e.exclusiveid, e.opis as opisexclusive, e.cena as cenaexclusive, k.korisnikid, k.ime, k.prezime, k.email, k.password, k.bodovi, k.role\r\n"
							+ "from agencija a join ponuda p on a.ponudaid = p.ponudaid join standard s on p.standardid = s.standardid join premium pr on p.premiumid = pr.premiumid join exclusive e on p.ponudaid = e.exclusiveid join korisnik k on a.menadzerid = k.korisnikid where k.korisnikid=" + menadzer.getKorisnikid());
			if(rs.next()) {
				Standard standard = new Standard(rs.getInt("standardid"), rs.getString("opisstandard"),
						rs.getInt("cenastandard"));
				Premium premium = new Premium(rs.getInt("premiumid"), rs.getString("opispremium"),
						rs.getInt("cenapremium"));
				Exclusive exclusive = new Exclusive(rs.getInt("exclusiveid"), rs.getString("opisexclusive"),
						rs.getInt("cenaexclusive"));
				Ponuda ponuda = new Ponuda(rs.getInt("ponudaid"), standard, premium, exclusive);
				agencija = new Agencija(rs.getInt("agencijaid"), rs.getString("naziv"),
						rs.getString("opisagencije"), rs.getString("adresa"), rs.getString("mapa"), ponuda, menadzer);
				
			}
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dbconn.disconnect(conn);
		return agencija;
	}
	public void edit(int agencijaid, String naziv, String opis, String adresa, String mapa, int standardid, String opisStandard, int cenaStandard, int premiumid, String opisPremium, int cenaPremium, int exclusiveid, String opisExclusive, int cenaExclusive) {
		DatabaseConnection dbconn = new DatabaseConnection();
		dbconn.connect();
		Connection conn = dbconn.getConnection();
		try {
			Statement stmt = conn.createStatement();
			String q1 = "update agencija set naziv='" + naziv + "', opis='" + opis + "', adresa='" + adresa + "', mapa='" + mapa + "' where agencijaid=" + agencijaid;
			String q2 = "update standard set opis='" + opisStandard + "', cena=" + cenaStandard + " where standardid=" + standardid;
			String q3 = "update premium set opis='" + opisPremium + "', cena=" + cenaPremium + " where premiumid=" + premiumid;
			String q4 = "update exclusive set opis='" + opisExclusive + "', cena=" + cenaExclusive + " where exclusiveid=" + exclusiveid;
			stmt.addBatch(q1);
			stmt.addBatch(q2);
			stmt.addBatch(q3);
			stmt.addBatch(q4);
			stmt.executeBatch();
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dbconn.disconnect(conn);
	}
	public void delete(Agencija agencija) {
		DatabaseConnection dbconn = new DatabaseConnection();
		dbconn.connect();
		Connection conn = dbconn.getConnection();
		try {
			Statement stmt = conn.createStatement();
			String q1 = "delete from rezervacija where agencijaid=" + agencija.getAgencijaid();
			String q2 = "delete from agencija where agencijaid=" + agencija.getAgencijaid();
			String q3 = "delete from korisnik where korisnikid=" + agencija.getMenadzer().getKorisnikid();
			stmt.addBatch(q1);
			stmt.addBatch(q2);
			stmt.addBatch(q3);
			stmt.executeBatch();
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dbconn.disconnect(conn);
	}
	public int generateNewMenadzerId() {
		int id = 0;
		DatabaseConnection dbconn = new DatabaseConnection();
		dbconn.connect();
		Connection conn = dbconn.getConnection();
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select max(korisnikid) from korisnik");
			if(rs.next()) {
				id = rs.getInt("max(korisnikid)");
			}
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dbconn.disconnect(conn);
		return id + 1;
	}
}
