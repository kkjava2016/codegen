# CodeGen 快速开发平台

## 平台简介

CodeGen是基于优秀开源项目[Jeecg 3.6.6](http://git.oschina.net/jeecg/jeecg)和[JeeSite 1.2.7](https://github.com/thinkgem/jeesite)，高度整合封装而成的**开源**Java EE快速开发平台。

CodeGen是在Spring Framework基础上搭建的一个Java基础开发平台，以Spring MVC为模型视图控制器，MyBatis为数据访问层，
Apache Shiro为权限授权层，Ehcahe对常用数据进行缓存，Activit为工作流引擎。

## 内置功能

1.	用户管理：用户是系统操作者，该功能主要完成系统用户配置。
2.	机构管理：配置系统组织机构（公司、部门、小组），树结构展现，可随意调整上下级。
3.	区域管理：系统城市区域模型，如：国家、省市、地市、区县的维护。
4.	菜单管理：配置系统菜单，操作权限，按钮权限标识等。
5.	角色管理：角色菜单权限分配、设置角色按机构进行数据范围权限划分。
6.	字典管理：对系统中经常使用的一些较为固定的数据进行维护，如：是否、男女、类别、级别等。
7.	操作日志：系统正常操作日志记录和查询；系统异常信息日志记录和查询。
8.	连接池监视：监视当期系统数据库连接池状态，可进行分析SQL找出系统性能瓶颈。
9.	工作流引擎：实现业务工单流转、在线流程设计器。

## 技术选型

1、后端

* 核心框架：Spring Framework 4.1
* 安全框架：Apache Shiro 1.2
* 视图框架：Spring MVC 4.1
* 服务端验证：Hibernate Validator 5.2
* 布局框架：SiteMesh 2.4
* 工作流引擎：Activiti 5.21
* 任务调度：Spring Task 4.1
* 持久层框架：MyBatis 3.2
* 数据库连接池：Alibaba Druid 1.0
* 缓存框架：Ehcache 2.6、Redis
* 日志管理：SLF4J 1.7、Log4j
* 工具类：Apache Commons、Jackson 2.2、Xstream 1.4、Dozer 5.3、POI 3.9

2、前端

* JS框架：jQuery 1.9。
* CSS框架：Twitter Bootstrap 2.3.1（稳定是后台，UI方面根据需求自己升级改造吧）。
* 客户端验证：JQuery Validation Plugin 1.11。
* 富文本在线编辑：CKEditor
* 在线文件管理：CKFinder
* 动态页签：Jerichotab
* 手机端框架：Jingle
* 数据表格：jqGrid
* 对话框：jQuery jBox
* 下拉选择框：jQuery Select2
* 树结构控件：jQuery zTree
* 日期控件： My97DatePicker