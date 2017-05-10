<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">

    <title>CodeGen在线开发平台</title>

    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="images/favicon.ico">
    <link href="plug-in/hplus/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="plug-in/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link rel="stylesheet" href="plug-in/ace/assets/css/font-awesome.min.css" />
    <!--[if IE 7]>
    <link rel="stylesheet" href="plug-in/ace/assets/css/font-awesome-ie7.min.css" />
    <![endif]-->
    <!-- Sweet Alert -->
    <link href="plug-in/hplus/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="plug-in/hplus/css/animate.css" rel="stylesheet">
    <link href="plug-in/hplus/css/style.css?v=4.1.0" rel="stylesheet">
    <!--右键菜单-->
    <link href="plug-in/hplus/smartMenu.css" rel="stylesheet">
</head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
<div id="wrapper">
    <!--左侧导航开始-->
    <nav class="navbar-default navbar-static-side" role="navigation" style="z-index: 1991;">
        <div class="nav-close"><i class="fa fa-times-circle"></i>
        </div>
        <div class="sidebar-collapse">
            <ul class="nav" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element">
                        <span><img alt="image" class="img-circle" src="plug-in/login/images/jeecg-aceplus.png" /></span>
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                                <span class="block m-t-xs"><strong class="font-bold">admin</strong></span>
                                <span class="text-muted text-xs block">管理员<b class="caret"></b></span>
                                </span>
                        </a> 
                        <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <li>
                                <a href="javascript:add('修改密码','userController.do?changepassword','',550,200)">修改密码</a>
                            </li>
                            <li><a href="javascript:openwindow('个人信息','userController.do?userinfo')">个人信息</a></li>
                            <li><a href="javascript:openwindow('系统消息','tSSmsController.do?getSysInfos')">系统消息</a></li>
                            <li><a href="javascript:add('首页风格','userController.do?changestyle','',550,250)">首页风格</a></li>
                            <li><a href="javascript:clearLocalstorage()">清除缓存</a></li>
                            <li class="divider"></li>
                            <li><a href="javascript:logout()">注销</a></li>
                        </ul>
                    </div>
                    <div class="logo-element">CodeGen</div>
                </li>

                <!-- TODO 动态菜单加载  -->
		<li><a href="#" class=""><i class="fa icon-download-alt"></i><span class="menu-text">插件模块</span><span class="fa arrow"></span></a>
		   <ul class="nav nav-second-level collapse">
		    <li> <a class="J_menuItem" href="p3/wxActInvite.do?list" data-index="0"><span class="menu-text">普通列表</span></a></li>
		    <li> <a class="J_menuItem" href="p3/auth.do?list" data-index="1"><span class="menu-text">树形列表</span></a></li>
		    <li> <a class="J_menuItem" href="https://www.baidu.com" data-index="2"><span class="menu-text">百度</span></a></li>
		    <li> <a class="J_menuItem" href="mail/p3MailJformInnerMail.do?toSendMail" data-index="3"><span class="menu-text">我的邮箱</span></a></li>
		   </ul>
		</li> 
		<li><a href="#" class=""><i class="fa fa-pie-chart"></i><span class="menu-text">移动报表</span><span class="fa arrow"></span></a>
		   <ul class="nav nav-second-level collapse">
		    <li> <a class="J_menuItem" href="cgDynamGraphController.do?design&amp;id=t_s_log&amp;gtype=LineBasic2D" data-index="4"><span class="menu-text">折线图</span></a></li>
		    <li> <a class="J_menuItem" href="cgDynamGraphController.do?design&amp;id=t_s_log&amp;gtype=Area2D" data-index="5"><span class="menu-text">面积图 </span></a></li>
		    <li> <a class="J_menuItem" href="cgDynamGraphController.do?design&amp;id=t_s_log&amp;gtype=Bar2D" data-index="6"><span class="menu-text">条状图</span></a></li>
		    <li> <a class="J_menuItem" href="cgDynamGraphController.do?design&amp;id=t_s_log&amp;gtype=Column3D" data-index="7"><span class="menu-text">3D柱状图</span></a></li>
		    <li> <a class="J_menuItem" href="cgDynamGraphController.do?design&amp;id=t_s_log&amp;gtype=Column2D" data-index="8"><span class="menu-text">2D柱状图</span></a></li>
		    <li> <a class="J_menuItem" href="cgDynamGraphController.do?design&amp;id=t_s_log&amp;gtype=Pie2D" data-index="9"><span class="menu-text">2D饼图</span></a></li>
		    <li> <a class="J_menuItem" href="cgDynamGraphController.do?design&amp;id=t_s_log&amp;gtype=Pie3D" data-index="10"><span class="menu-text">3D饼图</span></a></li>
		    <li> <a class="J_menuItem" href="cgDynamGraphController.do?design&amp;id=t_s_log" data-index="11"><span class="menu-text">综合报表</span></a></li>
		   </ul>
		 </li> 
		 <li><a href="#" class=""><i class="fa fa-bar-chart-o"></i><span class="menu-text">统计报表</span><span class="fa arrow"></span></a>
		   <ul class="nav nav-second-level collapse">
		    <li> <a class="J_menuItem" href="logController.do?statisticTabs&amp;isIframe" data-index="12"><span class="menu-text">用户分析</span></a></li>
		    <li> <a class="J_menuItem" href="reportDemoController.do?studentStatisticTabs&amp;isIframe" data-index="13"><span class="menu-text">综合报表</span></a></li>
		    <li> <a class="J_menuItem" href="cgReportController.do?list&amp;id=user_msg" data-index="14"><span class="menu-text">数据报表</span></a></li>
		    <li> <a class="J_menuItem" href="graphReportController.do?list&amp;isIframe&amp;id=yhcztj" data-index="15"><span class="menu-text">图形报表</span></a></li>
		   </ul>
		  </li> 
		  <li><a href="#" class=""><i class="fa fa-cloud"></i><span class="menu-text">在线开发</span><span class="fa arrow"></span></a>
		   <ul class="nav nav-second-level collapse">
		    <li> <a class="J_menuItem" href="cgFormHeadController.do?cgFormHeadList" data-index="16"><span class="menu-text">Online表单开发</span></a></li>
		    <li> <a class="J_menuItem" href="cgformTemplateController.do?cgformTemplate" data-index="17"><span class="menu-text">Online表单样式</span></a></li>
		    <li> <a class="J_menuItem" href="cgreportConfigHeadController.do?cgreportConfigHead" data-index="18"><span class="menu-text">Online报表配置</span></a></li>
		    <li> <a class="J_menuItem" href="jformGraphreportHeadController.do?jformGraphreportHead" data-index="19"><span class="menu-text">Online图表配置</span></a></li>
		    <li> <a class="J_menuItem" href="cgDynamGraphConfigHeadController.do?cgDynamGraphConfigHead" data-index="20"><span class="menu-text">Online移动图表</span></a></li>
		    <li> <a class="J_menuItem" href="autoFormController.do?autoForm" data-index="21"><span class="menu-text">自定义表单列表</span></a></li>
		    <li> <a class="J_menuItem" href="autoFormStyleController.do?autoFormStyle" data-index="22"><span class="menu-text">自定义表单模板</span></a></li>
		   </ul>
		  </li> 
		  <li><a href="#" class=""><i class="fa fa-headphones"></i><span class="menu-text">系统监控</span><span class="fa arrow"></span></a>
		   <ul class="nav nav-second-level collapse">
		    <li> <a class="J_menuItem" href="dataSourceController.do?goDruid&amp;isIframe" data-index="23"><span class="menu-text">数据监控</span></a></li>
		    <li> <a class="J_menuItem" href="logController.do?log" data-index="24"><span class="menu-text">系统日志</span></a></li>
		    <li> <a class="J_menuItem" href="timeTaskController.do?timeTask" data-index="25"><span class="menu-text">定时任务</span></a></li>
		    <li> <a class="J_menuItem" href="systemController.do?dataLogList" data-index="26"><span class="menu-text">数据日志</span></a></li>
		   </ul>
		  </li> 
		  <li><a href="#" class=""><i class="fa fa-commenting"></i><span class="menu-text">消息中间件</span><span class="fa arrow"></span></a>
		   <ul class="nav nav-second-level collapse">
		    <li> <a class="J_menuItem" href="tSSmsController.do?tSSms" data-index="27"><span class="menu-text">消息中心</span></a></li>
		    <li> <a class="J_menuItem" href="tSSmsSqlController.do?tSSmsSql" data-index="28"><span class="menu-text">业务SQL</span></a></li>
		    <li> <a class="J_menuItem" href="tSSmsTemplateController.do?tSSmsTemplate" data-index="29"><span class="menu-text">消息模板</span></a></li>
		    <li> <a class="J_menuItem" href="tSSmsTemplateSqlController.do?tSSmsTemplateSql" data-index="30"><span class="menu-text">业务配置</span></a></li>
		   </ul>
		  </li> 
		  <li class="active"><a href="#" class=""><i class="fa fa-home"></i><span class="menu-text">系统管理</span><span class="fa arrow"></span></a>
		   <ul class="nav nav-second-level collapse in" aria-expanded="true">
		    <li> <a class="J_menuItem" href="userController.do?user" data-index="31"><span class="menu-text">用户管理</span></a></li>
		    <li> <a class="J_menuItem" href="roleController.do?role" data-index="32"><span class="menu-text">角色管理</span></a></li>
		    <li> <a class="J_menuItem" href="departController.do?depart" data-index="33"><span class="menu-text">组织机构</span></a></li>
		    <li> <a class="J_menuItem" href="functionController.do?function&amp;type=0" data-index="34"><span class="menu-text">菜单管理</span></a></li>
		    <li> <a class="J_menuItem" href="functionController.do?function&amp;type=1" data-index="35"><span class="menu-text">数据权限</span></a></li>
		    <li> <a class="J_menuItem" href="systemController.do?typeGroupList" data-index="36"><span class="menu-text">数据字典</span></a></li>
		    <li> <a class="J_menuItem" href="noticeController.do?tSNotice" data-index="37"><span class="menu-text">系统公告</span></a></li>
		    <li> <a class="J_menuItem" href="iconController.do?icon" data-index="38"><span class="menu-text">系统图标</span></a></li>
		    <li> <a class="J_menuItem" href="mutiLangController.do?mutiLang" data-index="39"><span class="menu-text">国际化语言</span></a></li>
		    <li> <a class="J_menuItem" href="dynamicDataSourceController.do?dbSource" data-index="40"><span class="menu-text">多数据源管理</span></a></li>
		   </ul>
		  </li> 
		  <li><a href="#" class=""><i class="fa fa-twitch"></i><span class="menu-text">常用示例</span><span class="fa arrow"></span></a>
		   <ul class="nav nav-second-level collapse">
		    <li> <a class="J_menuItem" href="" data-index="41"><i class="fa fa-tags"></i><span class="menu-text">UI标签</span><span class="fa arrow"></span></a>
		     <ul class="nav nav-third-level collapse">
		      <li> <a class="J_menuItem" href="demoController.do?formTabs" data-index="42"><span class="menu-text">表单验证</span></a></li>
		      <li> <a class="J_menuItem" href="userNoPageController.do?user" data-index="43"><span class="menu-text">无分页列表</span></a></li>
		      <li> <a class="J_menuItem" href="demoController.do?dictSelect" data-index="44"><span class="menu-text">字典标签</span></a></li>
		      <li> <a class="J_menuItem" href="jeecgDemoController.do?jeecgDemo2&amp;sex=1" data-index="45"><span class="menu-text">datagrid查询默认条件</span></a></li>
		      <li> <a class="J_menuItem" href="userController.do?userDemo" data-index="46"><span class="menu-text">datagrid自定义查询1</span></a></li>
		      <li> <a class="J_menuItem" href="jeecgDemoController.do?customDatagridList" data-index="47"><span class="menu-text">datagrid自定义查询2</span></a></li>
		      <li> <a class="J_menuItem" href="jeecgEasyUIController.do?jeecgEasyUI" data-index="48"><span class="menu-text">单表例子（无tag）</span></a></li>
		      <li> <a class="J_menuItem" href="jeecgOrderMainNoTagController.do?jeecgOrderMainNoTag" data-index="49"><span class="menu-text">一对多例子（无tag）</span></a></li>
		     </ul>
		    </li>
		    <li> <a class="J_menuItem" href="" data-index="50"><i class="fa fa-list"></i><span class="menu-text">表单布局</span><span class="fa arrow"></span></a>
		     <ul class="nav nav-third-level collapse">
		      <li> <a class="J_menuItem" href="jeecgDemoController.do?jeecgDemo" data-index="51"><span class="menu-text">综合Demo</span></a></li>
		      <li> <a class="J_menuItem" href="jeecgNoteController.do?jeecgNote" data-index="52"><span class="menu-text">表单模型</span></a></li>
		      <li> <a class="J_menuItem" href="jeecgOrderMainController.do?jeecgOrderMain" data-index="53"><span class="menu-text">一对多模型</span></a></li>
		      <li> <a class="J_menuItem" href="jeecgOrderMainPTabController.do?jeecgOrderMain" data-index="54"><span class="menu-text">一对多模型（并列TAB）</span></a></li>
		      <li> <a class="J_menuItem" href="demoController.do?demoList" data-index="55"><span class="menu-text">表单弹出风格</span></a></li>
		      <li> <a class="J_menuItem" href="demoController.do?demoIframe" data-index="56"><span class="menu-text">左右布局</span></a></li>
		      <li> <a class="J_menuItem" href="tFinanceController.do?tFinance" data-index="57"><span class="menu-text">多附件管理</span></a></li>
		      <li> <a class="J_menuItem" href="jeecgMatterBomController.do?goList" data-index="58"><span class="menu-text">树列表</span></a></li>
		      <li> <a class="J_menuItem" href="jeecgDemoController.do?goDemo&amp;demoPage=rowEditDemo" data-index="59"><span class="menu-text">行编辑demo</span></a></li>
		      <li> <a class="J_menuItem" href="demoController.do?demoLayoutList" data-index="60"><span class="menu-text">表单特殊布局</span></a></li>
		      <li> <a class="J_menuItem" href="goodsController.do?list" data-index="61"><span class="menu-text">商品管理(特殊布局)</span></a></li>
		     </ul>
		    </li>
		    <li> <a class="J_menuItem" href="" data-index="62"><i class="fa fa-random"></i><span class="menu-text">常用控件</span><span class="fa arrow"></span></a>
		     <ul class="nav nav-third-level collapse">
		      <li> <a class="J_menuItem" href="courseController.do?course" data-index="63"><span class="menu-text">Excel导入导出</span></a></li>
		      <li> <a class="J_menuItem" href="fileUploadController.do?fileUploadSample&amp;isIframe" data-index="64"><span class="menu-text">Jquery上传示例</span></a></li>
		      <li> <a class="J_menuItem" href="commonController.do?listTurn&amp;turn=system/document/filesList" data-index="65"><span class="menu-text">上传下载</span></a></li>
		      <li> <a class="J_menuItem" href="jeecgDemoController.do?ckeditor&amp;isIframe" data-index="66"><span class="menu-text">HTML编辑器</span></a></li>
		      <li> <a class="J_menuItem" href="webOfficeController.do?webOffice" data-index="67"><span class="menu-text">在线word(IE)</span></a></li>
		      <li> <a class="J_menuItem" href="webOfficeController.do?webOfficeSample&amp;isIframe" data-index="68"><span class="menu-text">WebOffice官方例子</span></a></li>
		      <li> <a class="J_menuItem" href="jeecgDemoController.do?ztreelist" data-index="69"><span class="menu-text">下拉菜单树</span></a></li>
		      <li> <a class="J_menuItem" href="jeecgDemoCkfinderController.do?jeecgDemoCkfinder" data-index="70"><span class="menu-text">ckfinder例子</span></a></li>
		      <li> <a class="J_menuItem" href="demoController.do?eSign" data-index="71"><span class="menu-text">电子签章</span></a></li>
		     </ul>
		    </li>
		    <li> <a class="J_menuItem" href="" data-index="72"><i class="fa fa-database"></i><span class="menu-text">数据库相关</span><span class="fa arrow"></span></a>
		     <ul class="nav nav-third-level collapse">
		      <li> <a class="J_menuItem" href="jeecgMinidaoController.do?jeecgMinidao" data-index="73"><span class="menu-text">minidao例子</span></a></li>
		      <li> <a class="J_menuItem" href="jeecgJdbcController.do?jeecgJdbc" data-index="74"><span class="menu-text">jdbc示例</span></a></li>
		      <li> <a class="J_menuItem" href="transactionTestController.do?showPage" data-index="75"><span class="menu-text">事务回滚</span></a></li>
		      <li> <a class="J_menuItem" href="jeecgProcedureController.do?procedure" data-index="76"><span class="menu-text">存储过程实例</span></a></li>
		     </ul>
		    </li>
		   </ul></li>

            </ul>
        </div>
    </nav>
    <!--左侧导航结束-->
    <!--右侧部分开始-->
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header" style="height: 60px;"><a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
                    <form role="search" class="navbar-form-custom" method="post" action="search_results.html">
                        <div class="form-group">
                            <input type="text" placeholder="欢迎使用CodeGen快速开发平台 …" class="form-control" name="top-search" id="top-search">
                        </div>
                    </form>
                </div>
                
                <ul class="nav navbar-top-links navbar-right">
                   <li class="dropdown">
                        <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                            <i class="fa fa-envelope"></i> <span class="label label-warning">0</span>
                        </a>
                        <ul class="dropdown-menu dropdown-alerts">
                            <li>
                                <a>
                                    <div>
                                        <i class="fa fa-envelope fa-fw"></i> 您有0条未读消息
                                        <span class="pull-right text-muted small">4分钟前</span>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="text-center link-block">
                                    <a class="" href="javascript:goAllNotice();">
                                        <i class="fa fa-envelope"></i> <strong> 查看所有消息</strong>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                            <i class="fa fa-bell"></i> <span class="label label-primary">0</span>
                        </a>
                        <ul class="dropdown-menu dropdown-alerts">
                            <li>
                                <a>
                                    <div>
                                        <i class="fa fa-envelope fa-fw"></i> 您有0条未读消息
                                        <span class="pull-right text-muted small">4分钟前</span>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="text-center link-block">
                                    <a class="" href="javascript:goAllMessage();">
                                        <strong>查看所有 </strong>
                                        <i class="fa fa-angle-right"></i>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </li>
                    
                    <li class="dropdown">
                    	<a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                                <span><strong class="font-bold">admin</strong></span>
                                <span>管理员<b class="caret"></b></span>
                        </a>
                        <ul class="dropdown-menu dropdown-alerts">
                            <li>
                                <a href="javascript:add('修改密码','userController.do?changepassword','',550,200)">修改密码</a>
                            </li>
                            <li><a href="javascript:openwindow('个人信息','userController.do?userinfo')">个人信息</a></li>
                            <li><a href="javascript:openwindow('系统消息','tSSmsController.do?getSysInfos')">系统消息</a></li>
                            <li><a href="javascript:add('首页风格','userController.do?changestyle','',550,250)">首页风格</a></li>
                            <li><a href="javascript:clearLocalstorage()">清除缓存</a></li>
                        </ul>
                    </li>
                    
                     
                    <li class="dropdown hidden-xs">
                        <a class="right-sidebar-toggle" aria-expanded="false">
                            <i class="fa fa-tasks"></i> 主题
                        </a>
                    </li>
                      <li class="dropdown">
                     <a href="javascript:logout()" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i> 退出</a>
                     </li>
                </ul>
            </nav>
        </div>
        <div class="row content-tabs">
            <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i></button>
            <nav class="page-tabs J_menuTabs">
                <div class="page-tabs-content">
                    <a href="javascript:;" class="active J_menuTab" data-id="">首页</a>
                </div>
            	<button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i></button>
	            <div class="btn-group roll-nav roll-right">
	                <button class="dropdown J_tabClose" data-toggle="dropdown">关闭操作<span class="caret"></span>
	
	                </button>
	                <ul role="menu" class="dropdown-menu dropdown-menu-right">
	                    <li class="J_tabShowActive"><a>定位当前选项卡</a>
	                    </li>
	                    <li class="divider"></li>
	                    <li class="J_tabCloseAll"><a>关闭全部选项卡</a>
	                    </li>
	                    <li class="J_tabCloseOther"><a>关闭其他选项卡</a>
	                    </li>
	                </ul>
	            </div>
            </nav>
        </div>
        <div class="row J_mainContent" id="content-main">
            <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="loginController.do?home" frameborder="0" data-id="loginController.do?home" seamless></iframe>
        </div>
        <div class="footer">
            <div class="pull-right">&copy; 1.0.0 <a href="https://github.com/janzolau1987/codegen" target="_blank">CodeGen</a>
            </div>
        </div>
    </div>
    <!--右侧部分结束-->
    <!--右侧边栏开始-->
    <div id="right-sidebar">
        <div class="sidebar-container">
            <ul class="nav nav-tabs navs-3">
                <li class="active"><a data-toggle="tab" href="#tab-1"><i class="fa fa-gear"></i> 主题</a></li>
                <li class=""><a data-toggle="tab" href="#tab-2"><i class="fa fa-comments-o" aria-hidden="true"></i>通知</a></li>
                <li><a data-toggle="tab" href="#tab-3"><i class="fa fa-info-circle" aria-hidden="true"></i>公告</a></li>
            </ul>

            <div class="tab-content">
                <div id="tab-1" class="tab-pane active">
                    <div class="sidebar-title">
                        <h3> <i class="fa fa-comments-o"></i> 主题设置</h3>
                        <small><i class="fa fa-tim"></i> 你可以从这里选择和预览主题的布局和样式，这些设置会被保存在本地，下次打开的时候会直接应用这些设置。</small>
                    </div>
                    <div class="skin-setttings">
                        <div class="title">主题设置</div>
                        <div class="setings-item">
                            <span>收起左侧菜单</span>
                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" name="collapsemenu" class="onoffswitch-checkbox" id="collapsemenu">
                                    <label class="onoffswitch-label" for="collapsemenu">
                                        <span class="onoffswitch-inner"></span>
                                        <span class="onoffswitch-switch"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="setings-item">
                            <span>固定顶部</span>
                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" name="fixednavbar" class="onoffswitch-checkbox" id="fixednavbar">
                                    <label class="onoffswitch-label" for="fixednavbar">
                                        <span class="onoffswitch-inner"></span>
                                        <span class="onoffswitch-switch"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="setings-item">
                            <span>固定宽度</span>
                            <div class="switch">
                                <div class="onoffswitch">
                                    <input type="checkbox" name="boxedlayout" class="onoffswitch-checkbox" id="boxedlayout">
                                    <label class="onoffswitch-label" for="boxedlayout">
                                        <span class="onoffswitch-inner"></span>
                                        <span class="onoffswitch-switch"></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="title">皮肤选择</div>
                        <div class="setings-item default-skin nb">
                                <span class="skin-name "><a href="#" class="s-skin-0">默认皮肤</a></span>
                        </div>
                        <div class="setings-item blue-skin nb">
                                <span class="skin-name "><a href="#" class="s-skin-1">蓝色主题</a></span>
                        </div>
                        <div class="setings-item yellow-skin nb">
                                <span class="skin-name "><a href="#" class="s-skin-3">黄色/紫色主题</a></span>
                        </div>
                    </div>
                </div>
                <div id="tab-2" class="tab-pane">
                    <div class="sidebar-title">
                        <h3> <i class="fa fa-comments-o"></i> 最新通知<small id="messageCount"><i class="fa fa-tim"></i> 您当前有0条未读通知</small></h3>
                    </div>
                    <ul class="sidebar-list">
                        <li id="messageContent">

                        </li>

                        <li>
                            <a href="javascript:goAllMessage();" id="messageFooter"> 查看全部<i class="icon-arrow-right"></i></a>
                        </li>
                    </ul>
                </div>
                <div id="tab-3" class="tab-pane">
                    <div class="sidebar-title">
                        <h3> <i class="fa fa-cube"></i> 最新公告<small id="noticeCount"><i class="fa fa-tim"></i> 您当前有0个公告</small></h3>
                    </div>
                    <ul class="sidebar-list">
                        <li id="noticeContent">

                        </li>
                        <li>
                            <a href="javascript:goAllNotice();" id="noticeFooter">查看所有公告<i class="icon-arrow-right"></i></a>
                        </li>
                    </ul>
                </div>
            </div>

        </div>
    </div>
    <!--右侧边栏结束-->
</div>

<!-- 全局js -->
<script src="plug-in/hplus/js/jquery.min.js?v=2.1.4"></script>
<script src="plug-in/hplus/js/bootstrap.min.js?v=3.3.6"></script>
<script src="plug-in/hplus/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="plug-in/hplus/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="plug-in/hplus/js/plugins/layer/layer.min.js"></script>

<!-- 自定义js -->
<script src="plug-in/hplus/js/hplus.js?v=4.1.0"></script>
<!--右键菜单-->
<script type="text/javascript" src="plug-in/hplus/jquery-smartMenu.js"></script>
<script type="text/javascript" src="plug-in/hplus/contabs.js"></script>
<script type="text/javascript" src="plug-in/tools/curdtools.js"></script>
<script type="text/javascript" src="plug-in/tools/easyuiextend.js"></script>
<!-- 第三方插件 -->
<script src="plug-in/hplus/js/plugins/pace/pace.min.js"></script>
<!-- Sweet alert -->
<script src="plug-in/hplus/js/plugins/sweetalert/sweetalert.min.js"></script>
<script src="plug-in/jquery-plugs/storage/jquery.storageapi.min.js"></script>

<!-- 弹出TAB -->
<script type="text/javascript" src="plug-in/hplus/hplus-tab.js"></script>
<script type="text/javascript">
    function logout(){
        layer.confirm('您确定要注销吗？', {
            btn: ['确定','取消'], //按钮
            shade: false //不显示遮罩
        }, function(){
            location.href="loginController.do?logout";
        }, function(){
            return;
        });
    }
    function clearLocalstorage(){
        var storage=$.localStorage;
        if(!storage)
            storage=$.cookieStorage;
        storage.removeAll();
        //bootbox.alert( "浏览器缓存清除成功!");
        layer.msg("浏览器缓存清除成功!");
    }

    $(document).ready(function(){
        //加载公告
        var url = "noticeController.do?getNoticeList";
        jQuery.ajax({
            url:url,
            type:"GET",
            dataType:"JSON",
            async: false,
            success:function(data){
                if(data.success){
                    var noticeList = data.attributes.noticeList;
                    var noticeCount = data.obj;
                    //加载公告条数
                    if(noticeCount>99){
                        $("#noticeCount").html("99+");
                    }else{
                        $("#noticeCount").html(noticeCount);
                    }
                    //加载公告提示
                    var noticeTip = "";
                    noticeTip += "<i class='icon-warning-sign'></i>";
                    noticeTip += noticeCount+" "+data.attributes.tip;
                    $("#noticeTip").html(noticeTip);

                    //加载公告条目
                    var noticeContent = "";
                    if(noticeList.length > 0){
                        for(var i=0;i<noticeList.length;i++){
                            noticeContent +="<li><a href='javascript:goNotice(&quot;"+noticeList[i].id+"&quot;)' ";
                            noticeContent +="style='word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;'>";
                            noticeContent +="<i class='btn btn-xs btn-primary fa fa-user'></i>";
                            noticeContent +="&nbsp;"+noticeList[i].noticeTitle + "</a></li></ul></li>";
                        }
                    }
                    $("#noticeContent").html(noticeContent);

                    //加载公告底部文字
                    var noticeSeeAll = data.attributes.seeAll +"<i class='ace-icon fa fa-arrow-right'></i>";
                    $("#noticeFooter").html(noticeSeeAll);
                }
            }
        });


        //加载消息
        var url = "tSSmsController.do?getMessageList";
        $.ajax({
            url:url,
            type:"GET",
            dataType:"JSON",
            async: false,
            success:function(data){
                if(data.success){
                    var messageList = data.attributes.messageList;
                    var messageCount = data.obj;
                    //加载消息条数
                    if(messageCount>99){
                        $("#messageCount").html("99+");
                    }else{
                        $("#messageCount").html(messageCount);
                    }
                    //加载消息tip提示
                    var messageTip = "";
                    messageTip += "<i class='ace-icon fa fa-envelope-o'></i>";
                    messageTip += messageCount+" "+data.attributes.tip;
                    $("#messageTip").html(messageTip);

                    //加载消息条目（有限）
                    var messageContent = "";
                    if(messageList.length > 0){
                        for(var i=0;i<messageList.length;i++){
                            messageContent +="<li><a href='javascript:goMessage(&quot;"+messageList[i].id+"&quot;)' class='clearfix'>";
                            messageContent +="<img src='plug-in/ace/avatars/avatar3.png' class='msg-photo' alt='Alex’s Avatar' />";
                            messageContent +="<span class='msg-body'><span class='msg-title'>";
                            messageContent +="<span class='blue'>"+messageList[i].esSender+":</span>";
                            messageContent += messageList[i].esTitle + "</span>";
                            messageContent +="<span class='msg-time'><i class='ace-icon fa fa-clock-o'></i><span>"+messageList[i].esSendtimeTxt+"</span></span>";
                            messageContent +="</span></a><input id='"+messageList[i].id+"_title' type='hidden' value='"+messageList[i].esTitle+"'>";
                            messageContent +="<input id='"+messageList[i].id+"_status' type='hidden' value='"+messageList[i].esStatus+"'>";
                            messageContent +="<input id='"+messageList[i].id+"_content' type='hidden' value='"+messageList[i].esContent+"'></li>";
                        }
                    }
                    $("#messageContent").html(messageContent);

                    //加载消息底部文字
                    var messageSeeAll = data.attributes.seeAll +"<i class='ace-icon fa fa-arrow-right'></i>";
                    $("#messageFooter").html(messageSeeAll);
                }
            }
        });

    });

    function goAllNotice(){
        var addurl = "noticeController.do?noticeList";
        createdetailwindow("公告", addurl, 800, 400);
    }

    function goNotice(id){
        var addurl = "noticeController.do?goNotice&id="+id;
        createdetailwindow("通知公告详情", addurl, 750, 600);
    }

    function goAllMessage(){
        var addurl = "tSSmsController.do?getSysInfos";
        createdetailwindow("通知", addurl, 800, 400);
    }

    function goMessage(id){
        var title = $("#"+id+"_title").val();
        var content = $("#"+id+"_content").val();
        $("#msgId").val(id);
        $("#msgTitle").html(title);
        $("#msgContent").html(content);
        var status = $("#"+id+"_status").val();
        if(status==1){
            $("#msgStatus").html("未读");
        }else{
            $("#msgStatus").html("已读");
        }

        $('.theme-popover-mask').fadeIn(100);
        $('.theme-popover').slideDown(200);
    }

    function readMessage(){
        var msgId = $("#msgId").val();
        var url = "tSSmsController.do?readMessage";
        $.ajax({
            url:url,
            type:"GET",
            dataType:"JSON",
            data:{
                messageId:msgId
            },
            success:function(data){
                if(data.success){
                    $("#msgStatus").html("已读");
                    $("#"+msgId+"_status").val('2');
                }
            }
        });
    }
</script>
</body>

</html>
