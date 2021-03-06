package com.boot.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boot.service.MemberInfoService;
import com.boot.service.impl.MemberInfoServlceImpl;
import com.boot.vo.MemberInfoVO;
import com.google.gson.Gson;


@WebServlet("/ajax/member")
public class MemberInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private Gson gson = new Gson();
    private MemberInfoService miService = new MemberInfoServlceImpl();
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String json = request.getParameter("json");
		MemberInfoVO mi = gson.fromJson(json, MemberInfoVO.class);
		PrintWriter pw = response.getWriter();
		json = gson.toJson(miService.selectMemberInfoList(mi));
		pw.write(json);
		
		System.out.println(miService.selectMemberInfoList(mi));
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		doGet(request, response);
	}

}
