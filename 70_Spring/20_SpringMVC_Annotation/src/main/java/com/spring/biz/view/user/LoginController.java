package com.spring.biz.view.user;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.biz.uesr.UserVO;
import com.spring.biz.uesr.impl.UserDAO;

//@Controller : DispatcherServlet 에서 인식할 수 있는 컨트롤러 객체 생성
@Controller
public class LoginController {

	/* @RequestMapping
	 @RequestMapping : 요청과 처리(Controller) 연결(HandlerMapping 역할 대체) 
	 Conmmand 객체 사용 : 파라미터로 전달되는 값을 Command 객체에 설정
	 1. UserVO 타입 객체 생성 
	 2. UserVO 타입 객체에 전달받은 파라미터 값을 설정(이름 일치하는 경우)
	 3. UserVO 타입 객체를 메소드에 파라미터 값으로 전달
	 */
	@RequestMapping("/login.do")
	public String login(UserVO vo, UserDAO userDAO) {
		System.out.println(" >> 로그인 처리 ");
		
		System.out.println("vo : " + vo);
//		// 1. 사용자 전달한 데이터(정보)확인(추출)
//		String id = request.getParameter("id");
//		String password = request.getParameter("password");
//
//		// 2. DB 연동작업(id, password 유무 확인)
//
//		UserVO vo = new UserVO();
//		vo.setId(id);
//		vo.setPassword(password);
//
//		UserDAO userDAO = new UserDAO();
		UserVO user = userDAO.getUser(vo);
		System.out.println("user : "  + user);

		// 3. 화면 네비게이션(화면이동)
		// 로그인 성공 : 게시글 목록 보여주기
		// 로그인 실패 : 로그인 화면으로 이동
		
		if (user != null) {
			System.out.println(">>> 로그인 성공!!");
			return "getBoardList.do";
		} else {
			System.out.println(">>> 로그인 실패~~");
			return "login.jsp";
		}
	}

}
