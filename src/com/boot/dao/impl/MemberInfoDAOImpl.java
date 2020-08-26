package com.boot.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.boot.dao.MemberInfoDAO;
import com.boot.servlet.InitServlet;
import com.boot.vo.MemberInfoVO;

public class MemberInfoDAOImpl implements MemberInfoDAO {

   public int selectTotalCount(MemberInfoVO mi) {
      Connection conn = null;
      PreparedStatement ps = null;
      ResultSet rs = null;

      String sql = "select count(1) from member_info";

      try {
         conn = InitServlet.getConnection();
         ps = conn.prepareStatement(sql);
         rs = ps.executeQuery();
         while(rs.next()) {
            return rs.getInt(1);
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         InitServlet.close(rs, ps, conn);
      }
      return 0;
   }

   public List<MemberInfoVO> selectMemberInfoList(MemberInfoVO mi) {
      Connection conn = null;
      PreparedStatement ps = null;
      ResultSet rs = null;
      String sql = "select * from(\r\n" + 
            "select rownum rnum, mi.*from( select * from member_info order by mi_num DESC)mi where rownum <=?) where rnum>=?";
      List<MemberInfoVO> memberList = new ArrayList<>();
      try {
         conn = InitServlet.getConnection();
         ps = conn.prepareStatement(sql);
         ps.setInt(1, mi.getEndRowNum());
         ps.setInt(2, mi.getStartRowNum());
         rs = ps.executeQuery();
         while (rs.next()) {
            MemberInfoVO tMi = new MemberInfoVO();
            tMi.setMiNum(rs.getInt("mi_num"));
            tMi.setRNum(rs.getInt("rnum"));
            tMi.setMiName(rs.getString("mi_name"));
            tMi.setMiId(rs.getString("mi_id"));
            memberList.add(tMi);
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         InitServlet.close(rs, ps, conn);
      }
      return memberList;
   }
   public static void main(String[] args) {
      InitServlet is = new InitServlet();
      is.init();
      MemberInfoDAO midao = new MemberInfoDAOImpl();
      MemberInfoVO mi = new MemberInfoVO();
      mi.setEndRowNum(40);
      mi.setStartRowNum(21);
      System.out.println(midao.selectMemberInfoList(mi));
      System.out.println(midao.selectTotalCount(null));
      
   }

}