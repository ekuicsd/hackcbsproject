<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link type="text/css" rel="stylesheet" href="materialize-v1.0.0/materialize/css/materialize.min.css"  media="screen,projection"/>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">

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

        .center {
            margin: auto;
            width: auto;
            border: 3px solid rgb(117, 117, 117);
            padding: 20px;
        }

        .col-sm-12>h1:nth-child(1) {
            margin-top: -0.2rem;
            padding-bottom: 42px;
        }

        .btn {
            font-size: 20px;
        }

        .col-sm-12>h4:nth-child(1) {
            margin-top: -0.48rem;
            padding-top: 2px;
            margin-bottom: 3.912rem;
        }
    </style>

</head>
<body>
<% HttpSession ses=request.getSession();
session.setAttribute("buyerunm", "nil");%>



 <div class="container-fluid bg">
        <div class="row">
            <div class="center">

                <div class="col-sm-12 col-xl-12 col-md-12">
                    <h4>
                        Are You A ?
                    </h4>
                    	<a href="sellerLoginPage.jsp">
                        <button type="button" class="btn btn-block"
                            class="waves-effect waves-light btn-large">
                            Seller
                        </button>
                    	</a>
                    	<br>
                    	<a href="buyer.jsp">
                        <button type="button" class="btn btn-block"
                            class="waves-effect waves-light btn-large">Buyer</button>
                    	</a>
                </div>
            </div>


        </div>
</div>

<!-- <div class="container-fluid bg">

	

	
</div>
 -->
<!-- <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <a class="navbar-brand" href="#">Navbar</a>

  <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="sellerLoginPage.jsp">Seller</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="buyer.jsp" tabindex="-1" aria-disabled="true">Buyer</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0" action="searchAuth" method="post">
      <input class="form-control mr-sm-2" type="search" placeholder="Search by items.." name="search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>

<div class="container-fluid">

<div class="row" style="height: 60vh;">
	<img src="assets/foodwaste.png" style="height: 60vh; width: 100%">
</div>
</div> -->
</body>
</html>


