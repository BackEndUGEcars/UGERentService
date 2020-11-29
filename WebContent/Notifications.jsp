<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="fr.uge.webservices.App"%>
<%@page import="fr.uge.webservices.AppServiceLocator"%>
<%@page import="fr.uge.webservices.AppSoapBindingStub"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.json.simple.parser.ParseException"%>
<%@page import="org.apache.commons.io.IOUtils"%>
<%@page import="java.util.*"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>UGE - RentYourCar</title>
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css'>
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css'>
<link
	href="https://fonts.googleapis.com/css?family=Alegreya+Sans&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="./style.css">

</head>
<%
if(session.getAttribute("app") == null) {
	App app = (App) new AppServiceLocator().getApp();
	((AppSoapBindingStub) app).setMaintainSession(true);
	session.setAttribute("app", app);	
	if(!app.myConnection()){
		RequestDispatcher rd = request.getRequestDispatcher("Connection.jsp");
		rd.forward(request, response);
	}
}
else {
	App app = (App) session.getAttribute("app");
	if(!app.myConnection()){
		RequestDispatcher rd = request.getRequestDispatcher("Connection.jsp");
		rd.forward(request, response);
	}
}
%>
<body>

	<script type="text/javascript">
	
	</script>
	<!-- partial:index.partial.html -->
	<div id="viewport">
		<!-- Sidebar -->
		<div id="sidebar">
			<header>
				<a href="Home.jsp">UGE CAR RENT</a>
			</header>
			<ul class="nav">
				<li><a href="Cart.jsp"> <i
						class="zmdi zmdi-shopping-basket"></i> Basket
				</a></li>
				<li><a href="Notifications.jsp"> <i
						class="<% App app = (App) session.getAttribute("app");
						if(app.getNotifications().equals("{    \"notifications\":[]}")) out.print("zmdi zmdi-notifications");
						else out.print("zmdi zmdi-notifications-active");
								%>"></i> Notifications
				</a></li>
				<li><a href="MyRentedCars.jsp"> <i class="zmdi zmdi-car"></i>
						My Cars
				</a></li>
				<li><a href="About.jsp"> <i class="zmdi zmdi-info-outline"></i>
						About
				</a></li>
				<li><a href="Contacts.jsp"> <i class="zmdi zmdi-comment-more"></i>
						Contact
				</a></li>
			</ul>
		</div>
		<!-- Content -->
		<div id="content">
			<div class="container-fluid">
				<div class="wrapper">
					<h2>
						<strong>Notifications</strong>
					</h2>
					<div class="cards">
					<%
					String json = app.getNotifications();
			        JSONParser parser = new JSONParser();

			        JSONObject jsonObject = (JSONObject) parser.parse(json);
			        JSONArray notifs = (JSONArray) jsonObject.get("notifications");
			        Iterator iterator = notifs.iterator();
			        int i = 0;
			        while (iterator.hasNext()) {
			        	i++;
			        	
			            String s = iterator.next().toString();
			            JSONObject jo = (JSONObject) parser.parse(s);
			            %>
			            <figure class="card">
			            	<img src="<%
			            	out.print(jo.get("imagePath"));
			            	%>"/>
			            	<figcaption>
								<div>
									<strong> <% out.print(jo.get("notification")); %> </strong>
								</div>
								<div class="special-div">
									<form action="${pageContext.request.contextPath}/clearNotification"
										method="post">
										<button type="submit" name="clearNotifButton" value="<%out.print(jo.get("carID"));%>" 
											style="background-color: #171c8f" class="btn btn-dark">
											<strong>Clear</strong>
										</button>
									</form>
								</div>
							</figcaption>
						</figure>
					<%
			        }
			        if (i == 0) {
                        out.println("</div><div class=\"wrapper\">\n" +
                                "\t\t\t\t\t<h3 style=\"text-align: center; color: #ccc;\">Oops, you don't have any notifications </h3>\n" +
                                "\t\t\t\t\t<div\n" +
                                "\t\t\t\t\t\tstyle=\"margin: auto; text-align: center; height: 30%; width: 50%;\"\n" +
                                "\t\t\t\t\t\tclass=\"wrapper\">\n" +
                                "\t\t\t\t\t\t<form class=\"form-signin\" action=\"Home.jsp\">\n" +
                                "\t\t\t\t\t\t\t<button\n" +
                                "\t\t\t\t\t\t\t\tstyle=\"color: #fff; background-color: #171c8f; border-color: #171c8f;\"\n" +
                                "\t\t\t\t\t\t\t\tclass=\"btn btn-lg btn-primary btn-block\" type=\"submit\">Back to home</button>\n" +
                                "\t\t\t\t\t\t</form>\n" +
                                "\t\t\t\t\t</div>\n" +
                                "\t\t\t\t</div>");
                    }
					%>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
