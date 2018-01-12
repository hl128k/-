package com.meizu.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.meizu.daofactory.DaoFactory;

public class GetordersListServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public GetordersListServlet() {
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
		HttpSession session = request.getSession();
		int oid = (Integer) session.getAttribute("oid");
		int uid = (Integer) ((Map<String, Object>) session.getAttribute("user"))
				.get("id");
		List<Map<String, Object>> addressesList = DaoFactory.excuteQuery(
				"select * from addresses where uid=" + uid, null);
		List<Map<String, Object>> provinceList = DaoFactory.excuteQuery(
				"select *from pre_Area where ParentId=0", null);
		List<Map<String, Object>> ordersList = DaoFactory
				.excuteQuery(
						"select c.name,m.color,c.cover,c.id , o.num ,m.money,o.num*m.money sum from orderDetail o left join model m on o.Mid=m.id left join commodity c on m.Cid=c.id where o.Oid=?",
						oid);
		List<Map<String, Object>> ordSum = DaoFactory
				.excuteQuery(
						"select sum(o.money) sum from orderDetail o where o.Oid=?",
						oid);
		Object sum = ordSum.get(0).get("sum");
		request.setAttribute("addressesList", addressesList);
		request.setAttribute("provinceList", provinceList);
		request.setAttribute("ordersList", ordersList);
		request.setAttribute("orderSum", sum);
		request.getRequestDispatcher("orders.jsp").forward(request, response);

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
