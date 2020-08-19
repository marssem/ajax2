package com.boot.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.boot.dao.UserDAO;
import com.boot.servlet.InitServlet;
import com.boot.vo.UserInfoVO;

public class UserDAOImpl implements UserDAO {

	@Override
	public int insertUser(UserInfoVO user) {
		 
		return 0;
	}

	@Override
	public int deleteUser(UserInfoVO user) {
		 
		return 0;
	}

	@Override
	public int updateUser(UserInfoVO user) {
		 
		return 0;
	}

	@Override
	public UserInfoVO selectUser(UserInfoVO user) {
		 
		return null;
	}

	@Override
	public List<UserInfoVO> selectUserList(UserInfoVO user) {
		 
		return null;
	}

	@Override
	public UserInfoVO selectUserForLogin(UserInfoVO user) {
		String sql = "select * from user_info where ui_id=? and ui_password=?";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = InitServlet.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, user.getUiId());
			ps.setString(2, user.getUiPwd());
			rs = ps.executeQuery();
			if(rs.next()) {
				UserInfoVO ui = new UserInfoVO();
				ui.setUiNum(rs.getInt("ui_num"));
				ui.setUiName(rs.getString("ui_name"));
				ui.setUiAge(rs.getInt("ui_age"));
				ui.setUiBirth(rs.getString("ui_birth"));
				ui.setUiId(rs.getString("ui_id"));
				ui.setUiPwd(rs.getString("ui_password"));
				ui.setUiPhone(rs.getString("ui_phone"));
				ui.setUiCredat(rs.getString("ui_credat"));
				ui.setUiNickname(rs.getString("ui_nickname"));
				return ui;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			InitServlet.close(ps, con);
		}
		return null;
	}

}
