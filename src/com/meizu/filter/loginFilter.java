package com.meizu.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class loginFilter implements Filter {

	/**
	 * 需要排除的页面
	 */

	private String[] filterPageArray = { "/addressManage.jsp", "/GetAddManage",
			"/orders.jsp", "/GetordersList",
			"/addOrdersBySC", "/addOrdersByMode", "/ShoppingCart.jsp",
			"/AddShoppingCartByModel", "/ShoppingCart",  "/payment.jsp",
			"/submitOrders", "/GetMyOrder", "/payOrders", "/myorder.jsp",
			"/payOver" };

	/**
	 * @see Filter#destroy()
	 */

	public void destroy() {
		return;
	}

	/**
	 * 对session进行判断当前访问是否有登录
	 */

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		boolean isfilterPage = false;
		for (String page : filterPageArray) {
			if (((HttpServletRequest) request).getServletPath().equals(page)) {
				isfilterPage = true;
				break;
			}
		}

		if (isfilterPage) {
			HttpSession session = ((HttpServletRequest) request).getSession();
			if (session.getAttribute("user") == null
					|| session.getAttribute("user").equals("null")
					|| session.getAttribute("user").equals("")) {
				((HttpServletResponse) response).sendRedirect("login.jsp");
			} else {
				chain.doFilter(request, response);
			}

		} else {
			chain.doFilter(request, response);
		}
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}
}