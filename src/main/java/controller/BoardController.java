package controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import model.AdoptBoard;
import model.PetBoard;
import model.QBoard;
import model.ReviewBoard;

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

	
	
	@RequestMapping("petBoardUpdatePro")
	public String petBoardUpdatePro(PetBoard petBoard) throws Exception {

		String msg = "게시물 등록 실패";
		String url = "/board/petBoard/petBoardUpdate";

		int postId = petBoard.getPostId();

		int num = petDao.boardUpdate(petBoard);
		if (num > 0) {
			msg = "게시물을 수정하였습니다.";
			url = "/board/petBoard/petBoardInfo?postId=" + postId;
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return "alert";
	}
	
	
	@RequestMapping("adoptBoardUpdatePro")
	public String adoptBoardUpdatePro(AdoptBoard adoptBoard) throws Exception {

		String msg = "게시물 등록 실패";
		String url = "/board/adoptBoard/adoptBoardUpdate";

		int postId = adoptBoard.getPostId();

		int num = adoptDao.boardUpdate(adoptBoard);
		if (num > 0) {
			msg = "게시물을 수정하였습니다.";
			url = "/board/adoptBoard/adoptBoardInfo?postId=" + postId;
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return "alert";
	}
	
	@RequestMapping("reviewBoardUpdatePro")
	public String reviewBoardUpdatePro(ReviewBoard reviewBoard) throws Exception {

		String msg = "게시물 등록 실패";
		String url = "/board/reviewBoard/reviewBoardUpdate";

		int postId = reviewBoard.getPostId();

		int num = reviewDao.boardUpdate(reviewBoard);
		if (num > 0) {
			msg = "게시물을 등록하였습니다.";
			url = "/board/reviewBoard/reviewBoardInfo?postId=" + postId;
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return "alert";
	}
	
	@RequestMapping("qnaBoardUpdatePro")
	public String qnaBoardUpdatePro(QnABoard qnaBoard) throws Exception {

		String msg = "게시물 등록 실패";
		String url = "/board/qnaBoard/qnaBoardUpdate";

		int postId = qnaBoard.getPostId();
		int num = qnaDao.boardUpdate(qnaBoard);

		if (num > 0) {
			msg = "게시물을 수정하였습니다.";
			url = "/board/qnaBoard/qnaBoardInfo?postId=" + postId;
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return "alert";
	}


}
