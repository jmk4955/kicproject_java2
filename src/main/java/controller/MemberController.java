package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
//	회원가입 페이지
	@RequestMapping("signUp")
	public String signUp() throws Exception {
		
		return "member/signUp";
	}
	
//	이메일 페이지
	@RequestMapping("email")
	public String email() throws Exception {
		
		return "member/email";
	}
	
//  회원정보
	@RequestMapping("memberInfo")
	public String memberInfo() throws Exception {
		
		return "member/memberInfo";
	}
	
//  회원정보 수정
	@RequestMapping("memberUpdate")
	public String memberUpdate() throws Exception {
		
		return "member/memberUpdate";
	}
	
//  회원탈퇴
	@RequestMapping("memberDelete")
	public String memberDelete() throws Exception {
		
		return "member/memberDelete";
	}
}














