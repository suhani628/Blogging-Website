<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="java.sql.*" %>
 <%@page import="com.tech.blog.helper.connectionprovider" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register page</title>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
 <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
 <title>Bootstrap Example</title>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
<link href="css/mystyle.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.banner-background{clip-path: polygon(0 0, 100% 0, 100% 33%, 100% 96%, 68% 88%, 35% 100%, 0 88%, 0% 30%);}
</style>
<meta charset="UTF-8">
</head>
<body>
<%@include  file="normalnavbar.jsp" %>

<main class=" banner-background primary-background  " style="padding-bottom:80px;">
<div class="conatiner" style="margin-bottom:100px;">
<div class="col-md-4 offset-md-4">
<div class= "card">
<div class="card-header text-center  primary-background text-white" >
<span class="fa fa-user-plus fa-3x"></span>
<br><p>Register Here</p>
</div>
<div class="card-body">
<form  id="regform" action="registerservlet" method="POST">
  <div class="mb-3">
    <label for="exampleInputUsername" class="form-label">User Name</label>
    <input name="username" type="text" class="form-control" id="exampleInputUsername" aria-describedby="emailHelp" placeholder="User Name">
  </div>
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Email address</label>
    <input name="useremail" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <input name="userpassword" type="password" class="form-control" id="exampleInputPassword1">
  </div>
   <div class="mb-3">
    <label for="exampleInputGender" class="form-label">Select Gender</label>
    <br>
    <input type="radio" id="exampleInputGender" name="exampleInputGender" value="female" >Female
    <input type="radio" id="exampleInputGender" name="exampleInputGender" value="male"  >Male
  </div>
  <div class="formgroup">
  <textarea name="about" class="form-control" id="" rows="5" placeholder="Enter something about yourself"></textarea></div>
  <div class="mb-3 form-check">
    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Agree terms and condition</label>
  </div><br>
  <div class="container text-center" id="loader" style="display:none;">
   <span class="fa fa-refresh fa-spin fa-3x"></span><br>
   <h4>Please wait...</h4>
  </div>
  <button id="submitbtn" type="submit" class="btn btn-primary">Submit</button>
</form>
</div>
</div>
</div>
</div>
</main>

<%
Connection con = connectionprovider.getConnection();
%>
<script
  src="https://code.jquery.com/jquery-3.7.0.min.js"
  integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
  crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="js/myjs.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script>
$(document).ready(function(){
	console.log("loaded.....")
	$('#regform').on('submit',function(event){
		event.preventDefault();
		let form =new FormData(this);
		$("#submitbtn").hide();
		$("#loader").show();
		//send register servlet
		$.ajax({
			url:"registerservlet",
			type: 'POST',
			data: form,
			success: function(data,textStatus,jqXHR){
      				console.log(data)
      				$("#submitbtn").show();
      				$("#loader").hide();
      				if(data.trim()==='done'){
      					swal("Registered successfully... We are going to  redirect to login page.")
          				.then((value) => {
          				 window.location="loginpage.jsp"
          				});
      				}else{
      					swal(data)
      				}
			},
		error: function(jqXHR, textStatus, errorThrown){
			console.log(jqXHR);
			$("#submitbtn").show();
				$("#loader").hide();
			swal("Something went wrong,Ty again.")
		},
		processData: false,
		contentType: false
		});
	});
});
</script>
</body>
</html>