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
		//���ҵ�ģ�飬�ڱ���ģ������Ĺ���
		List<Map> pmodules = rbacDao.findModuleByUser(username);
		for (Map m : pmodules) {
			//pmodules������keyֵ: module_id,module_name
			List<Map> pfunctions = rbacDao.findFunctionByUser(username, (Integer)m.get("module_id"));
			//�ؼ��� list<map>�����ڷ�һ��list<map> ����index.jspҳ���ȡurl
			m.put("functions", pfunctions);
		}
		return pmodules;
	}

}
