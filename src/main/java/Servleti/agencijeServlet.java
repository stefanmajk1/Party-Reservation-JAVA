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

/**
 * Servlet implementation class agencijeServlet
 */
@WebServlet("/agencijeServlet")
public class agencijeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public agencijeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		AgencijaRepository agencijaRepository = new AgencijaRepository();
		ArrayList<Agencija> agencije;
		agencije = agencijaRepository.getAllAgencije();
		request.setAttribute("agencije", agencije);
		request.getRequestDispatcher("agencije.jsp").forward(request, response);
	}

}
