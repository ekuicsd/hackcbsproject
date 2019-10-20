<%@ page import="service.DBHandler" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="materialize-v1.0.0/materialize/css/materialize.min.css"  media="screen,projection"/>
<script type="text/javascript" src="materialize-v1.0.0/materialize/js/materialize.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="materialize-v1.0.0/materialize/js/materialize.min.js"></script>
<!-- <script type="text/javascript" src="pickadate.js-gh-pages/vendor/jquery/dist/jquery.min.js"></script>
<script type="text/javascript" src="pickadate.js-gh-pages/vendor/pickadate/lib/picker.date.js"></script>
 -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />
  <script src="http://code.jquery.com/jquery-1.8.3.js"></script>
  <script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
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
        padding: 20px;
        border: 2px solid black;
        }
        
        

</style>
</head>
<body>

<%DBHandler obj=new DBHandler();
int id=obj.getMaxProdId();
String username=request.getParameter("unm");%>


<div class="container-fluid bg">
	<div class="row box">
		<div class="col-xl-12 col-md-12 col-sm-12">
		<form action="addStockAuth?unm=<%=username %>" method="post">
			<label class="hidden">Serial no: </label>
			<input class="hidden" type="text" name="srno" value="<%=id%>">
			<br>
			<label>Category : </label><span>
			  <select class="browser-default input " name="cat" required">
			    <option value="" disabled selected>Choose Category</option>
			    <option value="milk">Milk</option>
			    <option value="softdrinks">Soft drinks</option>
			    <option value="juices">Juices</option>
			    <option value="bread">Bread</option>
			    <option value="egg">Egg</option>
			  </select></span>
			<br>
			<label>Company name: </label>
			<input type="text" name="name">
			<br>
			<label>Quantity of Packet: </label>
			<input type="text" name="qtypp">
			<br>
			<label>Manufactured Date:</label>
			<input type="text" class="datepicker" name="mfd" required/>
			<br>
			<label>Expiry Date: </label>
			<input type="text" class="datepicker" name="ed" required/>
			<br>
			<label>Price</label>
			<input type="text" name="price" required>
			<br>
			<label>Quantity:</label>
			<input type="number" name="qty" required>
			<br>
			<button type="submit" class="btn">Add</button>
		</form>
		</div>
	</div> 
</div>


<script>

$(function() {
    $( ".datepicker" ).datepicker();
});
</script>


</body>
</html>