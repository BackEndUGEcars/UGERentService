<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
}
%>
<body>

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
						<strong>Contact</strong>
					</h2>
					<h3 style="text-align: center; color: #ccc;"><strong>Contacts</strong><br> Pierre-Jean Besnard - pbesna01@etud.u-pem.fr<br> Louis Billaut - lbillaut@etud.u-pem.fr<br> Armand Liegey - aliegey@etud.u-pem.fr</h3>
					<div
						style="margin: auto; text-align: center; height: 30%; width: 50%;"
						class="wrapper">
						<form class="form-signin" action="Home.jsp" method="post">
							<button
								style="color: #fff; background-color: #171c8f; border-color: #171c8f;"
								class="btn btn-lg btn-primary btn-block" type="submit">Return home</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>