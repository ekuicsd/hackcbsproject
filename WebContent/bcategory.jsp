<%@ page import="model.Product" %>
<%@ page import="java.util.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="materialize-v1.0.0/materialize/css/materialize.min.css"  media="screen,projection"/>
<script type="text/javascript" src="materialize-v1.0.0/materialize/js/materialize.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
.bottom-row {
bottom: 0;
position: fixed;}

.col-sm-3, .col-xl-3, .col-md-3 {
padding-right: 10px;
padding-left: 10px;
width: 22%;
/* border: 1px solid black; */}


li {
border-bottom:1px solid black;
padding:20px;
font-size:30px;
}
.item0 {
margin-right:30px;
}

</style>

</head>
<body>
<%String loc=request.getParameter("loc");
System.out.println(loc);
HttpSession ses=request.getSession();
LinkedList<Product> lst=new LinkedList<>();
session.setAttribute("cartlist", lst);
%>


<div class="container-fluid">
	<h5>Shop By Category...</h5>
	
	
	
	
	<ul>
	 <li>
	 	<a href="ProductList.jsp?loc=<%=loc%>&cat=milk">
  		<i class="material-icons item0">delete</i>
		Milk</a>  
	 </li>
	 <li>
	 	<a href="ProductList.jsp?loc=<%=loc%>&cat=softdrink">
  		<i class="material-icons item0">error</i>
	 	Soft Drink</a> 
	 </li>
	 <li>
	 	<a href="ProductList.jsp?loc=<%=loc%>&cat=juice">	 
  		<i class="material-icons item0">hourglass_full</i>
  		Juice</a> 
	 </li>
	 <li>
	 	<a href="ProductList.jsp?loc=<%=loc%>&cat=bread">	 
  		<i class="material-icons item0">image_aspect_ratio</i>
		Bread</a> 
	 </li>
	 <li>
	 	<a href="ProductList.jsp?loc=<%=loc%>&cat=egg">
	 	<i class="material-icons item0">local_bar</i>
	 	Egg</a> 
	 </li>
	 
	
 </ul> 

</div>






<div class="nav">
	<div class="row bottom-row" style="width: 100%;">
		<div class="col-xl-3 col-sm-3 col-md-3 text-center">
			<a href="#" >
				<i class="material-icons" style="font-weight: bold">add</i><br>
				<label>Categories</label>
			</a>
		</div>
		<div class="col-xl-3 col-sm-3 col-md-3 text-center">
			<a href="#" >
				<i class="material-icons">add</i><br>
				<label>yur orders</label>
			</a>
		</div>
		<div class="col-xl-3 col-sm-3 col-md-3 text-center">
			<a href="#" >
				<i class="material-icons">add</i><br>
				<label>account</label>
			</a>
		</div>
		<div class="col-xl-3 col-sm-3 col-md-3 text-center">
			<a href="#" >
				<i class="material-icons">add</i><br>
				<label>cart</label>
			</a>
		</div>
	</div>
</div>

</body>
</html>
























<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="materialize-v1.0.0/materialize/css/materialize.min.css" media="screen,projection"/>
 <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<title>Insert title here</title>
<style>
li {
border:1px solid black;
padding:20px;
font-size:70px;
height:10vh;
margin-left:20px;
}
.item0,.item1,.item2,.item3,.item4 {
margin-left:30px;
}
</style>
</head>
<body>

<div class="container-fluid">
	<h1><b>Shop By Category...</b></h1>
	<ul> <h4>
	 <li>
	 
  <i class="material-icons"> <br> <br>delete</i>
	<a class="item0" href="link here">milk</a>  
	 </li>
	 <li>
	 
  <i class="material-icons"><br> <br>error</i>
	 <a class="item1" href="link here">cold drink</a> 
	 </li>
	 <li>
	 
  <i class="material-icons"><br> <br>hourglass_full</i>
  <a class="item2" href="link here">juice</a> 
	
	 </li>
	 <li>
	 
  <i class="material-icons"><br> <br> image_aspect_ratio</i>
	<a class="item3" href="link here">bread</a> 
	 </li>
	 <li>
	 <i class="material-icons"><br> <br>local_bar</i>
	 <a class="item4" href="link here">Sauce</a> 

	 </li>
	</h4>
 </ul> 

</div>

</body>
</html> --%>