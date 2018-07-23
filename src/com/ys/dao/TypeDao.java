package com.ys.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class TypeDao {
	@Resource(name="sst")
	private SqlSession session =null;
	
	public List<Map> findAll(){
		return session.selectList("mapper.type.findAll");
	}
}
