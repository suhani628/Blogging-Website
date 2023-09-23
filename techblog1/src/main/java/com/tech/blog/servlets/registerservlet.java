package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;

import com.tech.blog.dao.userdao;
import com.tech.blog.entities.user;
import com.tech.blog.helper.connectionprovider;

import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class registerservlet
 */
@SuppressWarnings("serial")
@WebServlet(asyncSupported = true, urlPatterns = { "/registerservlet" })
@MultipartConfig
public class registerservlet extends HttpServlet {
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		fetching info
		try (PrintWriter out = response.getWriter()) {
			String check = request.getParameter("check");

			if (check == null) {
				out.println("Please agree terms and conditions");
			} else {
				String name = request.getParameter("username");
				String email = request.getParameter("useremail");
				String password = request.getParameter("userpassword");
				String gender = request.getParameter("exampleInputGender");
				String about = request.getParameter("about");
				// create user object and set all data to that object
				user user = new user(name, email, password, gender, about);

				// create userdao object
				userdao dao = new userdao(connectionprovider.getConnection());
				if (dao.saveuser(user)) {
					out.println("done");
				} else {
					out.println("error");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			processRequest(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try (PrintWriter out = response.getWriter()) {
			processRequest(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

//	public String getServletinfo() {
//		return "Short description";
//	}
}
