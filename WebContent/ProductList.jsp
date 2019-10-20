<%@ page import="service.DBHandler" %>
<%@ page import="model.Product" %>
<%@ page import="java.util.*" %>
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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<title>Insert title here</title>

<style>
.card .card-content {
    padding: 10px;
}

.card-title {
    margin-bottom: 0;
    
}

.card .card-image .card-title {
padding: 10px;
font-weight: bold;}

.row {
margin: 0;}


.margin {
margin: 5px 10px 0 10px;}

</style>

<!-- <style>
    .card-image {
      height: 150px;


    }

    .card-content {
      height: 100 px;
    }

    .card-content {
      margin-top: 50px;
      margin-bottom: -14px;
    }

    .btn-floating {
      top: 200px;
    }


    body>div:nth-child(2)>div:nth-child(1)>div:nth-child(1)>div:nth-child(1)>a:nth-child(3)>i:nth-child(1) {
      padding-top: z;
    }

    body>div:nth-child(2)>div:nth-child(1)>div:nth-child(1)>div:nth-child(1)>a:nth-child(3) {
      top: 205px;
      margin-left: 0px;
      left: 291px;
    }

    .card-title {
      top: 152.5px;
    }

    div.row:nth-child(1)>div:nth-child(1)>div:nth-child(1)>div:nth-child(2)>p:nth-child(1) {
      margin-top: 30px;
    }

    div.row:nth-child(1)>div:nth-child(1)>div:nth-child(1)>div:nth-child(2)>p:nth-child(1) {
      margin-top: 30px;
    }

    .col-sm-12 {
      top: 15px;
    }
</style> -->
</head>
<body>

<%String loc=request.getParameter("loc");
String cat=request.getParameter("cat");
System.out.println(loc+cat);
DBHandler obj=new DBHandler();
LinkedList<Product> lst=obj.getProductLstByCat(loc, cat);
System.out.println(lst);
/* HttpSession ses=request.getSession(true); 
LinkedList<Product> list=new LinkedList<>(); */


%>
 <div class="row">
 	<% int count=0;
 	for(Product p: lst) {
 		count++;
 	%>
 	
 	
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
 	
 	
 	
 
    <div class="col-sm-12 col-md-6 col-lg-4">
      <div class="card">
        <div class="card-image">
          <img src="assets/foodwaste.png">
          <span class="card-title"><%=p.getDesc() %></span>
          <!-- <a class="btn-floating halfway-fab waves-effect waves-light red"><i class="material-icons">add</i></a> -->
        </div>
        <div class="card-content">
          <div class="row" style="margin-bottom: 0;">
            <div class="col-sm-12 col-xl-12 col-md-12">
              <div class="row"><%=p.getCat() %> </div>
              <div class="row"><%=p.getQtypp() %> </div>
              <div class="row">
              	<div class="col-sm-6 col-lg-6 col-xl-6" style="padding: 0;">
              		<div class="row"><%=p.getEd() %></div>
              		<div class="row">MRP: &nbsp;<strike> Rs.<%=p.getPrice() %></strike> &nbsp; &nbsp;<b>Rs.<%=discountprice %> </b></div>
              
              	</div>
              	
              	<div class="col-sm-6 col-lg-6 col-xl-6" style="padding: 0;">
              	
              		<a  href="AddItemAuth?loc=<%=loc%>&cat=<%=cat%>&srno=<%=p.getSrno()%>&dis=<%=discountprice%>" class="btn float-right" id="<%=count+p.getSrno()%>" >ADD</a>
              		<%System.out.println(" counting"+count+p.getSrno()+" "+count); %>
        			<%-- <button class="btn hidden float-right" id="<%=p.getSrno()%>">-</button>
        			<b class="hidden float-right margin" class="<%=p.getSrno()%>">1</b>
        			<button class="btn hidden float-right" class="<%=p.getSrno()%>">+</button> --%>
              	</div>
              
              </div>		
            </div>
          </div>
        </div>
      </div>
      
    </div>
    
    
    <script>
    
    <%-- var id=false;
    function add<%=count%>()
    {
    	document.getElementById(<%=count+p.getSrno()%>).disabled="true";
    	id=true;
    	
    	
    		<% Product p1=new Product(p.getSrno(), p.getCat(),p.getDesc(),p.getQtypp(),p.getMfd(),p.getEd(),p.getPrice(),p.getQty(),discountprice);
        	list.add(p1);
        	System.out.println(list);
        	%>
  			
    } --%>
    
    
    </script>
    
    
   <%} %> 
    
    
    
    
    
    
    

  </div>
  
  

</body>
</html>