package com.ys.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ys.dao.TypeDao;

@Service
public class TypeService {
	@Resource
	private TypeDao typeDao = null;
	
	public List<Map> findAll(){
		return typeDao.findAll();
	}
}
