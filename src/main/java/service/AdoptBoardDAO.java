package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.AdoptBoard;
import model.PetBoard;

@Component
public class AdoptBoardDAO {

	@Autowired
	SqlSessionTemplate session;
	
	private final static String NS = "adoptBoard.";
	private static Map map = new HashMap<>();
	
	public int boardCount(int petType) {
		int num = session.selectOne(NS+"boardCount", petType);
		return num;
	}
	
	public List<AdoptBoard> boardList(int pageInt, int limit, int petType) {
		map.clear();
		map.put("start", (pageInt - 1) * limit + 1);
		map.put("end", (pageInt * limit));
		map.put("petType", petType);
		List<AdoptBoard> list = session.selectList(NS+"boardList", map);
		return list;
	}
	
	public List<AdoptBoard> boardUser(String userId) {
		List<AdoptBoard> list = session.selectList(NS+"boardUser", userId);
		return list;
	}
	
	public int boardInsert(AdoptBoard adoptBoard) {
		int num = session.insert(NS+"boardInsert", adoptBoard);
		return num;
	}
	
	public AdoptBoard boardOne(int postId) {
		AdoptBoard board = session.selectOne(NS+"boardOne", postId);
		return board;
	}
	
	public int boardUpdate(AdoptBoard adoptBoard) {
		int num = session.update(NS+"boardUpdate", adoptBoard);
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
