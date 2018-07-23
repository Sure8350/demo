package com.ys.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ys.dao.RBACDao;


@Service
public class RBACService {
	@Resource
	private RBACDao rbacDao = null;
	
	public List<Map> findPromissionByUser(String username){
		//先找到模块，在遍历模块下面的功能
		List<Map> pmodules = rbacDao.findModuleByUser(username);
		for (Map m : pmodules) {
			//pmodules的两个key值: module_id,module_name
			List<Map> pfunctions = rbacDao.findFunctionByUser(username, (Integer)m.get("module_id"));
			//关键点 list<map>里面在放一个list<map> 方便index.jsp页面获取url
			m.put("functions", pfunctions);
		}
		return pmodules;
	}

}
