package Servleti;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.filters.SetCharacterEncodingFilter;

import beans.AgencijaRepository;

/**
 * Servlet implementation class editAgencijaServlet
 */
@WebServlet("/editAgencijaServlet")
public class editAgencijaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editAgencijaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SetCharacterEncodingFilter filter = new SetCharacterEncodingFilter();
		filter.setEncoding("UTF-8");
		AgencijaRepository agencijaRepository = new AgencijaRepository();
		int agencijaid = Integer.parseInt(request.getParameter("agencijaid"));
		String naziv = request.getParameter("naziv");
		String opis = request.getParameter("opis");
		String adresa = request.getParameter("adresa");
		String mapa = request.getParameter("mapa");
		int standardid = Integer.parseInt(request.getParameter("standardid"));
		String opisStandard = request.getParameter("opisStandard");
		int cenaStandard = Integer.parseInt(request.getParameter("cenaStandard"));
		int premiumid = Integer.parseInt(request.getParameter("premiumid"));
		String opisPremium = request.getParameter("opisPremium");
		int cenaPremium = Integer.parseInt(request.getParameter("cenaPremium"));
		int exclusiveid = Integer.parseInt(request.getParameter("exclusiveid"));
		String opisExclusive = request.getParameter("opisExclusive");
		int cenaExclusive = Integer.parseInt(request.getParameter("cenaExclusive"));
		agencijaRepository.edit(agencijaid, naziv, opis, adresa, mapa, standardid, opisStandard, cenaStandard, premiumid, opisPremium, cenaPremium, exclusiveid, opisExclusive, cenaExclusive);
		response.sendRedirect("menadzerServlet");
	}

}
