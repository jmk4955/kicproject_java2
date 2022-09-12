package controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import model.AdoptBoard;
import model.Member;
import model.PetBoard;
import model.QnABoard;
import model.ReviewBoard;
import service.AdoptBoardDAO;
import service.CommDAO;
import service.MemberDAO;
import service.PetBoardDAO;
import service.QnABoardDAO;
import service.ReportDAO;
import service.ReviewBoardDAO;

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	HttpServletRequest request;
	HttpServletResponse response;
	Model m;
	HttpSession session;

	@ModelAttribute
	void init(HttpServletRequest request, Model m, HttpServletResponse response) {
		this.request = request;
		this.m = m;
		this.session = request.getSession();
		this.response = response;
	}
	
	@Autowired
	MemberDAO memDao;
	@Autowired
	PetBoardDAO petDao;
	@Autowired
	CommDAO commDao;
	@Autowired
	AdoptBoardDAO adoptDao;
	@Autowired
	ReviewBoardDAO reviewDao;
	@Autowired
	QnABoardDAO qnaDao;
	@Autowired
	ReportDAO reportDao;
	
//	메인 페이지
	@RequestMapping("index")
	public String index() throws Exception {
		
		return "index";
	}
	
//	로그인 페이지
	@RequestMapping("signIn")
	public String signIn() throws Exception {
		
		return "member/signIn";
	}
	
	@RequestMapping("signInPro")
	public String signInPro(String userId, String pwd) throws Exception {
		
		String msg = "";
		String url = "/member/signIn";
		
		Member mem = memDao.memberOne(userId);
		
		if(mem != null) {
			if (pwd.equals(mem.getPwd())) {
				session.setAttribute("userId", userId);
				session.setAttribute("userType", mem.getUserType());
				msg = mem.getUserId() + "님이 로그인 하였습니다.";
				url = "/member/index";
			} else {
				msg = "비밀번호가 틀립니다.";
			}
		} else {
			msg = "유효하지 않은 회원입니다.";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return "alert";
	}
	
//	회원가입 페이지
	@RequestMapping("signUp")
	public String signUp() throws Exception {
		
		return "member/signUp";
	}
	
	@RequestMapping("signUpPro")
	public String signUpPro(String pwdOk, String userId, Member member) throws Exception {
		
		String msg = "이미 있는 아아디 입니다.";
		String url = "/member/signUp";
		
		Member mem = memDao.memberOne(userId);
		
		if(mem == null) {
			int num = memDao.memberInsert(member);
			if (num > 0) {
				msg = userId + "님의 가입이 완료되었습니다.";
				url = "/member/signIn";
			} else {
				msg = "회원가입을 실패 했습니다.";
				url = "/member/signUp";
			}
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return "alert";
	}
	
//	로그아웃
	@RequestMapping("logout")
	public String logout() throws Exception {

		String userId = (String) session.getAttribute("userId");

		session.invalidate();

		request.setAttribute("msg", userId + "님이 로그아웃 되었습니다.");
		request.setAttribute("url", "/member/index");

		return "alert";
	}
	
//	이메일 페이지
	@RequestMapping("email")
	public String email() throws Exception {
		
		return "member/email";
	}
	
//  회원정보
	@RequestMapping("memberInfo")
	public String memberInfo(int boardType) throws Exception {
		
		session.setAttribute("boardType", boardType);
		String userId = (String) session.getAttribute("userId");
		
		Member mem = memDao.memberOne(userId);
		
		if(boardType == 0) {
			List<PetBoard> petboard = petDao.boardUser(0, userId);
			request.setAttribute("board", petboard);
		} else if (boardType == 1) {
			List<PetBoard> petboard = petDao.boardUser(1, userId);
			request.setAttribute("board", petboard);
		} else if (boardType == 2) {
			List<AdoptBoard> adoptboard = adoptDao.boardUser(userId);
			request.setAttribute("board", adoptboard);
		} else if (boardType == 3) {
			List<ReviewBoard> reviewboard = reviewDao.boardUser(userId);
			request.setAttribute("board", reviewboard);
		} else if (boardType == 4) {
			List<QnABoard> reviewboard = qnaDao.boardUser(userId);
			request.setAttribute("board", reviewboard);
		}  
		
		request.setAttribute("mem", mem);
		
		return "member/memberInfo";
	}
	
//  회원정보 수정
	@RequestMapping("memberUpdate")
	public String memberUpdate() throws Exception {
		
		String userId = (String) session.getAttribute("userId");
		
		Member mem = memDao.memberOne(userId);
		
		request.setAttribute("mem", mem);
		
		return "member/memberUpdate";
	}
	
	@RequestMapping("memberUpdatePro")
	public String memberUpdatePro(Member member) throws Exception {
		
		String userId = (String) session.getAttribute("userId");
		String msg = "비밀번호가 틀렸습니다";
		String url = "/member/memberUpdate";
		
		Member mem = memDao.memberOne(userId);
		
		if(mem.getPwd().equals(member.getPwd())) {
			int num = memDao.memberUpdate(member);
			
			if (num > 0) {
				msg = mem.getUserId() + "님의 정보가 수정되었습니다";
				url = "/member/memberInfo?boardType=0";
			} else {
				msg = "정보 수정을 실패 했습니다.";
				url = "/member/memberUpdate";
			}
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return "alert";
	}
	
	@RequestMapping("memberPwdUpdatePro")
	public String memberPwdUpdatePro(String pwd, String chgpwd) throws Exception {
		
		String userId = (String) session.getAttribute("userId");
		String msg = "비밀번호가 틀렸습니다 ";
		String url = "/member/memberUpdate";
		
		Member mem = memDao.memberOne(userId);
		if (pwd.equals(mem.getPwd())) {
			int num = memDao.memberPwdUpdate(userId, chgpwd);
			if (num > 0) {
				msg = userId + "님의 비밀번호가 수정되었습니다.";
				url = "/member/signIn";
				session.invalidate();
			} else {
				msg = "비밀번호 수정을 실패했습니다";
				url = "/member/memberUpdate";
			}
		} 
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return "alert";
	}
	
//  회원탈퇴
	@RequestMapping("memberDelete")
	public String memberDelete() throws Exception {
		
		return "member/memberDelete";
	}
	
	@RequestMapping("memberDeletePro")
	public String memberDeletePro(String pwd) throws Exception {
		
		String userId = (String) session.getAttribute("userId");
		String msg = "비밀번호가 틀립니다.";
		String url = "/member/memberDelete";
		
		Member mem = memDao.memberOne(userId);
		if(pwd.equals(mem.getPwd())) {
			int num = memDao.memberDelete(userId);
			if (num > 0) {
				session.invalidate();
				msg = "회원탈퇴를 완료하였습니다";
				url = "/member/index";
			} else {
				msg = "회원탈퇴를 실패했습니다";
			}
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return "alert";
	}
}














