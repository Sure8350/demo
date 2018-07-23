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
			throw new UserAuthException(UserAuthException.USER_NOT_FOUND_ERROR, "�û���������");
		}
		//(String) �������String���󣬻ᷢ��ClassCastException
		//toString() ����Ϊ�յĻ���NullPointerException
		//String.valueOf() ������null�����ת��Ϊnull
		String encpassword = u.get("password").toString();
		String salt = String.valueOf(u.get("salt"));
		String encPassword_s = KeyDigestUtils.encrypt(password, salt);
		if(encpassword.equals(encPassword_s) == false){
			throw new UserAuthException(UserAuthException.USER_PASSWORD_ERROR, "�û������������������");
		} 
		return u;
	}
	
	//ע��
	public User checkRegister(String username, String name, String newpassword, String oldpassword) throws UserAuthException{
		Map u = udao.findByUsername(username);
		if(username.equals("")  || name.equals("") || newpassword.equals("") || oldpassword.equals("")){
			throw new UserAuthException(UserAuthException.INPUT_NULL, "ע����Ϣ�п�ȱ");
		}else if(u!=null){
			throw new UserAuthException(UserAuthException.USER_FOUND_ERROR, "�û����Ѿ�����");
		}else if(!newpassword.equals(oldpassword)){
			throw new UserAuthException(UserAuthException.PASSWORD_NOT_SAME, "�������벻һ��");
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
		//ע����û������ο�
		RoleUser ru = new RoleUser();
		ru.setUserId(user.getUserId());
		ru.setRoleId(2);
		roleUserDao.save(ru);
		
		return user;
	}
}
