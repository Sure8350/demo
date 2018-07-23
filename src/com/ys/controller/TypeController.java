package com.ys.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.ys.service.TypeService;

@Controller
@RequestMapping("/type")
public class TypeController {
	@Resource
	private TypeService typeService = null;
	
	@RequestMapping("/findAll")
	@ResponseBody
	public String findAll(){
		List list = typeService.findAll();
		return new Gson().toJson(list);
	}
}
