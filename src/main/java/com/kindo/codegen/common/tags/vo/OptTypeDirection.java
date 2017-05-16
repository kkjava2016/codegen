package com.kindo.codegen.common.tags.vo;

/**
 * 列表操作类型
 */
public enum OptTypeDirection {
	Deff,		/*默认操作*/
	Del,		/*删除操作*/
	Fun,		/*自定义函数操作*/
	OpenWin,	/*弹出窗口操作*/
	Confirm, 	/*询问操作*/
	ToolBar, 	/*工具条*/
	OpenTab	 	/*新开标签页操作*/
}
