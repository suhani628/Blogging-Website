package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import com.tech.blog.dao.likedao;
import com.tech.blog.helper.connectionprovider;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class likeservlet
 */
@WebServlet("/likeservlet")
public class likeservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void processRequest(HttpServletRequest request , HttpServletResponse response)throws ServletException,IOException {
		try(PrintWriter out=response.getWriter()){
			String operation=request.getParameter("operation");
			int uid =Integer.parseInt(request.getParameter("uid"));
			int pid =Integer.parseInt(request.getParameter("pid"));
            likedao ldao=new likedao(connectionprovider.getConnection());
            if(operation.equals("like")) {
            	boolean f=ldao.insertlike(pid,uid);
            	out.println(f);
            }
            
			
			
		}catch(Exception e) {
			
		}
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
