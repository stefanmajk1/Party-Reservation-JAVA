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

/**
 * Servlet implementation class editKorisnikServlet
 */
@WebServlet("/editKorisnikServlet")
public class editKorisnikServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editKorisnikServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		KorisnikRepository korisnikRepository = new KorisnikRepository();
		HttpSession sesija = request.getSession();
		String ime = request.getParameter("ime");
		String prezime = request.getParameter("prezime");
		String email = request.getParameter("email");
		Korisnik korisnik = korisnikRepository.edit((Korisnik)sesija.getAttribute("korisnik"), ime, prezime, email);
		sesija.setAttribute("korisnik", korisnik);
		if(korisnik.getRole().equals("korisnik")) {
			response.sendRedirect("profilServlet");
		}
		else if(korisnik.getRole().equals("menadzer")) {
			response.sendRedirect("menadzerServlet");
		}
		else {
			response.sendRedirect("adminServlet");
		}
	}

}
