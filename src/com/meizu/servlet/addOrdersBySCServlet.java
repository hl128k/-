package com.meizu.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.meizu.daofactory.DaoFactory;

public class addOrdersBySCServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public addOrdersBySCServlet() {
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
		String[] no = request.getParameterValues("no");
		HttpSession session = request.getSession();
		int uid = (Integer) ((Map<String, Object>) session.getAttribute("user"))
				.get("id");
		int oid = DaoFactory
				.executeCall("{call dbo.addOrders(?,?,?)}", uid, "");
		int row = 0;
		for (String string : no) {

			int sc = DaoFactory
					.excute(" insert into orderDetail(Oid,Mid,num,money) select ?,s.Mid,s.num,m.money*s.num from ShoppingCart s left join model m on s.Mid=m.id where s.id=?",
							oid, string);
			if (sc > 0) {
				row += DaoFactory.excute("delete ShoppingCart where id=?",
						string);

			} else {
				out.print("<script>alert('ϵͳ����');history.back();</script>");
			}
		}
		if (row > 0) {
			request.getSession().setAttribute("oid", oid);
			request.getRequestDispatcher("GetordersList").forward(request,
					response);
		} else {
			out.print("<script>alert('ϵͳ����');history.back();</script>");
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
