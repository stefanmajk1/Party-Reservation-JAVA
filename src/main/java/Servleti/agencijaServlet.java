package Servleti;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Agencija;
import beans.AgencijaRepository;
import beans.Rezervacija;
import beans.RezervacijaRepository;

/**
 * Servlet implementation class agencijaServlet
 */
@WebServlet("/agencijaServlet")
public class agencijaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public agencijaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		AgencijaRepository agencijaRepository = new AgencijaRepository();
		Agencija agencija = agencijaRepository.getAgencijaById(id);
		RezervacijaRepository rezervacijaRepository = new RezervacijaRepository();
		ArrayList<Rezervacija> rezervacije = rezervacijaRepository.getRezervacijeByAgencija(agencija);
		request.setAttribute("rezervacije", rezervacije);
		request.setAttribute("agencija", agencija);
		request.getRequestDispatcher("agencija.jsp").forward(request, response);
	}
}
