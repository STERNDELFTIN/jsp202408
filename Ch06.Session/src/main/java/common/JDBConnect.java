package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.ServletContext;

public class JDBConnect {
	public Connection con; // DB와 연결 담당
	public Statement stmt; // 인파라미터가 없는 정적 쿼리문을 실행할 때 사용
	public PreparedStatement psmt; // 인파라미터가 있는 동적 쿼리문을 실행할 때 사용 (인파라미터는 쿼리문 작성 시 매개변수로 전달된 값을 설정할 때 사용)
	public ResultSet rs; // SELECT 쿼리문의 결과를 저장할 때 사용
	
	public JDBConnect() {
		try {
			// JDBC 드라이버 로드
			Class.forName("oracle.jdbc.OracleDriver");
			
			// DB에 연결
			String url = "jdbc:oracle:thin:@localhost:1521:orcl21v";
			String id = "DELFTIN";
			String pwd = "1234";
			con = DriverManager.getConnection(url, id, pwd);
			
			System.out.println("DB 연결 성공(기본 생성자)");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 두번째 생성자 (접속 정보를 외부로부터 받는 생성자 추가)
	public JDBConnect(String driver, String url, String id, String pwd) {
		try {
			// JDBC 드라이버 로드
			Class.forName(driver);
			
			// DB에 연결
			con = DriverManager.getConnection(url, id, pwd);
			
			System.out.println("DB 연결 성공(인수 생정자 1)");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 세번째 생성자 (접속 정보를 직접 읽어오는 생성자 추가)
	public JDBConnect(ServletContext application) {
		try {
			// JDBC 드라이버 로드
			String driver = application.getInitParameter("OracleDriver");
			Class.forName(driver);
			
			// DB에 연결
			String url = application.getInitParameter("OracleURL");
			String id = application.getInitParameter("OracleId");
			String pwd = application.getInitParameter("OraclePwd");
			con = DriverManager.getConnection(url, id, pwd);
			
			System.out.println("DB 연결 성공(인수 생정자 2)");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 연결 해제(자원 반납)
	public void close() {
		try {
			if (rs != null) rs.close();
			if (stmt != null) stmt.close();
			if (psmt != null) psmt.close();
			if (con != null) con.close();
			System.out.println("JDBC 자원 해제");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
}
