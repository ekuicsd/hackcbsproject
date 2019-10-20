<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="service.DBHandler" %>
<%@ page import="java.util.*" %>
<%@ page import="model.SoldItem" %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="materialize-v1.0.0/materialize/css/materialize.min.css"  media="screen,projection"/>
<title>Insert title here</title>

<style>
	.row {
margin-bottom: 0;}

.col-sm-6, .col-md-6, .col-xl-6 {
padding:0;}

p {
margin-bottom: 5px;}

</style>
</head>
<body>
<%HttpSession ses=request.getSession();
String unm=(String)ses.getAttribute("sellerunm");
DBHandler obj= new DBHandler();
//


LinkedList<SoldItem> lst=obj.getSellerHistory(unm);
%>

<div class="container-fluid">
	<div class="row" style="padding: 10px;">
	
		<% for(SoldItem p: lst) { %>
		
		<div class="col-xl-12 col-sm-12 col-md-12" style=" border-bottom: 1px solid gray;">
			<div class="row">
				<div class="col-sm-2 col-md-2 col-xl-2">
					<img class="circle" src="assets/foodwaste.png" height="100px" width="130px">
				</div>
				<div class="col-sm-10 col-md-10 col-xl-10">
					<div class="row">
						<b><%=p.getName() %></b>
					</div>
					<div class="row">
						<p><%=p.getIqty() %></p>
					</div>
					
					<div class="row">
						<div class="col-sm-6 col-md-6 col-xl-6">
							<p><%=p.getBdate() %></p>
						</div>
						<div class="col-sm-6 col-md-6 col-xl-6">
							Rs<b> <%=p.getDisprice()%></b>
						</div>
					</div>
				</div>
			</div> 
		</div>
		
		<%} %>
	</div>
</div>


		

</body>
</html>