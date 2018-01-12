package com.meizu.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.meizu.daofactory.DaoFactory;

public class GetMyOrderServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public GetMyOrderServlet() {
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
		int uid = (Integer) ((Map<String, Object>) session.getAttribute("user"))
				.get("id");
		List<Map<String, Object>> oidlist = DaoFactory
				.excuteQuery(
						"select o.id,o.Sid,s.status from orders o left join statuses s on o.Sid=s.id where Uid=? and Sid>1",
						uid);
		if (!oidlist.isEmpty()) {
			Map<Integer, List<Map<String, Object>>> ordmap = new HashMap<Integer, List<Map<String, Object>>>();
			Map<Integer, String> ordsum = new HashMap<Integer, String>();
			for (Map<String, Object> map : oidlist) {
				int id = (Integer) map.get("id");
				List<Map<String, Object>> ordlist = DaoFactory
						.excuteQuery(
								"select od.num ,m.money mmoney,od.money omoney,c.name,m.color,c.id  from orderDetail od left join model m on od.Mid=m.id left join commodity c on m.Cid=c.id where Oid = ?",
								id);
				ordmap.put(id, ordlist);
				String sum = DaoFactory
						.excuteQuery(
								"select sum(o.money) sum from orderDetail o where o.Oid=?",
								id).get(0).get("sum").toString();
				ordsum.put(id, sum);
			}
			request.setAttribute("ordsum", ordsum);
			request.setAttribute("ordmap", ordmap);
			request.setAttribute("oidlist", oidlist);
		}
		request.getRequestDispatcher("myorder.jsp").forward(request, response);
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
