package com.kindo.codegen.modules.sys.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	 * 登录
	 * @return
	 */
	@RequestMapping(params="login")
	public String login() {
		return "login/login";
	}
}
