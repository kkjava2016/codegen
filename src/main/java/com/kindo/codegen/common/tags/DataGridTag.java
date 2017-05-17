package com.kindo.codegen.common.tags;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.kindo.codegen.common.tags.vo.ColumnValue;
import com.kindo.codegen.common.tags.vo.DataGridColumn;
import com.kindo.codegen.common.tags.vo.DataGridUrl;
import com.kindo.codegen.common.tags.vo.OptTypeDirection;

/**
 * 类描述：DATAGRID标签处理类
 * 
 * 原类：org.jeecgframework.tag.core.easyui.DataGridTag
 * 
 * @author 张代浩 @date： 日期：2012-12-7 时间：上午10:17:45
 * @version 1.0
 * 
 * updated by 
 * -------------------------------------- 
 * liujianzhu 部分精简  2017年5月15日 下午4:37:24
 */
public class DataGridTag extends BaseTagSupport {
	private final Logger logger = LoggerFactory.getLogger(getClass());
	private String fields = "";// 显示字段
	private String searchFields = "";// 查询字段 Author:qiulu Date:20130618
										// for：添加对区间查询的支持
	private String name;// 表格标示
	private String title;// 表格标示
	private String idField = "id";// 主键字段
	private boolean treegrid = false;// 是否是树形列表
	private List<DataGridUrl> urlList = new ArrayList<DataGridUrl>();// 列表操作显示
	private List<DataGridUrl> toolBarList = new ArrayList<DataGridUrl>();// 工具条列表
	private List<DataGridColumn> columnList = new ArrayList<DataGridColumn>();// 列表操作显示
	private List<ColumnValue> columnValueList = new ArrayList<ColumnValue>();// 值替换集合
	private List<ColumnValue> columnStyleList = new ArrayList<ColumnValue>();// 颜色替换集合
	private Map<String, Object> map;// 封装查询条件
	private String actionUrl;// 分页提交路径
	private int allCount;
	private int curPageNo;
	private int pageSize = 10;
	private boolean pagination = true;// 是否显示分页
	private String width;
	private String height;
	private boolean checkbox = false;// 是否显示复选框
	private boolean showPageList = true;// 定义是否显示页面列表
	private boolean openFirstNode = false;// 是不是展开第一个节点
	private boolean fit = true;// 是否允许表格自动缩放，以适应父容器
	private boolean fitColumns = true;// 当为true时，自动展开/合同列的大小，以适应的宽度，防止横向滚动.
	private String sortName;// 定义的列进行排序
	private String sortOrder = "asc";// 定义列的排序顺序，只能是"递增"或"降序".
	private boolean showRefresh = true;// 定义是否显示刷新按钮
	private boolean showText = true;// 定义是否显示刷新按钮
	private String style = "easyui";// 列表样式easyui,datatables
	private String onLoadSuccess;// 数据加载完成调用方法
	private String onClick;// 单击事件调用方法
	private String onDblClick;// 双击事件调用方法
	private String queryMode = "single";// 查询模式
	private String entityName;// 对应的实体对象
	private String rowStyler;// rowStyler函数
	private String extendParams;// 扩展参数,easyui有的,但是jeecg没有的参数进行扩展
	private boolean autoLoadData = true; // 列表是否自动加载数据
	// private boolean frozenColumn=false; // 是否是冰冻列 默认不是
	private String langArg;
	private Boolean singleSelect;// 是否单选true,false
	private String cssTheme;
	private boolean isShowSearch = false;// 检索区域是否可收缩
	private boolean queryBuilder = false;// 高级查询器

	@Override
	public int doStartTag() throws JspException {
		return EVAL_PAGE;
	}

	@Override
	public int doEndTag() throws JspException {
		JspWriter out = null;
		try {
			out = this.pageContext.getOut();
			writeTagContent(this, out);
		} catch(Exception e) {
			logger.error("DataGridTag标签内容展示出错!", e);
		} finally {
			if(out!=null){
				try {
					out.clearBuffer();
					// 清空资源
					urlList.clear();
					toolBarList.clear();
					columnValueList.clear();
					columnStyleList.clear();
					columnList.clear();
					fields = "";
					searchFields = "";
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return EVAL_PAGE;
	}
	
	/**
	 * 设置询问操作URL
	 * @param urlfont 
	 * @param urlclass 
	 */
	public void setConfUrl(String url, String title, String message, String exp,String operationCode, 
			String urlStyle, String urlclass, String urlfont) {
		DataGridUrl dataGridUrl = new DataGridUrl();
		dataGridUrl.setTitle(title);
		dataGridUrl.setUrl(url);
		dataGridUrl.setType(OptTypeDirection.Confirm);
		dataGridUrl.setMessage(message);
		dataGridUrl.setExp(exp);
		dataGridUrl.setUrlStyle(urlStyle);
		dataGridUrl.setUrlclass(urlclass);
		dataGridUrl.setUrlfont(urlfont);
		installOperationCode(dataGridUrl, operationCode,urlList);
	}
	
	/**
	 * 设置删除操作URL
	 */
	public void setDelUrl(String url, String title, String message, String exp, String funname, String operationCode, 
			String urlStyle,String urlclass,String urlfont) {
		DataGridUrl dataGridUrl = new DataGridUrl();
		dataGridUrl.setTitle(title);
		dataGridUrl.setUrl(url);
		dataGridUrl.setType(OptTypeDirection.Del);
		dataGridUrl.setMessage(message);
		dataGridUrl.setExp(exp);
		dataGridUrl.setFunname(funname);
		dataGridUrl.setUrlStyle(urlStyle);
		dataGridUrl.setUrlclass(urlclass);
		dataGridUrl.setUrlfont(urlfont);

		installOperationCode(dataGridUrl, operationCode,urlList);
	}
	
	/**
	 * 设置默认操作URL
	 */
	public void setDefUrl(String url, String title, String exp,String operationCode, String urlStyle) {
		DataGridUrl dataGridUrl = new DataGridUrl();
		dataGridUrl.setTitle(title);
		dataGridUrl.setUrl(url);
		dataGridUrl.setType(OptTypeDirection.Deff);
		dataGridUrl.setExp(exp);
		dataGridUrl.setUrlStyle(urlStyle);
		installOperationCode(dataGridUrl, operationCode,urlList);
	}
	
	/**
	 * 设置工具条
	 * @param height2 
	 * @param width2 
	 */
	public void setToolbar(String url, String title, String icon, String exp,String onclick, String funname,
			String operationCode, String width2, String height2) {
		DataGridUrl dataGridUrl = new DataGridUrl();
		dataGridUrl.setTitle(title);
		dataGridUrl.setUrl(url);
		dataGridUrl.setType(OptTypeDirection.ToolBar);
		dataGridUrl.setIcon(icon);
		dataGridUrl.setOnclick(onclick);
		dataGridUrl.setExp(exp);
		dataGridUrl.setFunname(funname);
		dataGridUrl.setWidth(String.valueOf(width2));
		dataGridUrl.setHeight(String.valueOf(height2));
		installOperationCode(dataGridUrl, operationCode,toolBarList);
	}
	
	/**
	 * 设置自定义函数操作URL
	 */
	public void setFunUrl(String title, String exp, String funname,String operationCode, String urlStyle,
			String urlclass,String urlfont) {
		DataGridUrl dataGridUrl = new DataGridUrl();
		dataGridUrl.setTitle(title);
		dataGridUrl.setType(OptTypeDirection.Fun);
		dataGridUrl.setExp(exp);
		dataGridUrl.setFunname(funname);
		dataGridUrl.setUrlStyle(urlStyle);
		dataGridUrl.setUrlclass(urlclass);
		dataGridUrl.setUrlfont(urlfont);

		installOperationCode(dataGridUrl, operationCode,urlList);
	}
	
	/**
	 * 设置自定义函数操作URL
	 */
	public void setOpenUrl(String url, String title, String width, String height, String exp,String operationCode, 
			String openModel, String urlStyle) {
		DataGridUrl dataGridUrl = new DataGridUrl();
		dataGridUrl.setTitle(title);
		dataGridUrl.setUrl(url);
		dataGridUrl.setWidth(width);
		dataGridUrl.setHeight(height);
		dataGridUrl.setType(OptTypeDirection.valueOf(openModel));
		dataGridUrl.setExp(exp);
		dataGridUrl.setUrlStyle(urlStyle);
		installOperationCode(dataGridUrl, operationCode,urlList);
	}
	
	/**
	 * 
	 * <b>Summary: </b> setColumn(设置字段)
	 * 
	 * @param dataGridColumn
	 */
	public void setColumn(DataGridColumn dataGridColumn) {
		columnList.add(dataGridColumn);
		
		//TODO 根据operationCode判断字段权限
		
		//字段拼接
		String field = dataGridColumn.getField();
		if (field != "opt") {
			fields += field + ",";
			if ("group".equals(queryMode)) {
				searchFields += field + "," + field + "_begin," + field + "_end,";
			} else {
				searchFields += field + ",";
			}
		}
		
		//replace属性，格式:key1_value1,key2_value2,key3_value3,...
		String replace = dataGridColumn.getReplace();
		if(StringUtils.isNotEmpty(replace)) {
			String[] items = replace.split(",");
			String text = "";
			String value = "";
			for(String item : items) {
				if(StringUtils.isNotEmpty(item)) {
					String[] kvs = item.split("_");
					text += kvs[0] + ",";
					value += kvs[1] + ",";
				}
			}
			setColumn(field, text, value);
		}
		
		//TODO 按字典查找
		String dictionary = dataGridColumn.getDictionary();
		if(StringUtils.isNotEmpty(dictionary)) {
			
		}
		
		//Column列样式
		if(StringUtils.isNotEmpty(style)) {
			String[] items = style.split(",");
			String text = "";
			String value = "";
			if(items.length == 1 && items[0].indexOf("_") == -1) {
				text = items[0];
			} else {
				for(String item : items) {
					if(StringUtils.isNotEmpty(item)) {
						String[] kvs = item.split("_");
						text += kvs[0] + ",";
						value += kvs[1] + ",";
					}
				}
			}
			setStyleColumn(field, text, value);
		}
	}
	
	/**
	 * 
	 * <b>Summary: </b> setColumn(设置字段替换值)
	 * 
	 * @param name
	 * @param text
	 * @param value
	 */
	public void setColumn(String name, String text, String value) {
		ColumnValue columnValue = new ColumnValue();
		columnValue.setName(name);
		columnValue.setText(text);
		columnValue.setValue(value);
		columnValueList.add(columnValue);
	}
	
	/**
	 * 设置 颜色替换值
	 * @param field
	 * @param text
	 * @param value
	 */
	private void setStyleColumn(String field, String text, String value) {
		ColumnValue columnValue = new ColumnValue();
		columnValue.setName(field);
		columnValue.setText(text);
		columnValue.setValue(value);
		columnStyleList.add(columnValue);
	}
	
	/**
	 * 描述：组装菜单按钮操作权限
	 * dateGridUrl：url
	 * operationCode：操作码
	 * optList： 操作列表
	 * @version 1.0
	 */
	private void installOperationCode(DataGridUrl dataGridUrl,String operationCode,List<DataGridUrl> optList){
		if(StringUtils.isNotEmpty(operationCode)) {
			//TODO 权限判断
		}
		else {
			optList.add(dataGridUrl);
		}
	}

	public String getFields() {
		return fields;
	}

	public void setFields(String fields) {
		this.fields = fields;
	}

	public String getSearchFields() {
		return searchFields;
	}

	public void setSearchFields(String searchFields) {
		this.searchFields = searchFields;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getIdField() {
		return idField;
	}

	public void setIdField(String idField) {
		this.idField = idField;
	}

	public boolean isTreegrid() {
		return treegrid;
	}

	public void setTreegrid(boolean treegrid) {
		this.treegrid = treegrid;
	}

	public List<DataGridUrl> getUrlList() {
		return urlList;
	}

	public void setUrlList(List<DataGridUrl> urlList) {
		this.urlList = urlList;
	}

	public List<DataGridUrl> getToolBarList() {
		return toolBarList;
	}

	public void setToolBarList(List<DataGridUrl> toolBarList) {
		this.toolBarList = toolBarList;
	}

	public List<DataGridColumn> getColumnList() {
		return columnList;
	}

	public void setColumnList(List<DataGridColumn> columnList) {
		this.columnList = columnList;
	}

	public List<ColumnValue> getColumnValueList() {
		return columnValueList;
	}

	public void setColumnValueList(List<ColumnValue> columnValueList) {
		this.columnValueList = columnValueList;
	}

	public List<ColumnValue> getColumnStyleList() {
		return columnStyleList;
	}

	public void setColumnStyleList(List<ColumnValue> columnStyleList) {
		this.columnStyleList = columnStyleList;
	}

	public Map<String, Object> getMap() {
		return map;
	}

	public void setMap(Map<String, Object> map) {
		this.map = map;
	}

	public String getActionUrl() {
		return actionUrl;
	}

	public void setActionUrl(String actionUrl) {
		this.actionUrl = actionUrl;
	}

	public int getAllCount() {
		return allCount;
	}

	public void setAllCount(int allCount) {
		this.allCount = allCount;
	}

	public int getCurPageNo() {
		return curPageNo;
	}

	public void setCurPageNo(int curPageNo) {
		this.curPageNo = curPageNo;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public boolean isPagination() {
		return pagination;
	}

	public void setPagination(boolean pagination) {
		this.pagination = pagination;
	}

	public String getWidth() {
		return width;
	}

	public void setWidth(String width) {
		this.width = width;
	}

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

	public boolean isCheckbox() {
		return checkbox;
	}

	public void setCheckbox(boolean checkbox) {
		this.checkbox = checkbox;
	}

	public boolean isShowPageList() {
		return showPageList;
	}

	public void setShowPageList(boolean showPageList) {
		this.showPageList = showPageList;
	}

	public boolean isOpenFirstNode() {
		return openFirstNode;
	}

	public void setOpenFirstNode(boolean openFirstNode) {
		this.openFirstNode = openFirstNode;
	}

	public boolean isFit() {
		return fit;
	}

	public void setFit(boolean fit) {
		this.fit = fit;
	}

	public boolean isFitColumns() {
		return fitColumns;
	}

	public void setFitColumns(boolean fitColumns) {
		this.fitColumns = fitColumns;
	}

	public String getSortName() {
		return sortName;
	}

	public void setSortName(String sortName) {
		this.sortName = sortName;
	}

	public String getSortOrder() {
		return sortOrder;
	}

	public void setSortOrder(String sortOrder) {
		this.sortOrder = sortOrder;
	}

	public boolean isShowRefresh() {
		return showRefresh;
	}

	public void setShowRefresh(boolean showRefresh) {
		this.showRefresh = showRefresh;
	}

	public boolean isShowText() {
		return showText;
	}

	public void setShowText(boolean showText) {
		this.showText = showText;
	}

	public String getStyle() {
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	public String getOnLoadSuccess() {
		return onLoadSuccess;
	}

	public void setOnLoadSuccess(String onLoadSuccess) {
		this.onLoadSuccess = onLoadSuccess;
	}

	public String getOnClick() {
		return onClick;
	}

	public void setOnClick(String onClick) {
		this.onClick = onClick;
	}

	public String getOnDblClick() {
		return onDblClick;
	}

	public void setOnDblClick(String onDblClick) {
		this.onDblClick = onDblClick;
	}

	public String getQueryMode() {
		return queryMode;
	}

	public void setQueryMode(String queryMode) {
		this.queryMode = queryMode;
	}

	public String getEntityName() {
		return entityName;
	}

	public void setEntityName(String entityName) {
		this.entityName = entityName;
	}

	public String getRowStyler() {
		return rowStyler;
	}

	public void setRowStyler(String rowStyler) {
		this.rowStyler = rowStyler;
	}

	public String getExtendParams() {
		return extendParams;
	}

	public void setExtendParams(String extendParams) {
		this.extendParams = extendParams;
	}

	public boolean isAutoLoadData() {
		return autoLoadData;
	}

	public void setAutoLoadData(boolean autoLoadData) {
		this.autoLoadData = autoLoadData;
	}

	public String getLangArg() {
		return langArg;
	}

	public void setLangArg(String langArg) {
		this.langArg = langArg;
	}

	public Boolean getSingleSelect() {
		return singleSelect;
	}

	public void setSingleSelect(Boolean singleSelect) {
		this.singleSelect = singleSelect;
	}

	public String getCssTheme() {
		return cssTheme;
	}

	public void setCssTheme(String cssTheme) {
		this.cssTheme = cssTheme;
	}

	public boolean isShowSearch() {
		return isShowSearch;
	}

	public void setShowSearch(boolean isShowSearch) {
		this.isShowSearch = isShowSearch;
	}

	public boolean isQueryBuilder() {
		return queryBuilder;
	}

	public void setQueryBuilder(boolean queryBuilder) {
		this.queryBuilder = queryBuilder;
	}

	private static final long serialVersionUID = -1396314383716969542L;
}
