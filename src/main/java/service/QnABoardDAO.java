package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.QnABoard;
import model.ReviewBoard;

@Component
public class QnABoardDAO {

	@Autowired
	SqlSessionTemplate session;
	
	private final static String NS = "qnaBoard.";
	private static Map map = new HashMap<>();
	
	public int boardCount() {
		int num = session.selectOne(NS+"boardCount");
		return num;
	}
	
	public List<QnABoard> boardList(int pageInt, int limit) {
		map.clear();
		map.put("start", (pageInt - 1) * limit + 1);
		map.put("end", (pageInt * limit));
		List<QnABoard> list = session.selectList(NS+"boardList", map);
		return list;
	}
	
	public List<QnABoard> boardUser(String userId) {
		List<QnABoard> list = session.selectList(NS+"boardUser", userId);
		return list;
	}
	
	public int boardInsert(QnABoard qnaBoard) {
		int num = session.insert(NS+"boardInsert", qnaBoard);
		return num;
	}
	
	public QnABoard boardOne(int postId) {
		QnABoard board = session.selectOne(NS+"boardOne", postId);
		return board;
	}
	
	public int boardUpdate(QnABoard qnaBoard) {
		int num = session.update(NS+"boardUpdate", qnaBoard);
		return num;
	}
	
	public int boardDisable(int postId) {
		int num = session.update(NS+"boardDisable", postId);
		return num;
	}
	
	public int boardDelete(int postId) {
		int m = session.insert(NS+"boardDelete", postId);
		return m;
	}
	
	public void readCntUp(int postId) {
		session.update(NS+"readCntUp", postId);
	}
	
}
