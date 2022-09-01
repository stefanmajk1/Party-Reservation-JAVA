package beans;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class PonudaRepository {
	public int generateNewPonudaId() {
		int id = 0;
		DatabaseConnection dbconn = new DatabaseConnection();
		dbconn.connect();
		Connection conn = dbconn.getConnection();
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select max(ponudaid) from ponuda");
			if(rs.next()) {
				id = rs.getInt("max(ponudaid)");
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
