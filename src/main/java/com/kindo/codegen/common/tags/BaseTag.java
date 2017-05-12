package com.kindo.codegen.common.tags;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;

/**
 * 基础标签
 * 
 * @author liujianzhu
 * @date 2017年5月12日 下午4:14:06
 */
public class BaseTag extends BaseTagSupport {
	private static final long serialVersionUID = 986301308588847197L;
	
	protected String type = "default";// 加载类型，可以多值（以逗号隔开）
	protected String cssTheme = "metrole";//H+风格
	
	@Override
	public int doStartTag() throws JspException {
		return EVAL_PAGE;
	}
	
	@Override
	public int doEndTag() throws JspException {
		JspWriter out = null;
		String types[] = type.split(",");
		try {
			out = this.pageContext.getOut();
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("types", types);
			param.put("cssTheme", cssTheme);
			
			writeTagContent(param, out);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(out!=null){
				try {
					out.clearBuffer();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return EVAL_PAGE;
	}
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getCssTheme() {
		return cssTheme;
	}

	public void setCssTheme(String cssTheme) {
		this.cssTheme = cssTheme;
	}
}
