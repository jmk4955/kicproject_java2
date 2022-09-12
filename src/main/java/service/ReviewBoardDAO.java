package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.AdoptBoard;
import model.ReviewBoard;

@Component
public class ReviewBoardDAO {

	@Autowired
	SqlSessionTemplate session;
	
	private final static String NS = "reviewBoard.";
	private static Map map = new HashMap<>();
	
	public int boardCount(int petType) {
		map.clear();
		map.put("petType", petType);
		int num = session.selectOne(NS+"boardCount", map);
		return num;
	}
	
	public List<ReviewBoard> boardList(int pageInt, int limit, int petType) {
		map.clear();
		map.put("start", (pageInt - 1) * limit + 1);
		map.put("end", (pageInt * limit));
		map.put("petType", petType);
		List<ReviewBoard> list = session.selectList(NS+"boardList", map);
		return list;
	}
	
	public List<ReviewBoard> boardUser(String userId) {
		List<ReviewBoard> list = session.selectList(NS+"boardUser", userId);
		return list;
	}
	
	public List<ReviewBoard> boardDis() {
		List<ReviewBoard> list = session.selectList(NS+"boardDis");
		return list;
	}
	
	public int boardInsert(ReviewBoard reviewBoard) {
		int num = session.insert(NS+"boardInsert", reviewBoard);
		return num;
	}
	
	public ReviewBoard boardOne(int postId) {
		ReviewBoard board = session.selectOne(NS+"boardOne", postId);
		return board;
	}
	
	public int boardUpdate(ReviewBoard reviewBoard) {
		int num = session.update(NS+"boardUpdate", reviewBoard);
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
	
	public void reportCntUp(int postId) {
		session.update(NS+"reportCntUp", postId);
	}
	
}
