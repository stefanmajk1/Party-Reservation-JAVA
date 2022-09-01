package Servleti;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Korisnik;
import beans.KorisnikRepository;
import beans.RezervacijaRepository;

/**
 * Servlet implementation class rezervacijaServlet
 */
@WebServlet("/rezervacijaServlet")
public class rezervacijaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public rezervacijaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RezervacijaRepository rezervacijaRepository = new RezervacijaRepository();
		KorisnikRepository korisnikRepository = new KorisnikRepository();
		int agencijaid = Integer.parseInt(request.getParameter("agencijaid"));
		int korisnikid = Integer.parseInt(request.getParameter("korisnikid"));
		Korisnik korisnik = korisnikRepository.getKorisnikById(korisnikid);
		int cena = Integer.parseInt(request.getParameter("cena")); 
		int bodovi = korisnik.getBodovi();
		if(bodovi > 0) {
			cena = cena - (cena/10);
			korisnikRepository.deleteKorisnikPoints(korisnikid);
			korisnik.setBodovi(0);
			HttpSession sesija = request.getSession();
			sesija.setAttribute("korisnik", korisnik);
		}
		else {
			korisnikRepository.addKorisnikTenPoints(korisnikid);
			korisnik.setBodovi(10);
			HttpSession sesija = request.getSession();
			sesija.setAttribute("korisnik", korisnik);
		}
		String datum = request.getParameter("datum");
		String vreme = request.getParameter("vreme");
		String paket = request.getParameter("paket");
		String opis = request.getParameter("opis");
		rezervacijaRepository.add(agencijaid, korisnikid, datum, vreme, paket, opis, cena);
	}

}
