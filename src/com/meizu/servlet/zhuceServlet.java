package com.meizu.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.omg.CORBA.Request;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.meizu.daofactory.*;
public class zhuceServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
			req.setCharacterEncoding("utf-8");
			resp.setCharacterEncoding("utf-8");
			PrintWriter out=resp.getWriter();
			String username=req.getParameter("name");
			List<Map<String, Object>> list=DaoFactory.excuteQuery("select * from Users where name='"+username+"'",null);
			System.out.println(list);
			if (list!=null&&list.size()>0) {
				out.print(true);
			}else{
				out.print(false);
			}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}
}
