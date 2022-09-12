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
	MemberDAO memDao;

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

		if (boardType == 0 || boardType == 1) {
			List<PetBoard> list = petDao.boardList(pageInt, limit, boardId, petType);
			boardCount = petDao.boardCount(boardId, petType);
			request.setAttribute("list", list);
		} else if (boardType == 2) {
			List<AdoptBoard> list = adoptDao.boardList(pageInt, limit, petType);
			boardCount = adoptDao.boardCount(petType);
			request.setAttribute("list", list);
		} else if (boardType == 3) {
			List<ReviewBoard> list = reviewDao.boardList(pageInt, limit, petType);
			boardCount = reviewDao.boardCount(petType);
			request.setAttribute("list", list);
		} else if (boardType == 4) {
			List<QnABoard> list = qnaDao.boardList(pageInt, limit);
			boardCount = qnaDao.boardCount();
			request.setAttribute("list", list);
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

		request.setAttribute("boardCount", boardCount);
		request.setAttribute("boardNum", boardNum);
		request.setAttribute("start", start);
		request.setAttribute("end", end);
		request.setAttribute("bottomLine", bottomLine);
		request.setAttribute("maxPage", maxPage);
		request.setAttribute("pageInt", pageInt);

		if (boardType == 0 || boardType == 1) {
			return "board/pet/petBoard";
		} else if (boardType == 2) {
			return "board/adopt/adoptBoard";
		} else if (boardType == 3) {
			return "board/review/reviewBoard";
		} else if (boardType == 4) {
			return "board/qna/qnaBoard";
		}

		return "index";
	}

	@RequestMapping("petBoardPro")
	public String petBoardPro(PetBoard petBoard) throws Exception {

		String msg = "게시물 등록 실패";
		String url = "/board/petBoardForm";

		int petType = Integer.parseInt(petBoard.getPetType());
		int boardType = (int) session.getAttribute("boardType");

		int num = petDao.boardInsert(petBoard);

		if (num > 0) {
			msg = "게시물을 등록하였습니다.";
			url = "/board/petBoard?boardType=" + boardType + "&petType=" + petType;
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return "alert";
	}

	@RequestMapping("adoptBoardPro")
	public String adoptBoardPro(AdoptBoard adoptBoard) throws Exception {

		String msg = "게시물 등록 실패";
		String url = "/board/petBoardForm";

		int petType = Integer.parseInt(adoptBoard.getPetType());
		int boardType = (int) session.getAttribute("boardType");

		int num = adoptDao.boardInsert(adoptBoard);

		if (num > 0) {
			msg = "게시물을 등록하였습니다.";
			url = "/board/petBoard?boardType=" + boardType + "&petType=" + petType;
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return "alert";
	}

	@RequestMapping("reviewBoardPro")
	public String reviewBoardPro(ReviewBoard reviewBoard) throws Exception {

		String msg = "게시물 등록 실패";
		String url = "/board/petBoardForm";

		int petType = Integer.parseInt(reviewBoard.getPetType());
		int boardType = (int) session.getAttribute("boardType");

		int num = reviewDao.boardInsert(reviewBoard);

		if (num > 0) {
			msg = "게시물을 등록하였습니다.";
			url = "/board/petBoard?boardType=" + boardType + "&petType=" + petType;
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return "alert";
	}

	@RequestMapping("qnaBoardPro")
	public String qnaBoardPro(QnABoard qnaBoard) throws Exception {

		String msg = "게시물 등록 실패";
		String url = "/board/petBoardForm";

		int boardType = (int) session.getAttribute("boardType");

		int num = qnaDao.boardInsert(qnaBoard);

		if (num > 0) {
			msg = "게시물을 등록하였습니다.";
			url = "/board/petBoard?boardType=" + boardType + "&petType=0";
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return "alert";
	}

	@RequestMapping("commentPro")
	public String commentPro(Comm comm) throws Exception {

		int postId = comm.getPostId();
		String msg = "덧글 작성 실패";
		String url = "/board/petBoardInfo?postId=" + postId;

		int num = commDao.commInsert(comm);

		if (num > 0) {
			msg = "덧글을 작성하였습니다.";
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return "alert";
	}
	
	@RequestMapping("reportForm")
	public String reportForm(int postId, int boardType, int reportType, String repoUserId) throws Exception {

		Map<String, Integer> map = new HashMap<>();
		map.put("postId", postId);
		map.put("boardType", boardType);
		map.put("reportType", reportType);

		request.setAttribute("repoUserId", repoUserId);
		request.setAttribute("reportInfo", map);

		return "board/reportForm";

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
				memDao.reportCntUp(repoUserId);
			}
		}
		request.setAttribute("msg", msg);
		return "board/reportAlert";
	}

//	게시판 입력 페이지
	@RequestMapping("petBoardForm")
	public String petBoardForm() throws Exception {

		int boardType = (int) session.getAttribute("boardType");

		if (boardType == 0 || boardType == 1) {
			return "board/pet/petBoardForm";
		} else if (boardType == 2) {
			return "board/adopt/adoptBoardForm";
		} else if (boardType == 3) {
			return "board/review/reviewBoardForm";
		} else if (boardType == 4) {
			return "board/qna/qnaBoardForm";
		}

		return "index";
	}

//	게시판 입력 페이지
	@RequestMapping("petBoardInfo")
	public String petBoardInfo(int postId) throws Exception {

		int boardType = (int) session.getAttribute("boardType");

		List<Comm> commList = commDao.commList(postId, boardType);
		int commCount = commDao.commCount(postId, boardType);

		request.setAttribute("commList", commList);
		request.setAttribute("commCount", commCount);

		if (boardType == 0 || boardType == 1) {
			petDao.readCntUp(postId);
			PetBoard petBoard = petDao.boardOne(postId);
			request.setAttribute("board", petBoard);
			return "board/pet/petBoardInfo";
		} else if (boardType == 2) {
			adoptDao.readCntUp(postId);
			AdoptBoard adoptBoard = adoptDao.boardOne(postId);
			request.setAttribute("board", adoptBoard);
			return "board/adopt/adoptBoardInfo";
		} else if (boardType == 3) {
			ReviewBoard reviewBoard = reviewDao.boardOne(postId);
			request.setAttribute("board", reviewBoard);
			return "board/review/reviewBoardInfo";
		} else if (boardType == 4) {
			qnaDao.readCntUp(postId);
			QnABoard qnaBoard = qnaDao.boardOne(postId);
			request.setAttribute("board", qnaBoard);
			return "board/qna/qnaBoardInfo";
		}

		return "index";
	}

//	게시판 입력 페이지
	@RequestMapping("petBoardUpdate")
	public String petBoardUpdate(int postId) throws Exception {

		int boardType = (int) session.getAttribute("boardType");

		if (boardType == 0 || boardType == 1) {
			PetBoard petBoard = petDao.boardOne(postId);
			request.setAttribute("board", petBoard);
			return "board/pet/petBoardUpdate";
		} else if (boardType == 2) {
			AdoptBoard adoptBoard = adoptDao.boardOne(postId);
			request.setAttribute("board", adoptBoard);
			return "board/adopt/adoptBoardUpdate";
		} else if (boardType == 3) {
			ReviewBoard reviewBoard = reviewDao.boardOne(postId);
			request.setAttribute("board", reviewBoard);
			return "board/review/reviewBoardUpdate";
		} else if (boardType == 4) {
			QnABoard qnaBoard = qnaDao.boardOne(postId);
			request.setAttribute("board", qnaBoard);
			return "board/qna/qnaBoardUpdate";
		}

		return "index";
	}

	@RequestMapping("petBoardUpdatePro")
	public String petBoardUpdatePro(PetBoard petBoard) throws Exception {

		int postId = petBoard.getPostId();

		String msg = "게시물 수정 실패";
		String url = "/board/petBoardInfo?postId=" + postId;

		int num = petDao.boardUpdate(petBoard);
		if (num > 0) {
			msg = "게시물을 수정하였습니다.";
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return "alert";
	}

	@RequestMapping("adoptBoardUpdatePro")
	public String adoptBoardUpdatePro(AdoptBoard adoptBoard) throws Exception {

		int postId = adoptBoard.getPostId();

		String msg = "게시물 수정 실패";
		String url = "/board/petBoardInfo?postId=" + postId;

		int num = adoptDao.boardUpdate(adoptBoard);
		if (num > 0) {
			msg = "게시물을 수정하였습니다.";
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return "alert";
	}

	@RequestMapping("reviewBoardUpdatePro")
	public String reviewBoardUpdatePro(ReviewBoard reviewBoard) throws Exception {

		int postId = reviewBoard.getPostId();

		String msg = "게시물 등록 실패";
		String url = "/board/petBoardInfo?postId=" + postId;

		int num = reviewDao.boardUpdate(reviewBoard);
		if (num > 0) {
			msg = "게시물을 등록하였습니다.";
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return "alert";
	}

	@RequestMapping("qnaBoardUpdatePro")
	public String qnaBoardUpdatePro(QnABoard qnaBoard) throws Exception {

		int postId = qnaBoard.getPostId();

		String msg = "게시물 등록 실패";
		String url = "/board/petBoardInfo?postId=" + postId;

		int num = qnaDao.boardUpdate(qnaBoard);
		if (num > 0) {
			msg = "게시물을 수정하였습니다.";
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return "alert";
	}

	@RequestMapping("disablePost")
	public String disablePost(int postId) throws Exception {

		int boardType = (int) session.getAttribute("boardType");

		String msg = "게시물 삭제를 실패하였습니다.";
		String url = "/board/petBoardInfo?postId=" + postId;

		int num = 0;

		if (boardType == 0 || boardType == 1) {
			num = petDao.boardDisable(postId);
		} else if (boardType == 2) {
			num = adoptDao.boardDisable(postId);
		} else if (boardType == 3) {
			num = reviewDao.boardDisable(postId);
		} else if (boardType == 4) {
			num = qnaDao.boardDisable(postId);
		}

		if (num > 0) {
			msg = "게시물을 삭제 하였습니다.";
			url = "/board/petBoard?boardType=" + boardType + "&petType=0";
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return "alert";
	}

	@RequestMapping("deleteComm")
	public String deleteComm(int commId, int postId) throws Exception {

		String msg = "덧글 삭제를 실패하였습니다.";
		String url = "/board/petBoardInfo?postId=" + postId;

		int num = commDao.commDelete(commId);

		if (num > 0) {
			msg = "덧글을 삭제 하였습니다.";
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

		}

		request.setAttribute("filename", filename);
		return "board/pictureimgPro";
	}

}
