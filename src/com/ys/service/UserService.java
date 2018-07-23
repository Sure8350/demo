package com.ys.service;

import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ys.common.KeyDigestUtils;
import com.ys.dao.RoleUserDao;
import com.ys.dao.UserDao;
import com.ys.entity.RoleUser;
import com.ys.entity.User;
import com.ys.service.exception.UserAuthException;

@Service
public class UserService {
	@Resource
	private UserDao udao = null;
	@Resource
	private RoleUserDao roleUserDao = null;

	public Map checkLogin(String username, String password) throws UserAuthException {
		Map u = udao.findByUsername(username);
		if (u == null) {
			throw new UserAuthException(UserAuthException.USER_NOT_FOUND_ERROR, "用户名不存在");
		}
		//(String) 如果不是String对象，会发生ClassCastException
		//toString() 对象为空的话，NullPointerException
		//String.valueOf() 不担心null情况，转换为null
		String encpassword = u.get("password").toString();
		String salt = String.valueOf(u.get("salt"));
		String encPassword_s = KeyDigestUtils.encrypt(password, salt);
		if(encpassword.equals(encPassword_s) == false){
			throw new UserAuthException(UserAuthException.USER_PASSWORD_ERROR, "用户密码错误，请重新输入");
		} 
		return u;
	}
	
	//注册
	public User checkRegister(String username, String name, String newpassword, String oldpassword) throws UserAuthException{
		Map u = udao.findByUsername(username);
		if(username.equals("")  || name.equals("") || newpassword.equals("") || oldpassword.equals("")){
			throw new UserAuthException(UserAuthException.INPUT_NULL, "注册信息有空缺");
		}else if(u!=null){
			throw new UserAuthException(UserAuthException.USER_FOUND_ERROR, "用户名已经存在");
		}else if(!newpassword.equals(oldpassword)){
			throw new UserAuthException(UserAuthException.PASSWORD_NOT_SAME, "输入密码不一致");
		}
		
		Integer saltInt = new Random().nextInt(1000) +1;
		String salt = String.valueOf(saltInt);
		String newpwd = KeyDigestUtils.encrypt(newpassword, salt);
		
		User user = new User();
		user.setUsername(username);
		user.setName(name);
		user.setPassword(newpwd);
		user.setSalt(saltInt);
		udao.save(user);
		//注册的用户都是游客
		RoleUser ru = new RoleUser();
		ru.setUserId(user.getUserId());
		ru.setRoleId(2);
		roleUserDao.save(ru);
		
		return user;
	}
}
