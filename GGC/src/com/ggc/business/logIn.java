package com.ggc.business;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ggc.Classes.UserENT;
import com.ggc.Classes.tools.AIPUtil;
import com.ggc.Classes.tools.MD5Encryptor;

public class logIn extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public logIn() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		process(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		process(request,response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}
	public void process(HttpServletRequest request, HttpServletResponse response){
		try {
			response.setContentType("text/html");
			UserENT userENT = new UserENT();
			userENT.setUserName(request.getParameter("username"));
			userENT.setPassword(MD5Encryptor.encode(request.getParameter("password")));
			UserBusinessManager manager = new UserBusinessManager();
			UserENT userENT2 = manager.login(userENT);
			if(userENT2.getUserName()!=null&&!userENT2.getUserName().equalsIgnoreCase("")){
				request.getSession().setAttribute("loggedInUser", userENT2);
				response.sendRedirect("login.jsp");
			}else{
				request.getSession().setAttribute("error", true);
				response.sendRedirect("login.jsp?error=true");
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
