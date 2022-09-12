package controller;

import java.util.HashMap;
import java.util.Map;
import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import model.AdoptBoard;
import model.Comm;
import model.PetBoard;
import model.QnABoard;
import model.Report;
import model.ReviewBoard;
import service.AdoptBoardDAO;
import service.CommDAO;
import service.MemberDAO;
import service.PetBoardDAO;
import service.QnABoardDAO;
import service.ReportDAO;
import service.ReviewBoardDAO;

@Controller
@RequestMapping("/board/")
public class BoardController {
	
	HttpServletRequest request;
	Model m;
	HttpSession session;

	@ModelAttribute
	void init(HttpServletRequest request, Model m) {
		this.request = request;
		this.m = m;
		this.session = request.getSession();
	}
	
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
	@Autowired
	MemberDAO memberDao;
	
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
			return "board/adoptBoard/adoptBoard";
		} else if(boardType == 3) {
			return "board/reviewBoard/reviewBoard";
		} else if(boardType == 4) {
			return "board/qna/qnaBoard";
		}
		
		return "index";
	}
	
	@RequestMapping("petBoardPro")
	public String petBoardPro(PetBoard petBoard) throws Exception {

		String msg = "게시물 등록 실패";
		String url = "/board/petBoard/petBoardForm";
		
		String userId = (String) session.getAttribute("userId");
		
		int boardId = (int) session.getAttribute("boardType");
		int petType = Integer.parseInt(petBoard.getPetType());
		
		if (boardId != 0 && boardId != 1) {
			boardId = 0;
		}
		
		petBoard.setBoardId(boardId); // 우선 공지사항
		petBoard.setUserId(userId);
		
		int num = petDao.boardInsert(petBoard);
		
		if (num > 0) {
			msg = "게시물을 등록하였습니다.";
			url = "/board/petBoard/petBoard?petType=" + petType;
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return "alert";
	}
	
	@RequestMapping("adoptBoardPro")
	public String adoptBoardPro(AdoptBoard adoptBoard) throws Exception {

		String msg = "게시물 등록 실패";
		String url = "/board/adoptBoard/adoptBoardForm";
		
		String userId = (String) session.getAttribute("userId");
		adoptBoard.setUserId(userId);
		
		int petType = Integer.parseInt(adoptBoard.getPetType());
		int num = adoptDao.boardInsert(adoptBoard);
		
		if (num > 0) {
			msg = "게시물을 등록하였습니다.";
			url = "/board/adoptBoard/adoptBoard?petType=" + petType;
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return "alert";
	}
	
	@RequestMapping("reviewBoardPro")
	public String reviewBoardPro(ReviewBoard reviewBoard) throws Exception {

		String msg = "게시물 등록 실패";
		String url = "/board/reviewBoard/reviewBoardForm";

		int num = reviewDao.boardInsert(reviewBoard);
		
		if (num > 0) {
			msg = "게시물을 등록하였습니다.";
			url = "/board/reviewBoard/reviewBoard";
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return "alert";
	}

	@RequestMapping("qnaBoardPro")
	public String qnaBoardPro(QnABoard qnaBoard) throws Exception {

		String msg = "게시물 등록 실패";
		String url = "/board/qnaBoard/qnaBoardForm";

		int num = qnaDao.boardInsert(qnaBoard);

		if (num > 0) {
			msg = "게시물을 등록하였습니다.";
			url = "/board/qnaBoard/qnaBoard";
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return "alert";
	}
	
	@RequestMapping("commentPro")
	public String commentPro(Comm comm) throws Exception {

		String msg = "덧글 작성 실패";
		String url = "/board/petBoard/petBoard?petType=0";

		int boardType = comm.getBoardType();
		int postId = comm.getPostId();
		int commId = comm.getCommId();
		int num = commDao.boardInsert(comm);
		
		if (boardType == 0 || boardType == 1) {
			url = "/board/petBoard/petBoardInfo?postId=" + postId;
		} else if (boardType == 2) {
			url = "/board/adoptBoard/adoptBoardInfo?postId=" + postId;
		} else if (boardType == 3) {
			url = "/board/reviewBoard/reviewBoardInfo?postId=" + postId;
		} else if (boardType == 4) {
			url = "/board/qnaBoard/qnaBoardInfo?postId=" + postId;
		}

		if (num > 0) {
			msg = "덧글을 작성하였습니다.";
		}

		request.setAttribute("commId", commId);
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return "alert";

	}
	
	@RequestMapping("reportPro")
	public String reportPro(Report report, String repoUserId) throws Exception {

		String msg = "신고접수를 실패하였습니다.";
		
		int boardType = report.getBoardType();
		int reportType = report.getReportType();
		int postId = report.getPostId();
		int num = reportDao.reportInsert(report);
		
		if (num > 0) {
			msg = "신고가 접수 되었습니다.";
			if (reportType == 1) {

				if (boardType == 0 || boardType == 1) {
					petDao.reportCntUp(postId);
				} else if (boardType == 2) {
					adoptDao.reportCntUp(postId);
				} else if (boardType == 3) {
					reviewDao.reportCntUp(postId);
				}

			} else if (reportType == 2) {
				memberDao.reportCntUp(repoUserId);
			}

		}
		request.setAttribute("msg", msg);

		return "reportAlert";
	}
	
//	게시판 입력 페이지
	@RequestMapping("petBoardForm")
	public String petBoardForm() throws Exception {
		
		int boardType = (int) session.getAttribute("boardType");
		
		if(boardType == 0 || boardType == 1) {
			return "board/pet/petBoardForm";
		} else if(boardType == 2) {
			return "board/adoptBoard/adoptBoardForm";
		} else if(boardType == 3) {
			return "board/reviewBoard/reviewBoardForm";
		} else if(boardType == 4) {
			return "board/qnaBoard/qnaBoardForm";
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
			return "board/adoptBoard/adoptBoardInfo";
		} else if(boardType == 3) {
			return "board/reviewBoard/reviewBoardInfo";
		} else if(boardType == 4) {
			return "board/qnaBoard/QBoardInfo";
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
