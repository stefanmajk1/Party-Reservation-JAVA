package Servleti;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.KorisnikRepository;

/**
 * Servlet implementation class addMenadzerServlet
 */
@WebServlet("/addMenadzerServlet")
public class addMenadzerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addMenadzerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		KorisnikRepository korisnikRepository = new KorisnikRepository();
		String ime = request.getParameter("ime");
		String prezime = request.getParameter("prezime");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		korisnikRepository.addMenadzer(ime, prezime, email, password);
		response.sendRedirect("adminServlet");
	}

}
