package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.JDBCUtil;
import vo.MemberVO;

public class MemberDAO {

	public ArrayList<MemberVO> getMemberList(){
				// MemberVO 리스트 조회
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		
		// DB 연결
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM member_test";
		
		try {
			con = JDBCUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
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
	
	public int insertMember(MemberVO vo) {
		
		int cnt = 0;
		
		// DB 연결
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String sql = "INSERT INTO member_test VALUES(?, ?)";
		
		try {
			con = JDBCUtil.getConnection();
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,  vo.getName());
			pstmt.setString(2,  vo.getTel());
			
			cnt = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(con, pstmt);
		}
		
		return cnt;
	}
}
