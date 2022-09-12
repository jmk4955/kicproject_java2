package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board/")
public class BoardController {
	
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
	
//	게시판 페이지
	@RequestMapping("petBoard")
	public String petBoard(int boardType) throws Exception {
		
		session.setAttribute("boardType", boardType);
		
		if(boardType == 0 || boardType == 1) {
			return "board/petBoard/petBoard";
		} else if(boardType == 2) {
			return "board/adopt/adoptBoard";
		} else if(boardType == 3) {
			return "board/review/reviewBoard";
		} else if(boardType == 4) {
			return "board/qna/QBoard";
		}
		
		return "index";
	}
	
//	게시판 입력 페이지
	@RequestMapping("petBoardForm")
	public String petBoardForm() throws Exception {
		
		int boardType = (int) session.getAttribute("boardType");
		
		if(boardType == 0 || boardType == 1) {
			return "board/petBoard/petBoardForm";
		} else if(boardType == 2) {
			return "board/adopt/adoptBoardForm";
		} else if(boardType == 3) {
			return "board/review/reviewBoardForm";
		} else if(boardType == 4) {
			return "board/qna/QBoardForm";
		}
		
		return "index";
	}
	
//	게시판 입력 페이지
	@RequestMapping("petBoardInfo")
	public String petBoardInfo() throws Exception {
		
		int boardType = (int) session.getAttribute("boardType");
		
		if(boardType == 0 || boardType == 1) {
			return "board/petBoard/petBoardInfo";
		} else if(boardType == 2) {
			return "board/adopt/adoptBoardInfo";
		} else if(boardType == 3) {
			return "board/review/reviewBoardInfo";
		} else if(boardType == 4) {
			return "board/qna/QBoardInfo";
		}
		
		return "index";
	}

}
