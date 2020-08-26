package com.boot.dao;

import java.util.List;

import com.boot.vo.MemberInfoVO;

public interface MemberInfoDAO {
	int selectTotalCount(MemberInfoVO mi);
	List<MemberInfoVO> selectMemberInfoList(MemberInfoVO mi);
}
