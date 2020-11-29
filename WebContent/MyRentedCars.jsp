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
						<strong>My Cars</strong>
					</h2>
					<div class="cards">
					<%
					String json = app.getMyCars();
			        JSONParser parser = new JSONParser();


			        JSONObject jsonObject = (JSONObject) parser.parse(json);
			        JSONArray cars = (JSONArray) jsonObject.get("car");
			        if(cars != null) {
			        	Iterator iterator = cars.iterator();
				        while (iterator.hasNext()) {
				        	
				            String s = iterator.next().toString();
				            JSONObject jo = (JSONObject) parser.parse(s);        
			            %>
			            <figure class="card">
			            	<img src="<%out.print(jo.get("imagePath"));%>"/>
			            	<figcaption>
								<div>
									<strong> <% out.print(jo.get("model")); %> </strong>
								</div>
								<div class="special-div">
									<form action="${pageContext.request.contextPath}/returnCar"
										method="post">
										<button type="submit" name="returnCarButton" value="<%out.print(jo.get("id"));%>" 
											style="background-color: #171c8f" class="btn btn-dark">
											<strong>Return</strong>
										</button>
									</form>
								</div>
							</figcaption>
						</figure>
					<%
			        }
			        }
					%>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
