package com.ys.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ys.entity.History;

@Repository
public class HistoryDao {
	@Resource(name="sst")
	private SqlSession session=null;
	
	public void save(History history){
		session.insert("mapper.history.save", history);
	}
	
	public List<Map> findByUserId(Integer userId){
		return session.selectList("mapper.history.findByUserId", userId);
	}
}
