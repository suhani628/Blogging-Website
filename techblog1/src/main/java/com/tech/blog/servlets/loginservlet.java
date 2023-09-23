package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import com.tech.blog.dao.userdao;
import com.tech.blog.entities.message;
import com.tech.blog.entities.user;
import com.tech.blog.helper.connectionprovider;
import java.security.NoSuchAlgorithmException;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class loginservlet
 */
//@WebServlet("/loginservlet")
@WebServlet(asyncSupported = true, urlPatterns = { "/loginservlet" })

public class loginservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

   protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
	   response.setContentType("text/html;charset=UTF-8");
	   try(PrintWriter out= response.getWriter()){
		   //login
		   String useremail=request.getParameter("email");
		   String userpassword=request.getParameter("password");
		   
		   userdao dao=new userdao(connectionprovider.getConnection());
		  user u= dao.getuserbyemailnpassword(useremail, userpassword);
		   if(u==null) {
			   //login error
//			   out.println("Invalid Details. Try Again!");
//			   System.out.println("bvkdf=====mdnvj");
	  message msg = new message("Invalid Details! try with another","error","alert-danger");
	  HttpSession s=request.getSession();
	  s.setAttribute("msg", msg);
	  response.sendRedirect("loginpage.jsp");
		   }else {
			   //login success
			   HttpSession s=request.getSession();
			   s.setAttribute("currentUser",u);
			   System.out.println(u.toString());
			   response.sendRedirect("profilepage.jsp");
		   }
	   }catch (Exception e){
		    
		   
	   }
   }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("6873465832");
		try(PrintWriter out = response.getWriter()) {
			processRequest(request, response);
		}catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
