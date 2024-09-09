package biz;

import java.io.IOException;
import java.util.ArrayList;

import dao.MemberDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vo.MemberVO;

@WebServlet("/listMember")
public class MemberListServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		MemberDAO dao = new MemberDAO();
		ArrayList<MemberVO> list = dao.getMemberList();

		if (list != null) {
			req.setAttribute("memberlist", list);

		}
		req.getRequestDispatcher("/memberList.jsp").forward(req, resp);

	}

}