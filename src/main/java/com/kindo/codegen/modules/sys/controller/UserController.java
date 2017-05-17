package com.kindo.codegen.modules.sys.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kindo.codegen.common.web.BaseController;

/**
 * 用户管理controller控制器实现类
 * 
 * @author liujianzhu
 * @date 2017年5月11日 下午4:41:47
 */
@Controller
@RequestMapping("/userController")
public class UserController extends BaseController {
	/**基础路径*/
	private final static String BASE_PATH = "modules/sys/";
	
	/**
	 * 用户列表页面跳转
	 * @return
	 */
	@RequestMapping(params = "user")
	public String user() {
		//TODO 处理
		return BASE_PATH + "user/userList";
	}
	
	/**
	 * 用户列表请求数据
	 * @param request
	 */
	@RequestMapping(params = "datagrid")
	@ResponseBody
	public String datagrid(HttpServletRequest request) {
		String results = "{\"total\":20,"
				+"\"rows\":["
				+"	{\"id\":\"10001\",\"userName\":\"user001\",\"departName\":\"技术部\",\"realName\":\"测试用户01\",\"userKey\":\"员工\",\"status\":\"0\"},"
				+"	{\"id\":\"10002\",\"userName\":\"user002\",\"departName\":\"技术部\",\"realName\":\"测试用户02\",\"userKey\":\"员工\",\"status\":\"0\"},"
				+"	{\"id\":\"10003\",\"userName\":\"user003\",\"departName\":\"技术部\",\"realName\":\"测试用户03\",\"userKey\":\"员工\",\"status\":\"0\"},"
				+"	{\"id\":\"10004\",\"userName\":\"user004\",\"departName\":\"技术部\",\"realName\":\"测试用户04\",\"userKey\":\"员工\",\"status\":\"0\"},"
				+"	{\"id\":\"10005\",\"userName\":\"user005\",\"departName\":\"技术部\",\"realName\":\"测试用户05\",\"userKey\":\"员工\",\"status\":\"0\"},"
				+"	{\"id\":\"10006\",\"userName\":\"user006\",\"departName\":\"技术部\",\"realName\":\"测试用户06\",\"userKey\":\"员工\",\"status\":\"1\"},"
				+"	{\"id\":\"10007\",\"userName\":\"user007\",\"departName\":\"技术部\",\"realName\":\"测试用户07\",\"userKey\":\"员工\",\"status\":\"1\"},"
				+"	{\"id\":\"10008\",\"userName\":\"user008\",\"departName\":\"技术部\",\"realName\":\"测试用户08\",\"userKey\":\"员工\",\"status\":\"1\"},"
				+"	{\"id\":\"10009\",\"userName\":\"user009\",\"departName\":\"技术部\",\"realName\":\"测试用户09\",\"userKey\":\"员工\",\"status\":\"1\"},"
				+"	{\"id\":\"10010\",\"userName\":\"user010\",\"departName\":\"技术部\",\"realName\":\"测试用户10\",\"userKey\":\"员工\",\"status\":\"1\"},"
				+"	{\"id\":\"10011\",\"userName\":\"user011\",\"departName\":\"技术部\",\"realName\":\"测试用户11\",\"userKey\":\"员工\",\"status\":\"1\"},"
				+"	{\"id\":\"10012\",\"userName\":\"user012\",\"departName\":\"技术部\",\"realName\":\"测试用户12\",\"userKey\":\"员工\",\"status\":\"1\"},"
				+"	{\"id\":\"10013\",\"userName\":\"user013\",\"departName\":\"技术部\",\"realName\":\"测试用户13\",\"userKey\":\"员工\",\"status\":\"1\"},"
				+"	{\"id\":\"10014\",\"userName\":\"user014\",\"departName\":\"技术部\",\"realName\":\"测试用户14\",\"userKey\":\"员工\",\"status\":\"1\"},"
				+"	{\"id\":\"10015\",\"userName\":\"user015\",\"departName\":\"技术部\",\"realName\":\"测试用户15\",\"userKey\":\"员工\",\"status\":\"1\"},"
				+"	{\"id\":\"10016\",\"userName\":\"user016\",\"departName\":\"技术部\",\"realName\":\"测试用户16\",\"userKey\":\"员工\",\"status\":\"1\"},"
				+"	{\"id\":\"10017\",\"userName\":\"user017\",\"departName\":\"技术部\",\"realName\":\"测试用户17\",\"userKey\":\"员工\",\"status\":\"1\"},"
				+"	{\"id\":\"10018\",\"userName\":\"user018\",\"departName\":\"技术部\",\"realName\":\"测试用户18\",\"userKey\":\"员工\",\"status\":\"1\"},"
				+"	{\"id\":\"10019\",\"userName\":\"user019\",\"departName\":\"技术部\",\"realName\":\"测试用户19\",\"userKey\":\"员工\",\"status\":\"1\"},"
				+"	{\"id\":\"10020\",\"userName\":\"user020\",\"departName\":\"技术部\",\"realName\":\"测试用户20\",\"userKey\":\"员工\",\"status\":\"1\"} "
				+"]"
				+"}";
		return results;
	}
}
