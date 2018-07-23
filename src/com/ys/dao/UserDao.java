package com.ys.dao;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ys.entity.User;

@Repository
public class UserDao {
	@Resource(name="sst")
	private SqlSession session = null;
	
	public Map findByUsername(String username){
		Map param = new HashMap();
		param.put("username", username);
		Map user = session.selectOne("mapper.user.findByUsername", param);
		return user;
	}
	
	public void save(User u){
		session.insert("mapper.user.save",u);
	}
	
	public void update(User u){
		session.update("mapper.user.update",u);
	}
	
	public User findById(Integer userId){
		User user = session.selectOne("mapper.user.findById",userId);
		return user;
	}
}
