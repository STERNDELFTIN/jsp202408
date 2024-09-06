package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;

import common.JDBCUtil;
import vo.MemberVO;

public class MemberDAO {

	public ArrayList<MemberVO> getMemberList() {
		
		// 멤버 리스트 조회
		ArrayList<MemberVO> list = new ArrayList<>();
		
		// DB 연결
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM member_test";
		
		try {
			con = JDBCUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemberVO vo = new MemberVO();
				
				vo.setName(rs.getString("name"));
				vo.setTel(rs.getString("tel"));
				
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(con, pstmt, rs);
		}
		
		return list;
	}
}
