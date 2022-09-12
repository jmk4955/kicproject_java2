package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/")
public class AdminController {
	
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
	
	@RequestMapping("adminUserList")
	public String adminUserList() throws Exception {
		
		return "admin/adminUserList";
	}
	
	@RequestMapping("adminSearchUser")
	public String adminSearchUser() throws Exception {
		
		return "admin/adminSearchUser";
	}

}
