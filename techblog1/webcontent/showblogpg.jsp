<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.tech.blog.entities.user" %>
 <%@page errorPage="errorpage.jsp" %>
 <%@page import="com.tech.blog.dao.postdao" %>
  <%@page import="com.tech.blog.dao.likedao" %>
  <%@page import="com.tech.blog.dao.userdao" %>
  <%@page import="com.tech.blog.helper.connectionprovider" %>
 <%@page import="com.tech.blog.entities.post" %>
 <%@page import="com.tech.blog.entities.category" %>
 <%@page import="com.tech.blog.entities.message" %>
 <%@page import=" java.util.ArrayList" %>
 <%@page import="  java.text.DateFormat" %>

 
 
 <%
    user user =(user)session.getAttribute("currentUser");
    if(user==null){
	response.sendRedirect("loginpage.jsp");
    }
    %>
 <% int postid=Integer.parseInt(request.getParameter("post_id"));
 postdao d1=new postdao(connectionprovider.getConnection());
 post p=d1.getpostbypostid(postid);
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
 <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
<link href="css/mystyle.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body{
background:url(img/bg.jpg);backround-size:cover;
background-attachment:fixed;
}
.banner-background{clip-path: polygon(0 0, 100% 0, 100% 33%, 100% 96%, 68% 88%, 35% 100%, 0 88%, 0% 30%);}
.ptitle{ font-weight:100; font-size:30px;}
.pcontent{ font-weight:100; font-size:25px; }
.pdate{font-style:italic;font-weight:bold; font-size:x-small;padding:none;}
.userd{font-size:15px; color:black;font-weight:500;}
.rowuser{border:1px solid #e2e2e2 ; margin:0px;padding-top:10px; width:100%; }
</style>
<title><%= p.getPtitle()  %></title>

</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark primary-background">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp"><span class="fa fa-group"></span>&nbsp;Tech Blog</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="profilepage.jsp"><span class="	fa fa-globe"></span>&nbsp;Discover</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="#"><span class="fa fa-address-book"></span>&nbsp;Contact</a>
        </li>
         <li class="nav-item">
          <a class="nav-link active" href="#" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-plus-square"></span>&nbsp;Add Post</a>
        </li>
         
        <li class="nav-item dropdown">
          <a class="nav-link active dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
           <span class="	fa fa-navicon"></span>&nbsp;Categories
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li>
      </ul>
       
      <ul  class="navbar-nav me-right ">
      <li class="nav-item">
          <a class="nav-link active navbar-brand" href="#!" data-toggle="modal" data-target="#profilemodal" ><span style="align-item:center; "><img src="pics/<%= user.getProfile() %>" class="img-fluid" style="border-radius:50%; max-width:40px;align-items:center;" ></span>&nbsp;&nbsp;<%= user.getName() %></a>
        </li>
      
      <li class="nav-item">
          <a class="nav-link active" href="logoutservlet"><span class="fa fa-user-times "></span>&nbsp;Log out</a>
        </li>
      </ul>
      
    </div>
  </div>
</nav>
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
<!-- main body -->
  <div class="conatiner" style="padding-left:15%;padding-right:15%;">
  <div class="row my-4">
  <div class="col-md-6 offset-md-3">
  <div class="card " >
  <div class="card-header">
  <h4 class="ptitle"><%= p.getPtitle() %></h4>
  </div>
  
  <div class="card-body" style="padding:5px;">
     <img class="card-img-top" src="blog_pics/<%=p.getPpic() %>" alt="Card image cap">
  
  <div class="row my-3 rowuser">
  <div class="col-md-8">
  <% userdao ud=new userdao(connectionprovider.getConnection()); %>
  <p class="userd"> Posted by: <a class="userd" href="#"> <%= ud.getuserbyuserid(p.getUserid()).getName() %></a></p>
  </div>
  <div class="col-md-4">
  <p class="pdate"><%=  DateFormat.getDateTimeInstance().format(p.getPdate()) %></p>
  </div> 
  </div>
  <p class="pcontent"><%= p.getPcontent() %></p>
  <br><br>
  <div class="pcode">
  <pre><%= p.getPcode()%>
  </pre>
  </div>
  </div>
  <div class="card-footer primary-background text-center">
   <%
   likedao ld=new likedao(connectionprovider.getConnection());
   %>
   <a href="#!" onclick="dolike(<%= p.getPid() %>,<%= user.getId() %>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="likecounter"><%= ld.countlikeonpost(p.getPid()) %></span></a>
  </div>
 
  </div>
  </div>
  </div>
  </div>
  </div>

<!-- profile modal -->

<div class="modal fade" id="profilemodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header primary-background text-white text-center" >
        <h5 class="modal-title" id="exampleModalLabel">Tech blog</h5>
        
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div class="container text-center">
      <img src="pics/<%= user.getProfile() %>" class="img-fluid" style="border-radius:50%; max-width:150px;">
      <br>
         <h5 class="modal-title mt-3" id="exampleModalLabel"><%= user.getName()%></h5>
        <div id="profiledetail">
         <!-- table -->
         <table class="table">
  <tbody>
    <tr>
      <th scope="row" >ID :</th>
      <td><%= user.getId() %></td>
    </tr>
    <tr>
      <th scope="row">Email :</th>
      <td><%= user.getEmail() %></td>
    </tr>
    <tr>
      <th scope="row">Gender :</th>
      <td><%= user.getGender() %></td>
    </tr>
     <tr>
      <th scope="row">About :</th>
      <td><%= user.getAbout() %></td>
    </tr>
     <tr>
      <th scope="row">Registered on :</th>
      <td><%= user.getRdate().toString() %></td>
    </tr>
  </tbody>
</table>
</div>

<!-- profile edit -->
<div id="profileedit" style="display:none;">
<h3 class="mt-2">Please Edit Carefully</h3>
<form action="editservlet"  method="post" enctype="multipart/form-data">
<table class="table">
<tr>
<th scope="row" >ID :</th>
<td><%= user.getId() %></td>
</tr>
<tr>
<th scope="row" >User Name :</th>
<td><input type="text" class="form-control" name="username" value="<%= user.getName() %>"></td>
</tr>
<tr>
<th scope="row" >Email :</th>
<td><input type="email" class="form-control" name="useremail" value="<%= user.getEmail() %>"></td>
</tr>
<tr>
<th scope="row" >Password :</th>
<td><input type="password" class="form-control" name="userpassword" value="<%= user.getPassword() %>"></td>
</tr>
<tr>
<th scope="row" >Gender :</th>
<td><%= user.getGender().toUpperCase() %></td>
</tr>
<tr>
<th scope="row" >About :</th>
<td>
<textarea class="form-control" name="userabout" rows="3" >
<%= user.getAbout() %>
</textarea></td>
</tr>
<tr>
<th scope="row" >New Profile Picture :</th>
<td><input type="file" name="image" class="form-control"></td>
</tr>
</table>
<div class="container">
<button type="submit" class="btn btn-outline-primary " id="edit" style="background-color: #BA68C8; color: white; border-color:#BA68C8">Save</button>
</div>
</form>
</div>
      </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary primary-background" data-dismiss="modal" style="border-color:#BA68C8">Close</button>
        <button id="editprofile" type="button" class="btn btn-primary primary-background" style="border-color:#BA68C8">Edit</button>
      </div>
    </div>
  </div>
</div>

<!-- post modal -->
<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Post Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="addpostform" action="addpostservlet" method="post" enctype="multipart/form-data">
        <div class="form-group">
         <select  class="form-control" name="cid" required>
        <option >---Select Category---<option>
         <% postdao postd=new postdao(connectionprovider.getConnection());
           ArrayList<category> list=postd.getAllCategories();
           for(category c:list){
        	%>   
        	<option value="<%= c.getCid() %>"><%=  c.getName() %><option>         
           <%
           }
           %>
         </select>
         
        </div>
       
        <div class="form-group">
        <input type="text" name="posttitle" placeholder="Enter post Title" class="form-control" required>
        </div>
        <div class="form-group">
        <textarea name="pcontent" class="form-control" style="height:200px;" placeholder="Enter your Content"></textarea>
        </div>
        <div class="form-group">
        <textarea name="pcode" class="form-control" style="height:200px;" placeholder="Enter your Code(if any)"></textarea>
        </div>
        <div class="form-group">
        <label >Select your image </label> &nbsp;&nbsp;
       <input name="ppic" type="file" >
        </div>
        <div class="container text-center" >
        <button type="submit" class="btn btn-outline-primary">Post</button>
        
        </div>
        </form>
      </div>
    </div>
  </div>
</div>

<script
  src="https://code.jquery.com/jquery-3.7.0.min.js"
  integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
  crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="js/myjs.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" ></script>


<script>
$(document).ready(function(){
	let editStatus=false;
	
	$('#editprofile').click(function(){
	if(editStatus==false){
		$('#profiledetail').hide()
		$('#profileedit').show()
			editStatus=true;
		$(this).text("back")
	}else{
		$('#profiledetail').show()
		$('#profileedit').hide()
			editStatus=false;
		$(this).text("Edit")
	}
	})
	
});
</script> 

<!--add post js-->
<Script>
$(document).ready(function(e){

	$("#addpostform").on("submit",function(event){
	event.preventDefault();
	console.log("123456789")
	let form=new FormData(this);
	$ .ajax({
		url:"addpostservlet",
		type:'POST',
		data: form,
		success: function(data,textStatus,jqXHR){
		console.log(data);
		var str=data.trim();
		if(str === "done")
		{
			swal("Good job!", "Posted Successfully!", "success");
		}else
		{
			swal("Error!", "Something went wrong! Try again...", "error");
			console.log(data);

		}
		},
		
		error: function(jqXHR,textStatus,errorThrown){
			swal("Error!", "Something went wrong! Try again...", "error");

		},
		processData: false,
		contentType: false
	})
	})
})
</Script>
<Script>
function dolike(pid,uid){
	console.log(pid+"---"+uid)
	const d={
		uid:uid,
		pid:pid,
		operation:'like'
	}
		$.ajax({
			url:"likeservlet",
            data: d,
			success:function(data,textStatus,jqXHR){
				console.log(data);
				if(data.trim()=='true'){
					let c=$(".likecounter").html();
					c++;
					$('.likecounter').html(c);
					data='false';
				}else if(data == 'false'){
					var dfunc=java.type("com.tech.blog.dao.likedao")
					dfunc.deletelike(pid,uid);
				}
			},
			error:function(jqXHR,textStatus,errorThrown){
				console.log(data)
			}
		})
}
</Script>

<script>
$(document).ready(function() { 
$(window). on('popstate', function() { location. reload(true); }); })
</script>
</body>
</html>