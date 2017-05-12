package com.kindo.codegen.test.tags;

import java.io.PrintWriter;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;

import org.junit.Test;

import com.kindo.codegen.common.tags.BaseTag;

import junit.framework.TestCase;

/**
 * 标签测试类
 * 
 * @author liujianzhu
 * @date 2017年5月12日 下午5:55:37
 */
public class TagsTest extends TestCase {
	
	/**
	 * BaseTag基础标签
	 * @throws Exception
	 */
	@Test
	public void testBaseTag() throws Exception{
		BaseTag tag = new BaseTag();
		Writer out = new PrintWriter(System.out);
		Map<String, Object> map = new HashMap<String, Object>();
		String type = "jquery,easyui";
		String types[] = type.split(",");
		map.put("types", types);
		map.put("cssTheme", "Test");
		tag.writeTagContent(map, out);
	}

}
