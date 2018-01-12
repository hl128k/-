package com.meizu.filter;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.meizu.help.headhelp;

public class headHelpFilter implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest request = (HttpServletRequest) req;
		HttpSession session = request.getSession();
		if (session.getAttribute("headIdList") == null) {
			List<Map<String, Object>> headIdList = headhelp.getHeadIdList();
			Map<String, List<Map<String, Object>>> headmap = headhelp
					.getHeadmap();
			session.setAttribute("headIdList", headIdList);
			session.setAttribute("headmap", headmap);
		}
		chain.doFilter(req, resp);
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
