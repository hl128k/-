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

public class addAddressServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public addAddressServlet() {
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
		String Name = request.getParameter("Name");
		HttpSession session = request.getSession();
		if (session.getAttribute("user") != null) {
			int uid = (Integer) ((Map<String, Object>) session
					.getAttribute("user")).get("id");
			String Phone = request.getParameter("Phone");
			String address = request.getParameter("address");
			int row = DaoFactory.excute(
					"insert into addresses values(?,?,?,?)", Name, uid, Phone,
					address);
			List<Map<String, Object>> List = DaoFactory.excuteQuery(
					"select top 1 id from addresses where uId=" + uid
							+ " order by id desc", null);
			if (row > 0) {
				int id = (Integer) List.get(0).get("id");
				out.print("<div class='addUser'>");
				out.print("<input type='hidden' class='no' value='" + id + "'>");
				out.print("<div class='userTop'>");
				out.print("<span class='userName'>" + Name
						+ "</span><span class='userPhone'>" + Phone + "</span>");
				out.print("</div>");
				out.print("<div class='userBottom'>" + address + "</div>");
				out.print("<span class='xuanzhong'>¡Ì</span>");
				out.print("<div class='userControl'>");
				out.print("<span class='del'>É¾³ý</span>");
				out.print("</div>");
				out.print("</div>");
			}
		}
		out.flush();
		out.close();
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
