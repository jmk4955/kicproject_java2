package controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import model.AdoptBoard;
import model.PetBoard;

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
	public String petBoard(int boardType, int petType) throws Exception {
		
		session.setAttribute("boardType", boardType);
		session.setAttribute("pageNum", "1");
		
		int boardId = boardType;
		
		String pageNum = (String) session.getAttribute("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
		
		int pageInt = Integer.parseInt(pageNum);
		int boardCount = 0;
		
		if (petType == 0) {
			request.setAttribute("petType", 0);
		} else if (petType == 1) {
			request.setAttribute("petType", 1);
		}
		
		int limit = 8; // 한 page당 게시물 개수
		
		List<Object> list = null;
		
		if(boardType == 0 || boardType == 1) {
			list = petDao.boardList(pageInt, limit, boardId, petType);
			boardCount = petDao.boardCount(boardId, petType);
		} else if(boardType == 2) {
			list = adoptDao.boardList(pageInt, limit, petType);
			boardCount = adoptDao.boardCount(petType);
		} else if(boardType == 3) {
			list = reviewDao.boardList(pageInt, limit);
			boardCount = reviewDao.boardCount();
		} else if(boardType == 4) {
			list = qnaDao.boardList(pageInt, limit);
			boardCount = qnaDao.boardCount();
		}
		
//		pagination 개수
		int bottomLine = 3;

		int start = (pageInt - 1) / bottomLine * bottomLine + 1;
		int end = start + bottomLine - 1;
		int maxPage = (boardCount / limit) + (boardCount % limit == 0 ? 0 : 1);
		if (end > maxPage) {
			end = maxPage;
		}

		int boardNum = boardCount - (pageInt - 1) * limit;
		
		request.setAttribute("list", list);
		request.setAttribute("boardCount", boardCount);
		request.setAttribute("boardNum", boardNum);
		request.setAttribute("start", start);
		request.setAttribute("end", end);
		request.setAttribute("bottomLine", bottomLine);
		request.setAttribute("maxPage", maxPage);
		request.setAttribute("pageInt", pageInt);
		
		if(boardType == 0 || boardType == 1) {
			return "board/pet/petBoard";
		} else if(boardType == 2) {
			return "board/adopt/adoptBoard";
		} else if(boardType == 3) {
			return "board/review/reviewBoard";
		} else if(boardType == 4) {
			return "board/qna/qnaBoard";
		}
		
		return "index";
	}
	
//	게시판 입력 페이지
	@RequestMapping("petBoardForm")
	public String petBoardForm() throws Exception {
		
		int boardType = (int) session.getAttribute("boardType");
		
		if(boardType == 0 || boardType == 1) {
			return "board/pet/petBoardForm";
		} else if(boardType == 2) {
			return "board/adopt/adoptBoardForm";
		} else if(boardType == 3) {
			return "board/review/reviewBoardForm";
		} else if(boardType == 4) {
			return "board/qna/qnaBoardForm";
		}
		
		return "index";
	}
	
	
	
//	게시판 입력 페이지
	@RequestMapping("petBoardInfo")
	public String petBoardInfo() throws Exception {
		
		int boardType = (int) session.getAttribute("boardType");
		
		if(boardType == 0 || boardType == 1) {
			return "board/pet/petBoardInfo";
		} else if(boardType == 2) {
			return "board/adopt/adoptBoardInfo";
		} else if(boardType == 3) {
			return "board/review/reviewBoardInfo";
		} else if(boardType == 4) {
			return "board/qna/qnaBoardInfo";
		}
		
		return "index";
	}
	
	@RequestMapping("pictureimgForm")
	public String pictureimgForm() throws Exception {

		return "board/pictureimgForm";

	}

	@RequestMapping("pictureimgPro")
	public String pictureimgPro(@RequestParam("picture") MultipartFile multipartFile) throws Exception {

		String path = request.getServletContext().getRealPath("/") + "view/board/img/";
		String filename = null;

		if (!multipartFile.isEmpty()) {

			File file = new File(path, multipartFile.getOriginalFilename());
			multipartFile.transferTo(file);
			filename = multipartFile.getOriginalFilename();
			System.out.println(filename);

		}

		request.setAttribute("filename", filename);
		return "board/pictureimgPro";

	}

}
