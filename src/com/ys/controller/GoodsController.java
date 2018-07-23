package com.ys.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;







import java.io.OutputStream;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.ys.entity.Goods;
import com.ys.service.GoodsService;
import com.ys.service.exception.GoodsManageException;

@Controller
@RequestMapping("/goods")
public class GoodsController {
	@Resource
	private GoodsService goodsService = null;
	
	@RequestMapping("/manage")
	public String manage(Goods goods, 
			@RequestParam MultipartFile photo,
			WebRequest request) throws IllegalStateException, IOException{
		String errMessage;
		String dir = "F:/upload_goods/" + goods.getType() + "/";
		File fdir = new File(dir);
		if(!fdir.exists()){
			fdir.mkdir();
		}
		try {
			goodsService.checkGoods(goods);
		} catch (GoodsManageException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.setAttribute("message", e.getMessage(),
					WebRequest.SCOPE_REQUEST);
			return"/admin/manage.jsp";
		}
		//获取上传照片的原始后缀即文件格式
		String photoSuffix = photo.getOriginalFilename().substring(photo.getOriginalFilename().lastIndexOf("."));
		if(!(photoSuffix.equalsIgnoreCase(".jpg") || photoSuffix.equalsIgnoreCase(".jpeg") || photoSuffix.equalsIgnoreCase(".png")) ){
			errMessage = "不是有效的图片格式!";
			request.setAttribute("message", errMessage, WebRequest.SCOPE_REQUEST);
			return "/admin/manage.jsp";
		}
		
		String newPhotoFilePath = dir + goods.getGoodsName() + photoSuffix;
		//指定图片名字
		photo.transferTo(new File(newPhotoFilePath));
		goods.setGoodsPhotoFile(newPhotoFilePath);
		
		goodsService.manage(goods);
		errMessage = "上传成功";
		request.setAttribute("message", errMessage, WebRequest.SCOPE_REQUEST);
		return"/admin/manage.jsp";
	}
	
	@RequestMapping("/apple")
	@ResponseBody
	public String showApple(Integer typeId){
		List<Map> list  = goodsService.findByType(1);
		return new Gson().toJson(list);
	}

	@RequestMapping("/banana")
	@ResponseBody
	public String showBanana(Integer typeId){
		List<Map> list  = goodsService.findByType(2);
		return new Gson().toJson(list);
	}
	
	@RequestMapping("/pear")
	@ResponseBody
	public String showPear(Integer typeId){
		List<Map> list  = goodsService.findByType(3);
		return new Gson().toJson(list);
	}
	
	@RequestMapping("/upload_goods")
	@ResponseBody
	public  String getUploadImage(String filepath , HttpServletResponse response) throws IOException{
		FileInputStream fis = new FileInputStream(filepath);
		OutputStream out = response.getOutputStream();
		int len = 0;
		byte[] bs = new byte[1024];
		while((len = fis.read(bs)) != -1){
			out.write(bs, 0, len);
		}
		fis.close();
		out.flush();
		out.close();
		return null;
	}
}
