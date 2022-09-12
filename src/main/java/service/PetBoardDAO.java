package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.PetBoard;

@Component
public class PetBoardDAO {

	@Autowired
	SqlSessionTemplate session;
	
	private final static String NS = "petBoard.";
	private static Map map = new HashMap<>();
	
	public int boardCount(int boardId, int petType) {
		map.clear();
		map.put("boardId", boardId);
		map.put("petType", petType);
		int num = session.selectOne(NS+"boardCount", map);
		return num;
	}
	
	public List<PetBoard> boardList(int pageInt, int limit, int boardId, int petType) {
		map.clear();
		map.put("boardId", boardId);
		map.put("start", (pageInt - 1) * limit + 1);
		map.put("end", (pageInt * limit));
		map.put("petType", petType);
		List<PetBoard> list = session.selectList(NS+"boardList", map);
		return list;
	}
	
	public List<PetBoard> boardUser(int boardId, String userId) {
		map.clear();
		map.put("boardId", boardId);
		map.put("userId", userId);
		List<PetBoard> list = session.selectList(NS+"boardUser", map);
		return list;
	}
	
	public List<PetBoard> boardDis(int boardId) {
		List<PetBoard> list = session.selectList(NS+"boardDis", boardId);
		return list;
	}
	
	public int boardInsert(PetBoard petBoard) {
		int num = session.insert(NS+"boardInsert", petBoard);
		return num;
	}
	
	public PetBoard boardOne(int postId) {
		PetBoard board = session.selectOne(NS+"boardOne", postId);
		return board;
	}
	
	public int boardUpdate(PetBoard petBoard) {
		int num = session.update(NS+"boardUpdate", petBoard);
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
