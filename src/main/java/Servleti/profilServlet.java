package Servleti;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Korisnik;
import beans.Rezervacija;
import beans.RezervacijaRepository;

/**
 * Servlet implementation class profilServlet
 */
@WebServlet("/profilServlet")
public class profilServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public profilServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RezervacijaRepository rezervacijaRepository = new RezervacijaRepository();
		HttpSession sesija = request.getSession();
		Korisnik korisnik = (Korisnik)sesija.getAttribute("korisnik");
		ArrayList<Rezervacija> rezervacije = rezervacijaRepository.getRezervacijeByKorisnik(korisnik);
		request.setAttribute("rezervacijeNaProfilu", rezervacije);
		request.getRequestDispatcher("profil.jsp").forward(request, response);
	}

}
