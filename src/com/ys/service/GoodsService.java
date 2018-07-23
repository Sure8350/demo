package com.ys.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ys.dao.GoodsDao;
import com.ys.entity.Goods;
import com.ys.service.exception.GoodsManageException;

@Service
@Transactional(propagation = Propagation.NOT_SUPPORTED, readOnly = true)
public class GoodsService {
	@Resource
	private GoodsDao gdao = null;
	
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = java.lang.Exception.class)
	public void manage( Goods goods){
		gdao.save(goods);
	}
	
	public void checkGoods(Goods goods) throws GoodsManageException{
		Goods g = gdao.findByGoodsName(goods.getGoodsName());
		if(g != null){
			throw new GoodsManageException(goods.getGoodsName()+" 商品已经存在");
		}
	}
	
	public List<Map> findByType(Integer typeId){
		return gdao.findByType(typeId);
	}
	
	public Goods findByGoodsId(Integer goodsId){
		return gdao.findByGoodsId(goodsId);
	}
}
