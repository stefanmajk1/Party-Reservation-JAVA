package Servleti;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.KorisnikRepository;

/**
 * Servlet implementation class registracijaServlet
 */
@WebServlet("/registracijaServlet")
public class registracijaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registracijaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		KorisnikRepository korisnikRepository = new KorisnikRepository();
		String email = request.getParameter("email");
		String ime = request.getParameter("ime");
		String prezime = request.getParameter("prezime");
		String password = request.getParameter("password");
		if(korisnikRepository.emailExists(email)) {
			request.setAttribute("error", true);
			request.getRequestDispatcher("registracija.jsp").forward(request, response);
		}
		else {
			korisnikRepository.addKorisnik(ime, prezime, email, password);
			request.getRequestDispatcher("uspesnaregistracija.jsp").forward(request, response);
		}
	}

}
