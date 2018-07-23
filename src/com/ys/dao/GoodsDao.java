package com.ys.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ys.entity.Goods;

@Repository
public class GoodsDao {
	@Resource(name="sst")
	private SqlSession session =null;
	
	public void save(Goods g){
		session.insert("mapper.goods.save", g);
	}
	
	public Goods findByGoodsName(String goodsName){
		Map param = new HashMap();
		param.put("goodsName", goodsName);
		return session.selectOne("mapper.goods.findByGoodsName", param);
	}
	
	public List<Map> findByType(Integer typeId){
		Map param = new HashMap();
		param.put("type_id", typeId);
		return session.selectList("mapper.goods.findByType", param);
	}
	
	public Goods findByGoodsId(Integer goodsId){
		Map param = new HashMap();
		param.put("goods_id", goodsId);
		return session.selectOne("mapper.goods.findByGoodsId", param);
	}
	
	public void update(Goods g){
		session.update("mapper.goods.update", g);
	}
}
