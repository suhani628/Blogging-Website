package com.tech.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import com.tech.blog.dao.postdao;
import com.tech.blog.entities.post;
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
 * Servlet implementation class addpostservlet
 */
@MultipartConfig 
@WebServlet("/addpostservlet")
public class addpostservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     protected void processRequest(HttpServletRequest request,HttpServletResponse response)
    		 throws ServletException, IOException {
    	 response.setContentType("text/html;charset=UTF-8");
    	 try(PrintWriter out=response.getWriter()){
    		 
    		 int cid=Integer.parseInt(request.getParameter("cid"));
    		 String ptitle=request.getParameter("posttitle");
    		 String pcontent= request.getParameter("pcontent");
    		 String pcode= request.getParameter("pcode");
             Part part =request.getPart("ppic");
             System.out.println("dsb324532sfvsfvs2345678hcdsjl//////");

    		HttpSession session =request.getSession();
    		 user user=(user) session.getAttribute("currentUser");
    				 
   
    		 post p=new post(ptitle,pcontent,pcode,part.getSubmittedFileName(),null,cid,((com.tech.blog.entities.user) user).getId());
    		 postdao dao=new postdao(connectionprovider.getConnection());
    		 if(dao.savepost(p)) {
           	  String path=request.getRealPath("/")+"blog_pics"+File.separator+part.getSubmittedFileName();
            helper.savefile(part.getInputStream(), path);
			out.println("done");

    		 }else {
    			 out.println("error");
    		 }
    	 }
     }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);	
	}

}
