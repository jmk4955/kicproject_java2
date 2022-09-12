package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.Member;

@Component
public class MemberDAO {

	@Autowired
	SqlSessionTemplate session;
	
	private final static String NS = "member.";
	private static Map map = new HashMap<>();
	
	public int memberInsert(Member mem) {
		int num = session.insert(NS+"memberInsert", mem);
		return num;
	}
	
	public List<Member> memberList(int userType) {
		List<Member> list = session.selectList(NS+"memberList", userType);
		return list;
	}
	
	public Member memberOne(String userId) {
		Member mem = session.selectOne(NS+"memberOne", userId);
		return mem;
	}
	
	public int memberUpdate(Member mem) {
		int num = session.update(NS+"memberUpdate", mem);
		return num;
	}
	
	public int memberDelete(String userId) {
		int num = session.delete(NS+"memberDelete", userId);
		return num;
	}
	
	public int memberPwdUpdate(String userId,  String chgpwd) {
		Map map = new HashMap();
		map.put("userId", userId);
		map.put("pwd", chgpwd);
		int num = session.update(NS+"memberPwdUpdate", map);
		return num;
	}
	
	public int updateAuth(String userId, int userType) {
		map.clear();
		map.put("userId", userId);
		map.put("userType", userType);
		int num = session.update(NS+"updateAuth", map);
		return num;
	}
	
}
