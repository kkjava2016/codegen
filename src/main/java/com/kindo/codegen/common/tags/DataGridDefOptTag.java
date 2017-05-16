package com.kindo.codegen.common.tags;

import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.tagext.Tag;
import javax.servlet.jsp.tagext.TagSupport;

/**
 * 
 * 类描述：列表默认操作项标签
 * 
 * 张代浩
 * @date： 日期：2012-12-7 时间：上午10:17:45
 * @version 1.0
 * 
 * updated by
 * --------------------------------------
 * liujianzhu   部分精简   2017年5月15日 下午7:40:13
 */
public class DataGridDefOptTag extends TagSupport {
	private static final long serialVersionUID = -4522459986758651976L;

	protected String url;
	protected String title;
	private String exp;//判断链接是否显示的表达式
	private String operationCode;//按钮的操作Code
	private String urlStyle;//样式
	
	public int doStartTag() throws JspTagException {
		return EVAL_PAGE;
	}
	
	public int doEndTag() throws JspTagException {
		Tag t = getParent();
		if(t instanceof DataGridTag) {
			DataGridTag parent = (DataGridTag) t;
			parent.setDefUrl(url, title, exp, operationCode, urlStyle);
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
}
