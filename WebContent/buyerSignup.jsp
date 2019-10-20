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
.bg {
	
  width: 100%;  
  min-height: 100vh;
  display: -webkit-box;
  display: -webkit-flex;
  display: -moz-box;
  display: -ms-flexbox;
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  align-items: center;
  background-color: white;
  margin: 0;
 /*  background-image: linear-gradient(rgb(230,230,230),rgb(255,255,255)); */
}

.box {
	border: 1px solid black;
	padding: 20px;
}
</style>
</head>
<body>
<%String loc=request.getParameter("loc");
String cat=request.getParameter("cat");%>

<div class="container-fluid bg">
	<div class="row box">
		<div class="col-xl-12 col-md-12 col-sm-12">
		<form action="buyerSigupAuth?loc=<%=loc %>&cat=<%=cat%>" method="post">
			<label>Full Name: </label>
			<input type="text" name="name" placeholder="enter your name">
			<br>
			<label>Contact no: </label>
			<input type="text" name="phone" placeholder="enter your phone no">
			<br>
			<label>Password: </label>
			<input type="password" name="pwd" placeholder="enter password">
			<br>
			<label>Email: </label>
			<input type="email" name="email" placeholder="enter your email">
			<br>
			<label>City: </label>
			<input type="text" name="city" placeholder="enter your city">
			<br>
			<input class="btn btn-success" type="submit" name="signup" value="Sign up">
		</form>
		</div>
	</div>
</div>

</body>
</html>