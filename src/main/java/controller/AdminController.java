package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import model.AdoptBoard;
import model.Comm;
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
	
	@RequestMapping("adminUserList")
	public String adminUserList() throws Exception {
		
		List<Member> normal = memDao.memberList(0);
		List<Member> admin = memDao.memberList(2);
		
		request.setAttribute("normal", normal);
		request.setAttribute("admin", admin);
		
		return "admin/adminUserList";
	}
	
	@RequestMapping("adminSearchUser")
	public String adminSearchUser(String userId, int boardType) throws Exception {
		
		Member mem = memDao.memberOne(userId);
		List<Comm> comm = commDao.commUser(userId);
		
		if(boardType == 0 || boardType == 1) {
			List<PetBoard> petBoard = petDao.boardUser(boardType, userId);
			request.setAttribute("board", petBoard);
		} else if(boardType == 2) {
			List<AdoptBoard> adoptBoard = adoptDao.boardUser(userId);
			request.setAttribute("board", adoptBoard);
		} else if(boardType == 3) {
			List<ReviewBoard> reviewBoard = reviewDao.boardUser(userId);
			request.setAttribute("board", reviewBoard);
		}
		
		session.setAttribute("boardType", boardType);
		request.setAttribute("mem", mem);
		request.setAttribute("comm", comm);
		
		return "admin/adminSearchUser";
	}
	
	@RequestMapping("adminDisPost")
	public String adminDisPost(int boardType) throws Exception {
		
		session.setAttribute("boardType", boardType);
		
		if(boardType == 0 || boardType == 1) {
			List<PetBoard> petBoard = petDao.boardDis(boardType);
			request.setAttribute("board", petBoard);
		} else if(boardType == 2) {
			List<AdoptBoard> adoptBoard = adoptDao.boardDis();
			request.setAttribute("board", adoptBoard);
		} else if(boardType == 3) {
			List<ReviewBoard> reviewBoard = reviewDao.boardDis();
			request.setAttribute("board", reviewBoard);
		}
		
		return "admin/adminDisPost";
	}
	
	@RequestMapping("adminRepoList")
	public String adminRepoList() throws Exception {
		
		return "admin/adminRepoList";
	}
	
	@RequestMapping("updateAuth")
	public String updateAuth(String userId, int userType) throws Exception {
		
		String msg = "권한 없데이트를 실패했습니다.";
		String url = "/admin/adminUserList";
		
		int num = memDao.updateAuth(userId, userType);
		
		if(num > 0) {
			msg = userId+"님의 권한을 업데이트 했습니다.";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return "alert";
	}
	
	@RequestMapping("deleteUser")
	public String deleteUser(String userId) throws Exception {
		
		String msg = "회원삭제 를 실패했습니다.";
		String url = "/admin/adminUserList";
		
		int num = memDao.memberDelete(userId);
		
		if(num > 0) {
			msg = userId+"님을 삭제 하였습니다.";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return "alert";
	}
	
	@RequestMapping("adminDelComm")
	public String adminDelComm(int commId, String userId) throws Exception {
		
		String msg = "덧글 삭제를 실패하였습니다.";
		String url = "/admin/adminSearchUser?boardType=0&userId="+userId;
		
		int num = commDao.commDelete(commId);
		
		if(num > 0) {
			msg = "덧글을 삭제하였습니다.";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return "alert";
	}
	
	@RequestMapping("adminDelPost")
	public String adminDelPost(int postId, String userId) throws Exception {
		
		int boardType = (int) session.getAttribute("boardType");
		
		String msg = "게시물 삭제를 실패하였습니다.";
		String url = "/admin/adminSearchUser?boardType="+boardType+"&userId="+userId;
		
		int num = 0;
		if(boardType == 0 || boardType == 1) {
			num = petDao.boardDelete(postId);
		} else if(boardType == 2) {
			num = adoptDao.boardDelete(postId);
		} else if(boardType == 3) {
			num = reviewDao.boardDelete(postId);
		}
		
		if(num > 0) {
			msg = "게시물 을 삭제하였습니다.";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return "alert";
	}

}
