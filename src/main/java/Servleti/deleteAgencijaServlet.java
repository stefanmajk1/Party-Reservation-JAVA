package Servleti;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Agencija;
import beans.AgencijaRepository;

/**
 * Servlet implementation class deleteAgencijaServlet
 */
@WebServlet("/deleteAgencijaServlet")
public class deleteAgencijaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteAgencijaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AgencijaRepository agencijaRepository = new AgencijaRepository();
		int agencijaid = Integer.parseInt(request.getParameter("id"));
		Agencija agencija = agencijaRepository.getAgencijaById(agencijaid);
		agencijaRepository.delete(agencija);
		request.getRequestDispatcher("adminServlet").forward(request, response);
	}

}
