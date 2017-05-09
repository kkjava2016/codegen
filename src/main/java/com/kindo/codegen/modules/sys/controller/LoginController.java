package com.kindo.codegen.modules.sys.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kindo.codegen.common.config.Globals;
import com.kindo.codegen.common.json.AjaxJson;
import com.kindo.codegen.common.web.BaseController;

/**
 * 登录
 * 
 * @author liujianzhu
 * @date 2017年5月4日 下午3:03:25
 */
@Controller
@RequestMapping("/loginController")
public class LoginController extends BaseController {
	/**
	 * 校验用户名密码及验证码正确性
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "checkuser")
	@ResponseBody
	public AjaxJson checkUser(HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		HttpSession session = request.getSession();
		//
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String randCode = request.getParameter("randCode");
		if(StringUtils.isEmpty(randCode)) {
			j.setMsg("请输入验证码!");
			j.setSuccess(false);
		}
		else if(!randCode.equalsIgnoreCase(String.valueOf(session.getAttribute(Globals.SESSION_RAND_CODE)))) {
			j.setMsg("验证码错误!");
			j.setSuccess(false);
		}
		else {
			//用户名、密码校验 
			//TODO 此处简单测试
			if(!"admin".equals(userName) || !"123456".equals(password)) {
				j.setMsg("用户名或密码错误!");
				j.setSuccess(false);
			}
			else {
				session.setAttribute(Globals.SESSION_USER, userName);
			}
		}
		return j;
	}
	
	/**
	 * 登录
	 * @return
	 */
	@RequestMapping(params="login")
	public String login(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Object curUserName = session.getAttribute(Globals.SESSION_USER);
		if(curUserName != null) {
			return "main/main";
		}
		else
			return "login/login";
	}
}
