package com.ys.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ys.dao.GoodsDao;
import com.ys.dao.HistoryDao;
import com.ys.dao.OrderingDao;
import com.ys.entity.Goods;
import com.ys.entity.History;
import com.ys.entity.Ordering;

@Service
@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
public class HistoryService {
	@Resource
	private HistoryDao historyDao =null;
	
	@Resource
	private OrderingDao orderingDao=null;
	
	@Resource
	private GoodsDao goodsDao =null;
	
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=java.lang.Exception.class)
	public void save(History history,List<Map> current){
		history.setDate(new Date());
		historyDao.save(history);
		for (Map m : current) {
			Ordering o = new Ordering();
			Integer goodsId= (Integer)m.get("goodsId");
			Integer number = (Integer)m.get("number");
			o.setGoodsId(goodsId);
			o.setGoodsName((String)m.get("goodsname"));
			o.setPrice((Float)m.get("price"));
			o.setNumber(number);
			o.setTotal((Float)m.get("total"));
			o.setHistoryId(history.getHistoryId());
			
			Goods g = goodsDao.findByGoodsId(goodsId);
			
			Integer newAmount = g.getAmount()- number;
			g.setAmount(newAmount);
			goodsDao.update(g);
			orderingDao.save(o);
		}
	}
	
	public List<Map> findByUserId(Integer userId){
		return historyDao.findByUserId(userId);
	}
}
