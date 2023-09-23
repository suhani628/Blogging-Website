<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.sql.*" %>
 <%@page import="com.tech.blog.helper.connectionprovider" %>
  <%@page import="com.tech.blog.entities.message" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
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
<%@include file="normalnavbar.jsp" %>
 <main class="d-flex align-item-center primary-background banner-background" style="height:80vh;" >
 <div class="container" >
 <div class="row">
 <div class="col-md-4 offset-md-4">
 <div class="card">
 <div class="card-header primary-background text-white text-center">
 <span class="fa fa-user-circle-o fa-3x"></span>
 <br><p>Login Here</p>
 </div>
 
 <%
 message m=(message)session.getAttribute("msg");
 if(m!=null){
	 %>
	 <div class="alert <%= m.getCssClass() %>" role="alert">
 <%= m.getContent() %>
</div>
	 <% 
	 session.removeAttribute("msg");
 }
 %>
 
 <div class="card-body">
  <form action="loginservlet" method="post">
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Email address</label>
    <input name="email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <input name="password" required type="password" class="form-control" id="exampleInputPassword1">
  </div>
  <div class="container text-center">
   <button type="submit" class="btn btn-primary">Submit</button>
   </div>
 
</form>
 </div>
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
</body>
</html>