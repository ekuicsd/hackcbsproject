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

label {
font-size: 15px;
margin-bottom: 0;}


input[type=text]:not(.browser-default), input[type=password]:not(.browser-default) {
font-size: 14px;
height: 2.5rem;
margin-bottom: 15px;}



</style>

</head>
<body>

<div class="container-fluid bg">
	<div class="row box" >
		<div class="col-xl-12 col-md-12 col-sm-12">
		
		<form action="sellerLoginAuth" method="post">
			<label>Username: </label>
			<input type="text" name="username" placeholder="enter phone no" required >
			<br>
			<label>Password: </label>
			<input type="password" name="password" placeholder="enter password" required>
			<br>
			<input class="btn btn-success" type="submit" name="login" value="Login">
			<br>
			<a href="sellerSignup.jsp">Create new account</a>
		</form> 
		</div>
	</div>
</div>

</body>
</html>