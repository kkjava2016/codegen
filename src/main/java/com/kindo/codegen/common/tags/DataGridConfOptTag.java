package com.kindo.codegen.common.tags;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.tagext.Tag;
import javax.servlet.jsp.tagext.TagSupport;

/**
 * 
 * 类描述：列表字段处理项目
 * 
 * 原类：org.jeecgframework.tag.core.easyui.DataGridConfOptTag
 * 
 * 张代浩
 * @date： 日期：2012-12-7 时间：上午10:17:45
 * @version 1.0
 * 
 * updated by
 * --------------------------------------
 * liujianzhu   部分精简   2017年5月15日 下午7:40:13
 */
public class DataGridConfOptTag extends TagSupport {
	private static final long serialVersionUID = -5263630476671886389L;
	
	protected String url;
	protected String title;
	private String message;//询问链接的提示语
	private String exp;//判断链接是否显示的表达式
	private String operationCode;//按钮的操作Code
	private String urlStyle;//样式
	private String urlclass;//自定义按钮样式
	private String urlfont;//自定义按钮图标样式

	public int doStartTag() throws JspTagException {
		return EVAL_PAGE;
	}
	
	@Override
	public int doEndTag() throws JspException {
		Tag t = getParent();
		if(t instanceof DataGridTag) {
			DataGridTag parent = (DataGridTag) t;
			parent.setConfUrl(url, title, message, exp, operationCode, urlStyle, urlclass, urlfont);
		}
		return EVAL_PAGE;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getExp() {
		return exp;
	}

	public void setExp(String exp) {
		this.exp = exp;
	}

	public String getOperationCode() {
		return operationCode;
	}

	public void setOperationCode(String operationCode) {
		this.operationCode = operationCode;
	}

	public String getUrlStyle() {
		return urlStyle;
	}

	public void setUrlStyle(String urlStyle) {
		this.urlStyle = urlStyle;
	}

	public String getUrlclass() {
		return urlclass;
	}

	public void setUrlclass(String urlclass) {
		this.urlclass = urlclass;
	}

	public String getUrlfont() {
		return urlfont;
	}

	public void setUrlfont(String urlfont) {
		this.urlfont = urlfont;
	}
}
