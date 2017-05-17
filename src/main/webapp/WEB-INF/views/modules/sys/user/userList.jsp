<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" uri="/easyui-tags"%>
<html>
<head>
    <meta charset="utf-8">
    <t:base type="jquery,easyui,tools,DatePicker"></t:base>
</head>
<body>
	<t:datagrid name="userList" title="操作" actionUrl="userController.do?datagrid" fit="true" fitColumns="true" idField="id" queryMode="group" sortName="id" sortOrder="desc">
		<t:dgCol title="ID" field="id" hidden="true"></t:dgCol>
		<t:dgCol title="用户名" sortable="false" field="userName" query="true"></t:dgCol>
		<t:dgCol title="组织机构" sortable="false" field="departName" query="false"></t:dgCol>
		<t:dgCol title="真实姓名" field="realName" query="false"></t:dgCol>
		<t:dgCol title="角色" field="userKey" ></t:dgCol>
		<t:dgCol title="创建人" field="createBy" hidden="true"></t:dgCol>
		<t:dgCol title="创建时间" field="createDate" formatter="yyyy-MM-dd" hidden="true"></t:dgCol>
		<t:dgCol title="修改人" field="updateBy" hidden="true"></t:dgCol>
		<t:dgCol title="修改时间" field="updateDate" formatter="yyyy-MM-dd" hidden="true"></t:dgCol>
		<t:dgCol title="状态" sortable="true" field="status" replace="有效_1,失效_0,超级管理员_-1" ></t:dgCol>
		
		<t:dgCol title="操作" field="opt" width="100"></t:dgCol>
		<t:dgFunOpt funname="deleteDialog(id)" title="删除" urlclass="ace_button"  urlfont="fa-trash-o"></t:dgFunOpt>
		<t:dgToolBar title="用户录入" icon="icon-add" url="userController.do?addorupdate" funname="add"></t:dgToolBar>
		<t:dgToolBar title="用户编辑" icon="icon-edit" url="userController.do?addorupdate" funname="update"></t:dgToolBar>
		<t:dgToolBar title="密码重置" icon="icon-edit" url="userController.do?changepasswordforuser" funname="update"></t:dgToolBar>
		<t:dgToolBar title="锁定用户" icon="icon-edit" url="userController.do?lock&lockvalue=0" funname="lockObj"></t:dgToolBar>
		<t:dgToolBar title="激活用户" icon="icon-edit" url="userController.do?lock&lockvalue=1" funname="unlockObj"></t:dgToolBar>
		<t:dgToolBar title="导入" icon="icon-put" funname="ImportXls"></t:dgToolBar>
		<t:dgToolBar title="导出" icon="icon-putout" funname="ExportXls"></t:dgToolBar>
		<t:dgToolBar title="模板下载" icon="icon-putout" funname="ExportXlsByT"></t:dgToolBar>
	</t:datagrid>
</body>
</html>