package com.ys.security;

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

//对请求进行拦截，不能直接对除登录页面的其他页面进行直接访问
public class SecurityFilter implements Filter{
	private String[] exs = null;
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest request = (HttpServletRequest)arg0;
		HttpServletResponse response = (HttpServletResponse)arg1;
		
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("loginuser");
		//System.out.println("拦截的请求"+request.getRequestURL());
		
		for(String ex :exs){
			if(request.getRequestURI().endsWith(ex)){
				arg2.doFilter(arg0, arg1);
				//如果进来的是.js,.css的前端请求直接返回，处理下一个请求
				return;
			}
		}
		if(obj == null){
			request.setAttribute("errmsg", "用户未登录或会话超时,请重新登录");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}else{
			//将请求按源路径送到controller
			arg2.doFilter(request, response);
		}
		
	}
	@Override
	public void init(FilterConfig arg0) throws ServletException {
		//在web.xml中配置的excludes不能直接获取，使用下面方法达到不拦截相应请求的目的
		String excludes = arg0.getInitParameter("excludes");
		exs = excludes.split(",");
	}

}
