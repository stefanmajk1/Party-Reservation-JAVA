package beans;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class KorisnikRepository {
	public Korisnik getKorisnikById(int id) {
		Korisnik korisnik = null;
		DatabaseConnection dbconn = new DatabaseConnection();
		dbconn.connect();
		Connection conn = dbconn.getConnection();
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from korisnik where korisnikid=" + id);
			if (rs.next()) {
				korisnik = new Korisnik(id, rs.getString("ime"), rs.getString("prezime"), rs.getString("email"),
						rs.getString("password"), rs.getInt("bodovi"), rs.getString("role"));
			}
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dbconn.disconnect(conn);
		return korisnik;
	}

	public void addKorisnikTenPoints(int id) {
		DatabaseConnection dbconn = new DatabaseConnection();
		dbconn.connect();
		Connection conn = dbconn.getConnection();
		try {
			Statement stmt = conn.createStatement();
			stmt.executeUpdate("UPDATE korisnik set bodovi='10' where korisnikid=" + id);
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dbconn.disconnect(conn);
	}
	public void deleteKorisnikPoints(int id) {
		DatabaseConnection dbconn = new DatabaseConnection();
		dbconn.connect();
		Connection conn = dbconn.getConnection();
		try {
			Statement stmt = conn.createStatement();
			stmt.executeUpdate("UPDATE korisnik set bodovi='0' where korisnikid=" + id);
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dbconn.disconnect(conn);
	}

	public void addKorisnik(String ime, String prezime, String email, String password) {
		DatabaseConnection dbconn = new DatabaseConnection();
		dbconn.connect();
		Connection conn = dbconn.getConnection();
		try {
			Statement stmt = conn.createStatement();
			stmt.executeUpdate(
					"INSERT INTO `korisnik` (`ime`, `prezime`, `email`, `password`, `bodovi`, `role`) VALUES ('" + ime
							+ "', '" + prezime + "', '" + email + "', '" + password + "', '0', 'korisnik')");
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dbconn.disconnect(conn);
	}

	public boolean emailExists(String email) {
		DatabaseConnection dbconn = new DatabaseConnection();
		dbconn.connect();
		Connection conn = dbconn.getConnection();
		int rez = 0;
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select COUNT(*) from korisnik where email='" + email + "'");
			if (rs.next()) {
				rez = rs.getInt("COUNT(*)");
			}
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dbconn.disconnect(conn);
		if (rez == 0) {
			return false;
		} else {
			return true;
		}
	}

	public boolean userExists(String email, String password) {
		DatabaseConnection dbconn = new DatabaseConnection();
		dbconn.connect();
		Connection conn = dbconn.getConnection();
		int rez = 0;
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(
					"select COUNT(*) from korisnik where email='" + email + "' and password='" + password + "'");
			if (rs.next()) {
				rez = rs.getInt("COUNT(*)");
			}
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dbconn.disconnect(conn);
		if (rez == 0) {
			return false;
		} else {
			return true;
		}
	}

	public Korisnik getKorisnikByEmail(String email) {
		Korisnik korisnik = null;
		DatabaseConnection dbconn = new DatabaseConnection();
		dbconn.connect();
		Connection conn = dbconn.getConnection();
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from korisnik where email='" + email + "'");
			if (rs.next()) {
				korisnik = new Korisnik(rs.getInt("korisnikid"), rs.getString("ime"), rs.getString("prezime"),
				rs.getString("email"), rs.getString("password"), rs.getInt("bodovi"), rs.getString("role"));
			}
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dbconn.disconnect(conn);
		return korisnik;
	}
	public void delete(int id) {
		DatabaseConnection dbconn = new DatabaseConnection();
		dbconn.connect();
		Connection conn = dbconn.getConnection();
		try {
			Statement stmt = conn.createStatement();
			stmt.executeUpdate("delete from agencija where menadzerid=" + id);
			stmt.executeUpdate("delete from rezervacija where korisnikid=" + id);
			stmt.executeUpdate("delete from korisnik where korisnikid=" + id);
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dbconn.disconnect(conn);
	}
	public Korisnik edit(Korisnik korisnik, String ime, String prezime, String email) {
		DatabaseConnection dbconn = new DatabaseConnection();
		dbconn.connect();
		Connection conn = dbconn.getConnection();
		try {
			Statement stmt = conn.createStatement();
			stmt.executeUpdate("update korisnik set ime = '" + ime + "', prezime = '" + prezime + "', email = '" + email +"' where korisnikid = " + korisnik.getKorisnikid());
			korisnik.setIme(ime);
			korisnik.setPrezime(prezime);
			korisnik.setEmail(email);
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dbconn.disconnect(conn);
		return korisnik;
	}
	public void addMenadzer(String ime, String prezime, String email, String password) {
		PonudaRepository ponudaRepository = new PonudaRepository();
		int ponudaid = ponudaRepository.generateNewPonudaId();
		AgencijaRepository agencijaRepository = new AgencijaRepository();
		int menadzerid = agencijaRepository.generateNewMenadzerId();
		DatabaseConnection dbconn = new DatabaseConnection();
		dbconn.connect();
		Connection conn = dbconn.getConnection();
		try {
			Statement stmt = conn.createStatement();
			String q1 = "INSERT INTO `korisnik` (korisnikid, `ime`, `prezime`, `email`, `password`, `bodovi`, `role`) VALUES (" + menadzerid + ",'" + ime
							+ "', '" + prezime + "', '" + email + "', '" + password + "', 0, 'menadzer')";
			String q2 = "insert into standard (standardid, opis, cena) values (" + ponudaid + ", '', null)";
			String q3 = "insert into premium (premiumid, opis, cena) values (" + ponudaid + ", '', null)";
			String q4 = "insert into exclusive (exclusiveid, opis, cena) values (" + ponudaid + ", '', null)";
			String q5 = "insert into ponuda (ponudaid, standardid, premiumid, exclusiveid) values (" + ponudaid + ", " + ponudaid + ", " + ponudaid + ", " + ponudaid + ")";
			String q6 = "INSERT INTO `agencija` (`agencijaid`, `naziv`, `opis`, `adresa`, `mapa`, `ponudaid`, `menadzerid`) VALUES (NULL, '', '', '', '', '" + ponudaid + "', '" + menadzerid + "')";
			stmt.addBatch(q1);
			stmt.addBatch(q2);
			stmt.addBatch(q3);
			stmt.addBatch(q4);
			stmt.addBatch(q5);
			stmt.addBatch(q6);
			stmt.executeBatch();
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dbconn.disconnect(conn);
	}
}
