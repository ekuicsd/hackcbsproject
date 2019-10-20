<%@ page import="java.util.*" %>
<%@ page import="model.Product" %>
<%@ page import="service.DBHandler" %>
<%@ page import="java.text.SimpleDateFormat" %>


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

.row {
margin-bottom: 0;}

.col-sm-6, .col-md-6, .col-xl-6 {
padding:0;}

p {
margin-bottom: 5px;}

</style>
</head>
<body>
<%String username=request.getParameter("unm");

DBHandler obj=new DBHandler();
LinkedList<Product> lst=obj.getSellerDashboard(username);

%>


<div class="container-fluid">
	<div class="row" style="padding: 10px;">
	
		<% for(Product p: lst) { %>
		
		
		
		<%
 	Date datemfd=new SimpleDateFormat("MM/dd/yy").parse(p.getMfd());
	Date dateed=new SimpleDateFormat("MM/dd/yy").parse(p.getEd());
	Date now= new Date();
	
	
 	Calendar cal1 = Calendar.getInstance();
	cal1.setTime(datemfd);
	int day1 = cal1.get(Calendar.DAY_OF_MONTH); // 17
	int month1 = cal1.get(Calendar.MONTH);
	int year1 = cal1.get(Calendar.YEAR);
	
	Calendar cal2 = Calendar.getInstance();
	cal2.setTime(dateed);
	int day2 = cal2.get(Calendar.DAY_OF_MONTH); // 17
	int month2 = cal2.get(Calendar.MONTH);
	int year2 = cal2.get(Calendar.YEAR);
 	
 	Calendar cal = Calendar.getInstance();
	cal1.setTime(now);
	int day = cal1.get(Calendar.DAY_OF_MONTH); 
	int month = cal1.get(Calendar.MONTH);
	int year = cal1.get(Calendar.YEAR);
 	
	
	System.out.println(day1+" "+day2+" "+month1+" "+month2+" "+year1+" "+year2);
	System.out.println(day+" "+month+" "+year);
	
	int totalyrdiff=year2-year1;
	int totalmondiff, totalmon=0, totaldaydiff=0;
	if(totalyrdiff==0)
	{
		totalmondiff=month2-month1;
		if(totalmondiff==0)
		{
			totaldaydiff=day2-day1;
		}
		else
		{
			totaldaydiff=day2-day1;
			totalmon=totalmondiff;
		}
	}
	else
	{
		totalmondiff=month2-month1;
		if(totalmondiff>0)
		{
			totalmon=totalyrdiff*12;
			totalmon=totalmon+totalmondiff;
		}
		else {
			totalyrdiff=totalyrdiff-1;
			totalmon=12+totalmondiff;
			totalmon=totalmon+(totalyrdiff*12);
			
			
		}
		totaldaydiff=day;
	}
 	System.out.println(totalmon+" "+totaldaydiff+" "+totalyrdiff);
 	
 	 
 	
 	
 	int ctotalyrdiff=year2-year;
	int ctotalmondiff, ctotalmon=0, ctotaldaydiff=0;
	if(ctotalyrdiff==0)
	{
		ctotalmondiff=month2-month;
		if(ctotalmondiff==0)
		{
			ctotaldaydiff=day2-day;
		}
		else
		{
			ctotaldaydiff=day2-day;
			ctotalmon=ctotalmondiff;
		}
	}
	else
	{
		ctotalmondiff=month2-month;
		if(ctotalmondiff>0)
		{
			ctotalmon=ctotalyrdiff*12;
			ctotalmon=ctotalmon+ctotalmondiff;
		}
		else {
			ctotalyrdiff=ctotalyrdiff-1;
			ctotalmon=12+ctotalmondiff;
			ctotalmon=ctotalmon+(ctotalyrdiff*12);
			
			
		}
		ctotaldaydiff=day;
	}
 	System.out.println(ctotalmon+" "+ctotaldaydiff+" "+ctotalyrdiff);
 	
 	
 	
 	
 	
 	
 	
 	int totalprice=p.getPrice();
 	int discountprice=0;
 	
 	if(totalmon!=0)
 	{
 		double tenperleftmon= 0.1*totalmon;
 		double twentyperleftmon= 0.2*totalmon;
 		double thirtyperleftmon= 0.3*totalmon;
 		System.out.println(tenperleftmon+" "+twentyperleftmon+" "+thirtyperleftmon);
 		
 		if(ctotalmon<=thirtyperleftmon && ctotalmon>=twentyperleftmon)
 		{
 			//discount10%;
 			discountprice=totalprice-((int)(0.1*totalprice));
 			
 		}
 		else if(ctotalmon>=tenperleftmon && ctotalmon<twentyperleftmon)
 		{
 			// discount20%;
 			discountprice=totalprice-((int)(0.2*totalprice));
 		}
 		else if(ctotalmon<tenperleftmon )
 		{
 			//discount30%
 			discountprice=totalprice-((int)(0.3*totalprice));
 		}
 		else {
 			//no discount;
 			discountprice=totalprice-((int)(0.05*totalprice));
 		}	 
 		
 	}
 	
 	else {
 		double tenperleftday= 0.1*totaldaydiff;
 		double twentyperleftday= 0.2*totaldaydiff;
 		double thirtyperleftday= 0.3*totaldaydiff;
 		System.out.println(tenperleftday+" "+twentyperleftday+" "+thirtyperleftday);
 		
 		if(ctotaldaydiff<=thirtyperleftday && ctotaldaydiff>=twentyperleftday)
 		{
 			//discount10%;
 			discountprice=totalprice-((int)(0.1*totalprice));
 			
 		}
 		else if(ctotaldaydiff>=tenperleftday && ctotaldaydiff<twentyperleftday)
 		{
 			// discount20%;
 			discountprice=totalprice-((int)(0.2*totalprice));
 		}
 		else if(ctotaldaydiff<tenperleftday )
 		{
 			//discount30%
 			discountprice=totalprice-((int)(0.3*totalprice));
 		}
 		else {
 			//no discount;
 			discountprice=totalprice-((int)(0.05*totalprice));
 		}	
 	}
 	
 	System.out.println(discountprice);
 	
	 %>
 	
 	
	
		<div class="col-xl-12 col-sm-12 col-md-12" style=" border-bottom: 1px solid gray;">
			<div class="row">
				<div class="col-sm-2 col-md-2 col-xl-2">
					<img class="circle" src="assets/foodwaste.png" height="100px" width="130px">
				</div>
				<div class="col-sm-10 col-md-10 col-xl-10">
					<div class="row">
						<b><%=p.getDesc() %></b>
					</div>
					<div class="row">
						<p><%=p.getQtypp() %></p>
					</div>
					<div class="row">
						<p><%=p.getEd() %></p>
					</div>
					<div class="row">
						<div class="col-sm-6 col-md-6 col-xl-6">
							<p><%=p.getQty() %></p>
						</div>
						<div class="col-sm-6 col-md-6 col-xl-6">
							Rs<strike> <%=p.getPrice()%></strike>&nbsp;<b>Rs<%=discountprice %></b>
						</div>
					</div>
				</div>
			</div> 
		</div>
		
		<%} %>
	</div>
</div>







<div class="container-fluid">
	<div class="row bottom-row" style="width: 100%;">
		<div class="col-xl-3 col-sm-3 col-md-3 text-center">
			<a href="#" >
				<i class="material-icons" style="font-weight: bold">add</i><br>
				<label>Dashboard</label>
			</a>
		</div>
		<div class="col-xl-3 col-sm-3 col-md-3 text-center">
			<a href="addStock.jsp?unm=<%=username %>" >
				<i class="material-icons">add</i><br>
				<label>Add Stock</label>
			</a>
		</div>
		<div class="col-xl-3 col-sm-3 col-md-3 text-center">
			<a href="sellerHistory.jsp" >
				<i class="material-icons">add</i><br>
				<label>History</label>
			</a>
		</div>
		<div class="col-xl-3 col-sm-3 col-md-3 text-center">
			<a href="#" >
				<i class="material-icons">add</i><br>
				<label>Account</label>
			</a>
		</div>
	</div>
</div>



</body>
</html>