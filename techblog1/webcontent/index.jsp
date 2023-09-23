<%@page import="com.tech.blog.helper.connectionprovider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.sql.*" %>
 <%@page import="com.tech.blog.helper.connectionprovider" %>
 
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <title>Tech Blog</title>
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
<div class="container-fluid p-0 m-0">
<div class="jumbotron primary-background text-white banner-background">
<div class="container">
<h3 class="display-3">Welcome to Tech Blog</h3>
<p>Welcome to tech blog , world of technology</p>
<p>A tech blog will give you the perfect platform to
 show others your point of view and share your journey or 
 experience with tech. You’ll also be able to connect with
  other tech lovers and create an engaged community of
 friends to whom you can recommend tech products and advice.</p>
 <p>Tons of people enjoy reading tech blogs on a daily basis.
  The niche continues to grow with each passing year,which is 
  why it’s such a great idea to start a tech blog in 2023.</p>
  <button class="btn btn-outline-light btn-lg"><span class="fa fa-certificate fa-spin"></span> Start your journey!</button>
<a href="loginpage.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-circle-o fa-spin"></span>  Login</a>
</div>
</div>
</div>
<div class="container">
<div class="row m-2">
<div class="col-md-4">
<div class="card" >
  <div class="card-body">
    <h5 class="card-title">java</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary text-white">read more</a>
  </div>
</div>
</div>
<div class="col-md-4">
<div class="card" >
  <div class="card-body">
    <h5 class="card-title">java</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary text-white">read more</a>
  </div>
</div>
</div>
<div class="col-md-4">
<div class="card" >
  <div class="card-body">
    <h5 class="card-title">java</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary text-white">read more</a>
  </div>
</div>
</div>
</div>

<div class="row m-2">
<div class="col-md-4">
<div class="card" >
  <div class="card-body">
    <h5 class="card-title">java</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary text-white">read more</a>
  </div>
</div>
</div>
<div class="col-md-4">
<div class="card" >
  <div class="card-body">
    <h5 class="card-title">java</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary text-white">read more</a>
  </div>
</div>
</div>
<div class="col-md-4">
<div class="card" >
  <div class="card-body">
    <h5 class="card-title">java</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary text-white">read more</a>
  </div>
</div>
</div>
</div>
</div>



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