package Servleti;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Agencija;
import beans.AgencijaRepository;
import beans.Korisnik;
import beans.Rezervacija;
import beans.RezervacijaRepository;

/**
 * Servlet implementation class menadzerServlet
 */
@WebServlet("/menadzerServlet")
public class menadzerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public menadzerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		AgencijaRepository agencijaRepository = new AgencijaRepository();
		RezervacijaRepository rezervacijaRepository = new RezervacijaRepository();
		HttpSession sesija = request.getSession();
		Korisnik menadzer = (Korisnik)sesija.getAttribute("korisnik");
		Agencija agencija = agencijaRepository.getAgencijaByMenadzer(menadzer);
		ArrayList<Rezervacija> rezervacije = rezervacijaRepository.getRezervacijeByAgencija(agencija);
		request.setAttribute("rezervacije", rezervacije);
		request.setAttribute("agencija", agencija);
		request.getRequestDispatcher("menadzerpanel.jsp").forward(request, response);
	}

}
