package com.meizu.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meizu.daofactory.DaoFactory;

public class ModelServlet extends HttpServlet {
	public ModelServlet() {
		super();
	}

	public void destroy() {
		super.destroy();

	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String id = request.getParameter("id");
		int Cid = Integer.parseInt(id);
		List<Map<String, Object>> list = DaoFactory.excuteQuery(
				"select *from model where Cid=?", Cid);
		if (!list.isEmpty()) {
			request.setAttribute("map", list.get(0));
			request.getRequestDispatcher("meizuMxwu.jsp").forward(request,
					response);
		} else {
			String path = request.getContextPath();
			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path + "/";
			out.print("商品丢失<a href='" + basePath + "'>返回首页</a>");
		}

		out.flush();
		out.close();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public void init() throws ServletException {

	}

}
