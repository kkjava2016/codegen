<@compress single_line=true>
<#if types?exists && types?size gt 0>
	<#list types as type>
		<#if type == "jquery">
			<script type="text/javascript" src="plug-in/jquery/jquery-1.8.3.min.js"></script>
			<script type="text/javascript" src="plug-in/jquery/jquery.cookie.js"></script>
			<script type="text/javascript" src="plug-in/jquery-plugs/storage/jquery.storageapi.min.js" ></script>
		</#if>
		<#if type == "ckeditor">
			<script type="text/javascript" src="plug-in/ckeditor/ckeditor.js"></script>
			<script type="text/javascript" src="plug-in/tools/ckeditorTool.js"></script>
		</#if>
		<#if type == "ckfinder">
			<script type="text/javascript" src="plug-in/ckfinder/ckfinder.js"></script>
			<script type="text/javascript" src="plug-in/tools/ckfinderTool.js"></script>
		</#if>
		<#if type == "easyui">
			<link rel="stylesheet" type="text/css" href="plug-in/easyui/themes/${cssTheme}/easyui.css" type="text/css">
			<link rel="stylesheet" type="text/css" href="plug-in/easyui/themes/${cssTheme}/main.css" type="text/css">
			<#if cssTheme?exists>
				<link rel="stylesheet" type="text/css" href="plug-in/easyui/themes/${cssTheme}/icon.css" type="text/css">
			<#else>
				<link rel="stylesheet" type="text/css" href="plug-in/easyui/themes/icon.css" type="text/css">
			</#if>
			<link rel="stylesheet" type="text/css" href="plug-in/accordion/css/accordion.css">
			<link rel="stylesheet" type="text/css" href="plug-in/accordion/css/icons.css">
			<script type="text/javascript" src="plug-in/tools/dataformat.js"></script>
			<script type="text/javascript" src="plug-in/easyui/jquery.easyui.min.1.3.2.js"></script>
			<script type="text/javascript" src="plug-in/easyui/locale/zh-cn.js"></script>
			<script type="text/javascript" src="plug-in/tools/syUtil.js"></script>
			<script type="text/javascript" src="plug-in/easyui/extends/datagrid-scrollview.js"></script>
		</#if>
		<#if type == "DatePicker">
			<script type="text/javascript" src="plug-in/My97DatePicker/WdatePicker.js"></script>
		</#if>
		<#if type == "jqueryui">
			<link rel="stylesheet" type="text/css" href="plug-in/jquery-ui/css/ui-lightness/jquery-ui-1.9.2.custom.min.css">
			<script type="text/javascript" src="plug-in/jquery-ui/js/jquery-ui-1.9.2.custom.min.js"></script>
		</#if>
		<#if type == "tools">
			<#if cssTheme?exists>
				<link rel="stylesheet" href="plug-in/tools/css/${cssTheme}/common.css" type="text/css">
			<#else>
				<link rel="stylesheet" href="plug-in/tools/css/common.css" type="text/css">
			</#if>
			<link rel="stylesheet" href="plug-in/ace/css/font-awesome.css" type="text/css">
			<script type="text/javascript" src="plug-in/tools/curdtools.js"></script>
			<script type="text/javascript" src="plug-in/tools/easyuiextend.js"></script>
			<script type="text/javascript" src="plug-in/tools/json2.js" ></script>
			<script type="text/javascript" src="plug-in/lhgDialog/lhgdialog.min.js?skin=metrole"></script>
		</#if>
		<#if type == "toptip">
			<link rel="stylesheet" href="plug-in/toptip/css/css.css" type="text/css">
			<script type="text/javascript" src="plug-in/toptip/manhua_msgTips.js"></script>
		</#if>
		<#if type == "autocomplete">
			<link rel="stylesheet" href="plug-in/jquery/jquery-autocomplete/jquery.autocomplete.css" type="text/css">
			<script type="text/javascript" src="plug-in/jquery/jquery-autocomplete/jquery.autocomplete.min.js"></script>
		</#if>
	</#list>
</#if>
</@compress>