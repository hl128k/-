package com.meizu.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.meizu.daofactory.*;

public class zhuceyanzhengServlet extends HttpServlet {

	public zhuceyanzhengServlet() {
		super();
	}

	public void destroy() {
		super.destroy(); 
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession s=request.getSession();
		
		String name=request.getParameter("username");
		String phone=request.getParameter("userphone");
		String password=request.getParameter("userpwd");
		
		int rows=DaoFactory.excute("insert into Users(name,phone,password) values('"+name+"','"+phone+"','"+password+"')",null);
		if (rows==1) {
			out.print(true);
		}else {
			out.print(false);
		}
		out.flush();
		out.close();
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
	public void init() throws ServletException {
		// Put your code here
	}

}
