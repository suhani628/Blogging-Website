package com.tech.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import com.tech.blog.dao.userdao;
import com.tech.blog.entities.message;
import com.tech.blog.entities.user;
import com.tech.blog.helper.connectionprovider;
import com.tech.blog.helper.helper;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

/**
 * Servlet implementation class editservlet
 */
@WebServlet("/editservlet")
@MultipartConfig
public class editservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	 protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			 throws ServletException, IOException{
		   response.setContentType("text/html;charset=UTF-8");
		   try(PrintWriter out= response.getWriter()){
			   System.out.println("dsb324532sfvsfvs2345678hcdsjl*******");
			   String name=request.getParameter("username");
			   String email=request.getParameter("useremail");
			   String password=request.getParameter("userpassword");
			   String about=request.getParameter("userabout");
               Part part=request.getPart("image");
               
              String imagename=part.getSubmittedFileName();
              System.out.println("dsb324532sfvsfvs2345678hcdsjl//////");
              
              HttpSession s=request.getSession();
              System.out.println("dsb324532sfvsfvs2345qwerty");
              user user=(user) s.getAttribute("currentUser");
              System.out.println(user.toString());
              user.setEmail(email);
              user.setName(name);
              user.setPassword(password);
              user.setAbout(about);
              String oldfile=user.getProfile();
              user.setProfile(imagename);
              userdao userdao=new
              userdao(connectionprovider.getConnection());
              boolean ans=userdao.updateuser(user);
              if(ans) { 
            	  out.println("updated on db");
            	  String path=request.getRealPath("/")+"pics"+File.separator+user.getProfile();
            	 //delete code
            	  String oldfilepath=request.getRealPath("/")+"pics"+File.separator+oldfile;
            	  if(!oldfile.equals("default.png")) {
            		  helper.deletefile(oldfilepath);
            	  }
            	
            	  			if(helper.savefile(part.getInputStream(), path)) {
            	  				out.println("profile updated");
            	  		 message msg = new message("profile details updated","success","alert-success");
            	  		  s.setAttribute("msg", msg);
            	  		  
            	  			}else {
            	  		 message msg = new message("Something went wrong!","error","alert-danger");
                   	   s.setAttribute("msg", msg);
            	  			}
            	  	
              }else {
            	  out.println("not updated");
            	  message msg = new message("Something went wrong!","error","alert-danger");
    	  		  s.setAttribute("msg", msg);
    	  		  
              } 
              response.sendRedirect("profilepage.jsp");
		   }catch (Exception e){
//			   e.printStackTrace();
		   }
		  
		   System.out.println("dsbhcdsj32456l");
	   }
	
   

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try(PrintWriter out = response.getWriter()) {
			processRequest(request, response);
		}catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try(PrintWriter out = response.getWriter()) {
			processRequest(request, response);
		}catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	}

}
