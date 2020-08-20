package com.boot.filter;

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


public class SessionFilter implements Filter {

   
    public SessionFilter() {
         
    }

	
	public void destroy() {
		
	}

	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		if(request instanceof HttpServletRequest) {
			HttpServletRequest req = (HttpServletRequest) request;
			String uri = req.getRequestURI();
			if(!uri.contains("/login") && !uri.contains("/views/join")) {
				 HttpSession session = req.getSession();
				 if(session.getAttribute("user")==null) {
					HttpServletResponse res = (HttpServletResponse)response;
					res.sendRedirect("/views/login");
					return;
				 }
			}
		}
		chain.doFilter(request, response);
	}

	
	public void init(FilterConfig fConfig) throws ServletException {
		
	}

}
