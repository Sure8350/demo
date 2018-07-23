package com.ys.common;

import org.apache.commons.codec.digest.DigestUtils;

public class KeyDigestUtils {
	
	public static String encrypt(String source, String salt){
		String saltValue = source + salt;
		DigestUtils du = new DigestUtils();
		String ret = du.md5Hex(du.sha1Hex(saltValue));
		return ret;
	}
}
