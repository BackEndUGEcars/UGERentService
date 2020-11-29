package fr.uge.webservices;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ReturnCar
 */
@WebServlet("/returnCar")
public class ReturnCar extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		App app = (App) session.getAttribute("app");
		session.setAttribute("carToReturn", request.getParameter("returnCarButton"));
		request.getRequestDispatcher("/ReturnCar.jsp").forward(request, response);
	}

}
