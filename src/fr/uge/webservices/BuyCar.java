package fr.uge.webservices;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class BuyCar
 */
@WebServlet("/buyCar")
public class BuyCar extends HttpServlet {
	private static final long serialVersionUID = 1789L;
       
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		App app = (App) session.getAttribute("app");
		app.rent(Long.valueOf(request.getParameter("buyButton")));
		request.getRequestDispatcher("/Cart.jsp").forward(request, response);
	}

}
