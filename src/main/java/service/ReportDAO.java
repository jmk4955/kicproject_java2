package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.Report;

@Component
public class ReportDAO {

	@Autowired
	SqlSessionTemplate session;
	
	private final static String NS = "report.";
	private static Map map = new HashMap<>();
	
	public List<Report> repoList(int reportType) {
		List<Report> list = session.selectList(NS+"repoList", reportType);
		return list;
	}
	
	public int reportInsert(Report report) {
		int num = session.insert(NS+"reportInsert", report);
		return num;
	}
	
}
