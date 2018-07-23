package com.ys.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ys.entity.Ordering;

@Repository
public class OrderingDao {
	@Resource(name="sst")
	private SqlSession session = null;
	
	public void save(Ordering order){
		session.insert("mapper.ordering.save", order);
	}
	
	public List<Map> findByOrderHistoryId(Integer historyId){
		Map param= new HashMap();
		param.put("historyId", historyId);
		return session.selectList("mapper.ordering.findOrderingByHistoryId", param);
				
	}
}
