package com.ys.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
@Repository
public class RBACDao {
	@Resource(name="sst")
	private SqlSession session = null;
	
	public List<Map> findFunctionByUser(String username,Integer moduleId) {
		Map param = new HashMap();
		param.put("username", username);
		param.put("module_id", moduleId);
		return session.selectList("mapper.rbac.findFunctionByUser", param);
	}
	
	public List<Map> findModuleByUser(String username) {
		Map param = new HashMap();
		param.put("username",username);
		return session.selectList("mapper.rbac.findModuleByUser", param);
	}

	
}
