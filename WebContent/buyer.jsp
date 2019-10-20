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
        
    .btn {
     padding: 5px 27px;
     height: 45px;
     }
     
     .modal {
     width: 50%;
     padding-right: 0;
     height: 45%;}  
     
     .modal-dialog {
     width: 100%;
     margin: 0;
     height: 100%;}

	.modal-content {
	border: 0;}
	
	.modal-open .modal {
    overflow-y: hidden;
}

@media only screen and (max-width: 992px)
.modal {
    width: 80%;
}

</style>

</head>
<body>
<div class="container-fluid bg">
	<div class="row">
		<div class="col-xl-12 col-sm-12 col-md-12">
		<!-- <a class="waves-effect waves-light btn modal-trigger" href="#modal1">Add Location</a> -->
		<button type="button" class="btn" data-toggle="modal" data-target="#myModal">Add Location</button>
			<!-- <button class="btn ">Add Location</button> -->
			
			<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog" style="padding-right :0px">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          
          <h5 class="modal-title">Enter Your City...</h5>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <form action="bcategory.jsp" method="post">
        <div class="modal-body">
          
          <input type="text" name="loc">
          
        </div>
        <div class="modal-footer">
          <input type="submit" class="btn" value="Go">
          </div>
          </form>
        
      </div>
      
    </div>
  </div>
</div>
			
		</div>
	
  </div>
  
  <script>
  
  
  </script>
  
</body>
</html>