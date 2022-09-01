package Servleti;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.KorisnikRepository;

/**
 * Servlet implementation class deleteKorisnikServlet
 */
@WebServlet("/deleteKorisnikServlet")
public class deleteKorisnikServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteKorisnikServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		KorisnikRepository korisnikRepository = new KorisnikRepository();
		int id = Integer.parseInt(request.getParameter("id"));
		korisnikRepository.delete(id);
		HttpSession sesija = request.getSession();
		sesija.removeAttribute("korisnik");
		response.sendRedirect("index.jsp");
	}

}
