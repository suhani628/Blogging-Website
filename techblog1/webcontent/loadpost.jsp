
<%@page import="com.tech.blog.dao.postdao" %>
<%@page import="com.tech.blog.dao.likedao" %>
  <%@page import="com.tech.blog.dao.userdao" %>
   <%@page import="com.tech.blog.entities.user" %>
  
<%@page import="com.tech.blog.helper.connectionprovider" %>
<%@page import="java.util.List" %>
<%@page import="com.tech.blog.entities.post" %>

<div class="row">
<% 
user user =(user)session.getAttribute("currentUser");


postdao d=new postdao(connectionprovider.getConnection());
int cid=Integer.parseInt(request.getParameter("cid"));
List<post> posts=null;
if(cid == 0){
	 posts=d.getallposts();
}else{
	posts=d.getpostbycatid(cid);
}

if(posts.size()==0){
	out.println("<h3 class='display-3 text-center'>No posts in this category.</h3>");
	return;
}
for(post p:posts){
	%>
	
	<div class="col-md-6 mt-2">
	<div class="card">
	  <img class="card-img-top" src="blog_pics/<%=p.getPpic() %>" alt="Card image cap">
	
	<div class="card-body">
	
	<b  >
	<%= p.getPtitle() %>
	</b>
	<p >
	<%=p.getPcontent() %>
	</p>
	</div>
	<div class="card-footer primary-background text-center">
	<%
   likedao ld=new likedao(connectionprovider.getConnection());
   %>
   <a href="#!"  class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="likecounter"><%= ld.countlikeonpost(p.getPid()) %></span></a>
   <a href="showblogpg.jsp?post_id=<%= p.getPid() %>" class="btn btn-outline-light btn-sm">Read more..</a>
	</div>
	</div>
	</div>
	
	<%
}

%>
</div>
