package com.boot.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.boot.dao.UserDAO;
import com.boot.servlet.InitServlet;
import com.boot.vo.UserInfoVO;

public class UserDAOImpl implements UserDAO {
	
	@Override
	public int insertUser(UserInfoVO user) {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		 String sql = "insert into user_info(ui_num,UI_NAME,UI_AGE,UI_BIRTH,UI_ID,"
		 		+ "UI_PASSWORD,UI_PHONE,UI_EMAIL,UI_CREDAT,UI_NICKNAME)\r\n" + 
		 		"values(seq_ui_num.nextval, ?, ?, ?, ?, ?, ?,?,SYSDATE,?)";
		 try {
			con = InitServlet.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, user.getUiName());
			ps.setInt(2, user.getUiAge());
			ps.setString(3, user.getUiBirth());
			ps.setString(4, user.getUiId());
			ps.setString(5, user.getUiPwd());
			ps.setString(6, user.getUiPhone());
			ps.setString(7, user.getUiEmail());
			ps.setString(8, user.getUiNickname());
			result = ps.executeUpdate();
			System.out.println("다오 :" +user);
			con.commit();
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			InitServlet.close(ps, con);
		}
		return result;
	}

	@Override
	public int deleteUser(UserInfoVO user) {
		Connection conn = null;
		PreparedStatement ps = null;
		int result = 0;
		String sql = "delete from user_info where ui_num=?";
		
		try {
			conn = InitServlet.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, user.getUiNum());
			result = ps.executeUpdate();
			conn.commit();
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			InitServlet.close(ps, conn);
		}
		
		return result;
	}

	@Override
	public int updateUser(UserInfoVO user) {
		Connection conn = null;
		PreparedStatement ps = null;
		int result = 0;
		 String sql = "update user_info\r\n" + 
		 		"set ui_name=?,\r\n" + 
		 		"ui_age=?,\r\n" + 
		 		"UI_BIRTH=?,\r\n" + 
		 		"UI_PHONE=?,\r\n" + 
		 		"UI_PASSWORD = ?,\r\n" + 
		 		"UI_EMAIL=?,\r\n" + 
		 		"UI_NICKNAME=?\r\n" + 
		 		"where ui_num=?";
		 
		 try {
			 conn = InitServlet.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1,user.getUiName());
			ps.setInt(2, user.getUiAge());
			ps.setString(3, user.getUiBirth());
			ps.setObject(4, user.getUiPhone());
			ps.setString(5, user.getUiPwd());
			ps.setString(6, user.getUiEmail());
			ps.setString(7, user.getUiNickname());
			ps.setInt(8, user.getUiNum());
			result = ps.executeUpdate();
			conn.commit();
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			InitServlet.close(ps, conn);
		}
		
		return 0;
	}

	@Override
	public UserInfoVO selectUser(UserInfoVO user) {
		String sql = "select * from user_info where ui_num=? ";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = InitServlet.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, user.getUiNum());
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
				ui.setUiAdmin(rs.getString("ui_admin"));
				return ui;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			InitServlet.close(ps, con);
		}
		return null;
	}
	
	
	
	@Override
	public List<UserInfoVO> selectUserList(UserInfoVO user) {
		 List<UserInfoVO> userList = new ArrayList<>();
		 String sql = "select * from user_info";
		 Connection con = null;
		 PreparedStatement ps = null;
		 ResultSet rs = null;
		 try {
			con = InitServlet.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
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
				ui.setUiAdmin(rs.getString("ui_admin"));
				userList.add(ui);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			InitServlet.close(rs, ps, con);
		}
		return userList;
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
				ui.setUiBirth(rs.getString("ui_birth").replace("-", ""));
				ui.setUiId(rs.getString("ui_id"));
				ui.setUiPwd(rs.getString("ui_password"));
				ui.setUiPhone(rs.getString("ui_phone"));
				ui.setUiCredat(rs.getString("ui_credat"));
				ui.setUiNickname(rs.getString("ui_nickname"));
				ui.setUiAdmin(rs.getString("ui_admin"));
				return ui;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			InitServlet.close(ps, con);
		}
		return null;
	}

	@Override
	public UserInfoVO selectUserById(String uiId) {
		String sql = "select * from user_info where ui_id=? ";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = InitServlet.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, uiId);
			rs = ps.executeQuery();
			if (rs.next()) {
				UserInfoVO ui = new UserInfoVO();
				ui.setUiNum(rs.getInt("ui_num"));
				ui.setUiName(rs.getString("ui_name"));
				ui.setUiAge(rs.getInt("ui_age"));
				ui.setUiId(rs.getString("ui_id"));
				ui.setUiBirth(rs.getString("ui_birth"));
				ui.setUiPhone(rs.getString("ui_phone"));
				ui.setUiNickname(rs.getString("ui_nickname"));
				ui.setUiCredat(rs.getString("ui_credat"));
				ui.setUiEmail(rs.getString("ui_email"));
				return ui;
			}
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			InitServlet.close(rs, ps, con);
		}
		return null;
	}
public static void main(String[] args) {
	UserDAO ud = new UserDAOImpl();
	InitServlet is = new InitServlet();
	is.init();
	System.out.println(ud.selectUserList(null));
}


}
