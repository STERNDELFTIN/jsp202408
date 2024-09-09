package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class JDBCUtil {

	// DB 연결
	public static Connection getConnection() {
		
		Connection con = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl21v", "lgy", "1234");
		} catch (Exception e){
			System.out.println("DB 연결 실패");
			e.printStackTrace();
		}
		
		return con;
	}
	
	// 연결 닫기 pstmt, con
	public static void close(Connection con, PreparedStatement pstmt) {
		
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (Exception e) {
				System.out.println("pstmt.close() 실패");
				e.printStackTrace();
			}
		}
		
		if (con != null) {
			try {
				con.close();
			} catch (Exception e) {
				System.out.println("con.close() 실패");
				e.printStackTrace();
			}
		}
	}
	
	// 연결 닫기 rs, pstmt, con
	public static void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
		
		if (rs != null) {
			try {
				rs.close();
			} catch (Exception e) {
				System.out.println("rs.close() 실패");
				e.printStackTrace();
			}
		}
		
		close(con, pstmt);
	}
}
