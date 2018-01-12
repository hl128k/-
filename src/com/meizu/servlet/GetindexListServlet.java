package com.meizu.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meizu.daofactory.DaoFactory;

public class GetindexListServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public GetindexListServlet() {
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

		List<Map<String, Object>> typeList = DaoFactory
				.excuteQuery(
						"select top 7 t.id,t.TIid,t.type,a.CId,a.photo,c.name from typees t left join advertising a on a.id=t.advID left join commodity c on c.id=a.CId",
						null);
		Map<String, List<Map<String, Object>>> typemap = new HashMap<String, List<Map<String, Object>>>();
		for (Map<String, Object> map : typeList) {
			String id = map.get("id").toString();
			String type = map.get("type").toString();
			List<Map<String, Object>> list = DaoFactory.excuteQuery(
					"select top 10 * from commodity where tid  =" + id, null);
			typemap.put(type, list);
		}

		List<Map<String, Object>> scrolAdvList = DaoFactory
				.excuteQuery(
						"select top 6 c.name,a.CId,a.photo from scrolAdv s left join advertising a on s.advID=a.id left join commodity c on a.CId=c.id",
						null);

		List<Map<String, Object>> TopList = DaoFactory.excuteQuery(
				"select top 15 *from commodity where id%4=0", null);

		List<Map<String, Object>> tciList = DaoFactory
				.excuteQuery(
						"select top 4 t.name,t.id,a.CId aid,a.photo aphoto,r.CId rid,r.photo rphoto from Typeclassification t left join advertising a on t.advId=a.id left join recommended r on t.rId=r.id",
						null);
		Map<String, List<Map<String, Object>>> tcimap = new HashMap<String, List<Map<String, Object>>>();
		for (Map<String, Object> map : tciList) {
			String id = map.get("id").toString();
			String name = map.get("name").toString();
			List<Map<String, Object>> list = DaoFactory.excuteQuery(
					" select top 9 *from commodity where tid in (select id from typees where TIid="
							+ id + ")", null);
			tcimap.put(name, list);
		}
		request.setAttribute("typeList", typeList);
		request.setAttribute("typemap", typemap);
		request.setAttribute("scrolAdvList", scrolAdvList);
		request.setAttribute("TopList", TopList);
		request.setAttribute("tciList", tciList);
		request.setAttribute("tcimap", tcimap);
		request.getRequestDispatcher("index.jsp").forward(request, response);
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
