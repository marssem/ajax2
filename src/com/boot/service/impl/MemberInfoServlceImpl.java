package com.boot.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.boot.dao.MemberInfoDAO;
import com.boot.dao.impl.MemberInfoDAOImpl;
import com.boot.service.MemberInfoService;
import com.boot.servlet.InitServlet;
import com.boot.vo.MemberInfoVO;

public class MemberInfoServlceImpl implements MemberInfoService {
	private MemberInfoDAO md = new MemberInfoDAOImpl();
	@Override
	public Map<String, Object> selectMemberInfoList(MemberInfoVO mi) {
		int page = mi.getPage();
		int startRowNum = (page-1)*10 + 1;
		int endRowNum = startRowNum + (10-1);
		mi.setStartRowNum(startRowNum);
		mi.setEndRowNum(endRowNum);
		List<MemberInfoVO> miList = md.selectMemberInfoList(mi);
		int totalCount = md.selectTotalCount(mi);
		Map<String,Object> rMap = new HashMap<>();
		rMap.put("list", miList);
		rMap.put("totalCnt", totalCount);
		return rMap;
		
	}
	public static void main(String[] args) {
		InitServlet is = new InitServlet();
		is.init();
		MemberInfoService mi = new MemberInfoServlceImpl();
		MemberInfoVO md = new MemberInfoVO();
		md.setPage(3);
		System.out.println(mi.selectMemberInfoList(md));
	}
}
