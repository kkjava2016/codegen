package com.kindo.codegen.common.tags;

import java.io.Writer;

import javax.servlet.jsp.tagext.TagSupport;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import freemarker.template.Configuration;
import freemarker.template.Template;

/**
 * 所有Tag标签的父类，包括对模板的支持
 * 
 * @author liujianzhu
 * @date 2017年5月12日 下午5:12:12
 */
public class BaseTagSupport extends TagSupport {
	private static final long serialVersionUID = 795528495085546721L;
	private static Logger logger = LoggerFactory.getLogger(BaseTagSupport.class);

	private final static String TPL_DIR = "template"; // 模板目录
	private static Configuration cfg;

	static {
		if(cfg == null) {
			try {
				cfg = new Configuration();
				cfg.setClassForTemplateLoading(BaseTagSupport.class, TPL_DIR);
				cfg.setDefaultEncoding("UTF-8");
			} catch (Exception e) {
				logger.error("freemarker实例初始化失败,原因：" + e.getMessage());
			}
		}
	}
	
	/**
	 * 将标签模板与指定数据模型整合，输出到指定写入源上
	 * 
	 * @param obj	模板数据模型，可以是任意Object
	 * @param out	生成的模板数据输出源
	 * @throws Exception
	 */
	public void writeTagContent(Object obj, Writer out) throws Exception {
		final String tplName = getClass().getSimpleName() + ".ftl";
		// 获取模板文件  
        Template t = cfg.getTemplate(tplName);
        t.process(obj, out); // 往模板里写数据  
	}
}
