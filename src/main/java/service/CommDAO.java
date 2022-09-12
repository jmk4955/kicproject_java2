package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.Comm;

@Component
public class CommDAO {
	
	@Autowired
	SqlSessionTemplate session;
	
	private final static String NS = "comm.";
	private static Map map = new HashMap<>();
	
	public int commCount(int postId, int boardType) {
		map.clear();
		map.put("postId", postId);
		map.put("boardType", boardType);
		int num = session.selectOne(NS+"commCount", map);
		return num;
	}
	
	public List<Comm> commList(int postId, int boardType) {
		map.clear();
		map.put("postId", postId);
		map.put("boardType", boardType);
		List<Comm> list = session.selectList(NS+"commList", map);
		return list;
	}
	
	public int commInsert(Comm comm) {
		int num = session.insert(NS+"commInsert", comm);
		return num;
	}
	
	public Comm commOne(int commId) {
		Comm comm = session.selectOne(NS+"commOne", commId);
		return comm;
	}
	
	public int commDelete(int commId) {
		int num = session.delete(NS+"commDelete", commId);
		return num;
	}

}
