 package com.ys.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ys.entity.User;
import com.ys.service.RBACService;
import com.ys.service.UserService;
import com.ys.service.exception.UserAuthException;

@Controller
@RequestMapping("/")
public class LoginController {
	@Resource
	private UserService userService = null;
	@Resource
	private RBACService rbacService = null;
	
	@SuppressWarnings("rawtypes")
	@RequestMapping("login")
	public ModelAndView login(String username,String password, WebRequest request){
		ModelAndView mav= null;
		try {
			 Map u = userService.checkLogin(username, password);
			 List<Map> pmodules = rbacService.findPromissionByUser(username);
			 //小技巧,把pmodule和loginuser合并
			 u.put("promission", pmodules);
			 System.out.println("登录成功"+u);
			 mav = new ModelAndView("/index.jsp");
			 request.setAttribute("loginuser", u, WebRequest.SCOPE_SESSION);
		} catch (UserAuthException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			if(e.getErrcode().equals(UserAuthException.USER_PASSWORD_ERROR)){
				System.out.println(e.getErrmsg());
			}
			mav = new ModelAndView("/login.jsp");
			//设置返回值
			mav.addObject("errormessage", e.getMessage());
		}
		return mav;
	}
	
	@RequestMapping("logout")
	public ModelAndView logout(String username,String password, WebRequest request){
		request.removeAttribute("loginuser",WebRequest.SCOPE_SESSION);
		request.removeAttribute("current", WebRequest.SCOPE_SESSION);
		return new ModelAndView("redirect:/login.jsp");
	}
	
	@RequestMapping("register")
	public ModelAndView register(String username, String name, String newpassword, String oldpassword){
		ModelAndView mav= null;
		try {
			User u = userService.checkRegister(username, name, newpassword, oldpassword);
			System.out.println("注册 "+u.getUsername()+", "+u.getName()+", "+u.getPassword()+", "+u.getSalt());
			mav = new ModelAndView("/login.jsp");
			mav.addObject("errormessage", "注册成功");
		} catch (UserAuthException e) {
			e.printStackTrace();
			mav = new ModelAndView("/login.jsp");
			mav.addObject("errormessage", e.getMessage());
		}
		return mav;
	}
}
