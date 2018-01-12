package com.meizu.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meizu.daofactory.DaoFactory;

public class GetsearchListServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public GetsearchListServlet() {
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
		String key = request.getParameter("searchText");
		String strindex = request.getParameter("index");
		if (key != null && !key.equals("")) {
			key = java.net.URLDecoder.decode(key, "utf-8");
			if (null == strindex) {
				strindex = "1";
			}
			int index = Integer.parseInt(strindex);
			List<Map<String, Object>> no = DaoFactory.excuteQuery(
					"select c.id from commodity c,typees t where c.tid=t.id and (type like '%"
							+ key + "%' or c.name='" + key + "')", null);
			int totalPages = no.size() % 10 == 0 ? no.size() / 10
					: no.size() / 10 + 1;
			if (totalPages < index) {
				index = totalPages;
			}
			if (index <= 0) {
				index = 1;
			}
			List<Map<String, Object>> list = DaoFactory
					.excuteQuery(
							"select top 10 *from commodity c,typees t where c.id not in (select top "
									+ (index - 1)
									* 10
									+ " c.id from commodity c,typees t where (type like '%"
									+ key
									+ "%' or c.name='"
									+ key
									+ "') and c.tid=t.id) and c.tid=t.id and (type like '%"
									+ key + "%' or c.name='" + key + "')", null);
			request.setAttribute("searchLsit", list);
			request.setAttribute("index", index);
			request.setAttribute("key", key);
			request.setAttribute("totalPages", totalPages);
		}
		request.getRequestDispatcher("MZsearch.jsp").forward(request, response);
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
