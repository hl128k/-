package com.meizu.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.meizu.daofactory.DaoFactory;

public class AddShoppingCartByModel extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AddShoppingCartByModel() {
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
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		String no = request.getParameter("no").trim();
		String num = request.getParameter("num").trim();
		HttpSession session = request.getSession();
		if (session.getAttribute("user") != null) {
			int uid = (Integer) ((Map<String, Object>) session
					.getAttribute("user")).get("id");
			List<Map<String, Object>> list = DaoFactory.excuteQuery(
					"select id from ShoppingCart where Uid=? and Mid=?", uid,
					no);
			if (list.isEmpty()) {
				int row = DaoFactory.excute(
						"insert into ShoppingCart values(?,?,?)", num, uid, no);
				if (row > 0) {
					out.print(true);
				} else {
				}
			} else {
				int noid = (Integer) list.get(0).get("id");
				int row = DaoFactory.excute(
						"update ShoppingCart set num=num+? where id=?", num,
						noid);
				if (row > 0) {
					out.print(true);
				} else {
				}
			}
		}
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
