package com.boot.service;

import java.util.List;
import java.util.Map;

import com.boot.vo.MemberInfoVO;

public interface MemberInfoService {

	Map<String, Object> selectMemberInfoList(MemberInfoVO mi);
}
