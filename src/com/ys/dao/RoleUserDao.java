package com.ys.dao;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ys.entity.RoleUser;

@Repository
public class RoleUserDao {
	@Resource(name="sst")
	private SqlSession session = null;
	
	public void save(RoleUser ru){
		session.insert("mapper.ru.save",ru);
		
	}
}
