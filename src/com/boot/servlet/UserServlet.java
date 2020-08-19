package com.boot.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boot.vo.UserInfoVO;

import com.boot.service.UserService;
import com.boot.service.impl.UserServiceImpl;
import com.google.gson.Gson;

@WebServlet("/ajax/user")
public class UserServlet extends HttpServlet {
	private UserService userService =  new UserServiceImpl();
	private Gson gson = new Gson();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String contentType = response.getContentType();
		response.getWriter().append("Served at: ").append(request.getContextPath()).append(contentType);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BufferedReader br = request.getReader();
		String str;
		StringBuffer sb = new StringBuffer();
		while((str=br.readLine())!=null) {
			sb.append(str);
		}
		UserInfoVO user = gson.fromJson(sb.toString(), UserInfoVO.class);
		Map<String,Object> result = new HashMap<>();
		result.put("result", userService.doLogin(user, request.getSession()));
		String json = gson.toJson(result);
		PrintWriter pw = response.getWriter();
		pw.println(json);
	}
}







