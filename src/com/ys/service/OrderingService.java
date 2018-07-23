package com.ys.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ys.dao.OrderingDao;

@Service
@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
public class OrderingService {
	@Resource
	private OrderingDao orderingDao=null;
	
	public List<Map>  findOrderingByHistoryId(Integer historyId){
		return orderingDao.findByOrderHistoryId(historyId);
	}
}
