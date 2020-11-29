package fr.uge.webservices;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.rpc.ServiceException;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("app") == null) {
			App app = null;
			try {
				app = (App) new AppServiceLocator().getApp();
			} catch (ServiceException e) {
				System.out.println(e);
			}
			((AppSoapBindingStub) app).setMaintainSession(true);
			session.setAttribute("app", app);	
		}
		
		App myApp = (App) session.getAttribute("app");
		if(!myApp.connect(request.getParameter("username"), request.getParameter("password"))) {
			request.getRequestDispatcher("/Invalidation.jsp").forward(request, response);
		}
		else {
			request.getRequestDispatcher("/Home.jsp").forward(request, response);
		}
	}

}
