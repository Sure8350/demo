package com.ys.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;

import com.google.gson.Gson;
import com.ys.entity.Goods;
import com.ys.entity.History;
import com.ys.entity.User;
import com.ys.service.GoodsService;
import com.ys.service.HistoryService;
import com.ys.service.OrderingService;

@Controller
@RequestMapping("/cart")
public class CartController {
	@Resource
	private GoodsService goodsService= null;
	@Resource
	private HistoryService historyService=null;
	@Resource
	private OrderingService orderingService=null;
		
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("/add_cart")
	@ResponseBody
	public String addCart(Integer number ,Integer goodsId,WebRequest request){
		Map message = new HashMap();
		List<Map> current = (List<Map>)request.getAttribute("current", WebRequest.SCOPE_SESSION);
		if(current == null){
			current = new ArrayList();
			
			Goods goods = goodsService.findByGoodsId(goodsId);
			Float price = goods.getPrice();
			
			Map order = new HashMap();
			order.put("goodsname", goods.getGoodsName());
			order.put("goodsId", goods.getGoodsId());
			order.put("goods_photo_file", goods.getGoodsPhotoFile());
			order.put("price", price);
			order.put("number", number);
			order.put("total", price * number);
			
			current.add(order);
			
			request.setAttribute("current", current, WebRequest.SCOPE_SESSION);
			message.put("message", "��ӳɹ�");
			return new Gson().toJson(message);
		}else{
			for (int i=0;i<current.size();i++) {
				Map m = current.get(i);
				
				//��ͬ��Ʒ��������ϲ�����Ƚϣ�С�ڲ����
				if(m.get("goodsId").equals(goodsId)){
					Goods goods = goodsService.findByGoodsId(goodsId);
					
					Integer tmp = (Integer)m.get("number");
					Integer amount = goods.getAmount();
					Integer newNumber = tmp +number;
					if( newNumber.compareTo(amount)>0){
						message.put("message", "�ϴ��������:"+tmp+",�����������:"+number+",�����������:"+amount+",���ʧ��!");
						return new Gson().toJson(message);
					}else{
						Float price = (Float)m.get("price");
						m.put("number", newNumber);
						m.put("total", price * newNumber);
						current.set(i, m);
						
						request.setAttribute("current", current, WebRequest.SCOPE_SESSION);
						message.put("message", "��ӳɹ�");
						return new Gson().toJson(message);
					}
				}
			}
			//û�з��־���ƷId���������ƷId
			Goods goods = goodsService.findByGoodsId(goodsId);
			Float price = goods.getPrice();
			
			Map order = new HashMap();
			order.put("goodsname", goods.getGoodsName());
			order.put("goodsId", goods.getGoodsId());
			order.put("goods_photo_file", goods.getGoodsPhotoFile());
			order.put("price", price);
			order.put("number", number);
			order.put("total", price * number);
			current.add(order);
			
			request.setAttribute("current", current, WebRequest.SCOPE_SESSION);
			message.put("message", "��ӳɹ�");
			return new Gson().toJson(message);
		}
	}
	
	@RequestMapping("/current")
	@ResponseBody
	public String current(WebRequest request){
		List<Map> current = (List<Map>)request.getAttribute("current", WebRequest.SCOPE_SESSION);
		//sessionΪ�յ�ʱ�򷵻�ָ��jsonʹdatagrid�ܹ�ˢ��Ϊ��,���򷵻�null����ʹҳ��ˢ��
		if(current==null){
			String nullJson= "{\"total\":0,\"rows\":[{}]}";
			return nullJson;
		}
		return new Gson().toJson(current);
	}	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("/pay")
	@ResponseBody
	public String pay(History history, WebRequest request){
		Map message = new HashMap();
		Map user = (Map)request.getAttribute("loginuser", WebRequest.SCOPE_SESSION);
		List<Map> current = (List<Map>)request.getAttribute("current", WebRequest.SCOPE_SESSION);
		if(current ==null){
			message.put("message", "���Ĺ��ﳵ�ܿգ�");
			return new Gson().toJson(message);
		}
		history.setUserId((Integer)user.get("user_id"));
		historyService.save(history,current);
		request.removeAttribute("current", WebRequest.SCOPE_SESSION);
		message.put("message", "����Ǯ��Ҳ���򵽶�����");
		return new Gson().toJson(message);
	}
	
	@RequestMapping("/history")
	@ResponseBody
	public String history(WebRequest request){
		Map user = (Map)request.getAttribute("loginuser", WebRequest.SCOPE_SESSION);
		Integer userId =  (Integer)user.get("user_id");
		List<Map> list = historyService.findByUserId(userId);
		//����json�����ڸ�ʽ��
		DateFormat df =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date;
		String format;
		for (int i = 0; i < list.size(); i++) {
			Map m = list.get(i);
			date = (Date)m.get("date"); 
			format = df.format(date);
			m.put("date", format);
		}
		return new Gson().toJson(list);
	}
	
	@RequestMapping("/orderingInfo")
	@ResponseBody
	public String orderingInfo(Integer historyId){
		List<Map> list = orderingService.findOrderingByHistoryId(historyId);
		if(list==null){
			String nullJson= "{\"total\":0,\"rows\":[{}]}";
			return nullJson;
		}
		return new Gson().toJson(list);
	}
}
