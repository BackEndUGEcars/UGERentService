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
						<strong>Return car</strong>
					</h2>
					<h3 style="text-align: center; color: #ccc;">Please fill this
						quick form</h3>
					<form action="${pageContext.request.contextPath}/form"
						method="post">
						<div
							style="margin: auto; text-align: center; height: 30%; width: 50%;"
							class="wrapper">
							<label for="note-select" style="color: white">Add a note:</label>
							<select name="notes" id="note-select">
								<option value="0">0</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
								<option value="13">13</option>
								<option value="14">14</option>
								<option value="15">15</option>
								<option value="16">16</option>
								<option value="17">17</option>
								<option value="18">18</option>
								<option value="19">19</option>
								<option value="20">20</option>
							</select>
						</div>
						<div
							style="margin: auto; text-align: center; height: 30%; width: 50%;"
							class="wrapper">
							<label for="cleanlinessNote-select" style="color: white">Add
								a cleanliness note:</label> <select name="cleanlinessNotes"
								id="cleanlinessNote-select">
								<option value="0">0</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
								<option value="13">13</option>
								<option value="14">14</option>
								<option value="15">15</option>
								<option value="16">16</option>
								<option value="17">17</option>
								<option value="18">18</option>
								<option value="19">19</option>
								<option value="20">20</option>
							</select>
						</div>
						<button name="submitFormButton"
							style="margin: auto; color: #fff; background-color: #171c8f; border-color: #171c8f; height: 30%; width: 50%;"
							value="<%out.print(session.getAttribute("carToReturn"));%>"
							class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
