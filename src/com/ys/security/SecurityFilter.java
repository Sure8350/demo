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

//������������أ�����ֱ�ӶԳ���¼ҳ�������ҳ�����ֱ�ӷ���
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
		//System.out.println("���ص�����"+request.getRequestURL());
		
		for(String ex :exs){
			if(request.getRequestURI().endsWith(ex)){
				arg2.doFilter(arg0, arg1);
				//�����������.js,.css��ǰ������ֱ�ӷ��أ�������һ������
				return;
			}
		}
		if(obj == null){
			request.setAttribute("errmsg", "�û�δ��¼��Ự��ʱ,�����µ�¼");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}else{
			//������Դ·���͵�controller
			arg2.doFilter(request, response);
		}
		
	}
	@Override
	public void init(FilterConfig arg0) throws ServletException {
		//��web.xml�����õ�excludes����ֱ�ӻ�ȡ��ʹ�����淽���ﵽ��������Ӧ�����Ŀ��
		String excludes = arg0.getInitParameter("excludes");
		exs = excludes.split(",");
	}

}
