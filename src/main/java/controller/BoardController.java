package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import model.AdoptBoard;
import model.Comm;
import model.PetBoard;
import model.QnABoard;
import model.Report;
import model.ReviewBoard;
import service.AdoptBoardMybatisDAO;
import service.CommMybatisDAO;
import service.MemberMybatisDAO;
import service.PetBoardMybatisDAO;
import service.QnABoardMybatisDAO;
import service.ReportMybatisDAO;
import service.ReviewBoardMybatisDAO;

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
	public String petBoard(int boardType) throws Exception {
		
		session.setAttribute("boardType", boardType);
		
		if(boardType == 0 || boardType == 1) {
			return "board/petBoard/petBoard";
		} else if(boardType == 2) {
			return "board/adoptBoard/adoptBoard";
		} else if(boardType == 3) {
			return "board/reviewBoard/reviewBoard";
		} else if(boardType == 4) {
			return "board/qnaBoard/QBoard";
		}
		
		return "index";
	}
	
	@RequestMapping("petBoardPro")
	public String petBoardPro(PetBoard petBoard) throws Exception {

		String msg = "게시물 등록 실패";
		String url = "/board/petBoard/petBoardForm";

		String boardId = (String) session.getAttribute("boardType");
		String userId = (String) session.getAttribute("userId");
		
		int petType = Integer.parseInt(petBoard.getPetType());
		
		if (boardId == null)
			boardId = "1";
		
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
			return "board/petBoard/petBoardForm";
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
			return "board/petBoard/petBoardInfo";
		} else if(boardType == 2) {
			return "board/adoptBoard/adoptBoardInfo";
		} else if(boardType == 3) {
			return "board/reviewBoard/reviewBoardInfo";
		} else if(boardType == 4) {
			return "board/qnaBoard/QBoardInfo";
		}
		
		return "index";
	}

}
