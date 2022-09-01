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
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		KorisnikRepository korisnikRepository = new KorisnikRepository();
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		if(korisnikRepository.userExists(email, password)) {
			Korisnik korisnik = korisnikRepository.getKorisnikByEmail(email);
			HttpSession sesija = request.getSession();
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
		else {
			request.setAttribute("error", true);
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

}
