<#--
属性说明:
width,height  	若值为空，则默认"auto"
grid			根据treegrid属性值定义全局grid值
queryParams 	根据columnList定义的query是否可查询属性来拼装的属性
-->
<#assign width = width!"auto">
<#assign height = height!"auto">
<#-- grid类型 -->
<#if treegrid>
	<#assign grid = "treegrid">
<#else>
	<#assign grid = "datagrid">
</#if>
<#-- queryParams -->
<#list columnList as col>
	<#if col.query && col.defaultVal??>	
		<#if queryParams??>
			<#assign queryParams = (queryParams + "," + col.field + ":'" + col.defaultVal+"'")>
		<#else>
			<#assign queryParams = col.field + ":'" + col.defaultVal+"'">
		</#if>
	</#if>
</#list>
<#-- 定义column输出宏，共用组件 
treegrid	true/false	是否树形grid
checkbox 	true/false 	是否有复选框
columnList 				所有列数据
columnValueList			值替换数据
columnStyleList			背景样式
frozen		0冻结列 1普通列	是否冻结列

输出格式为:
{
	field:'',
	title:'',
	sortable:true/false,
	width:0,
	height:0,
	align:'',
	hidden:true/false,
	formatter:function(value, rec, index){},
	styler:function(value,rec,index){}
	....
}
-->
<#macro columns treegrid checkbox columnList columnValueList columnStyleList frozen>
	<#if checkbox && frozen == 0>
	{field:'ck',checkbox:'true'}<#if columnList?size gt 0>,</#if>
	</#if>
	<#list columnList as column>
	<#if (column.frozenColumn && frozen == 0) || (!column.frozenColumn && frozen == 1)>
		<#assign field = column.field>
		<#if treegrid>
			<#assign field = column.treefield>
		</#if>
		{
		field:'${field}'
		,title:'${column.title}'
		<#if column.width?exists>,width:${column.width}</#if>
		<#if column.align?exists>,align:'${column.align}'</#if>
		<#if column.extendParams?exists>
			<#-- TODO 扩展属性设置 -->
		</#if>
		<#if column.hidden>,hidden:true</#if>
		<#if !treegrid && column.sortable && field?index_of("_") lte 0 && field != "opt">
		,sortable:${column.sortable?string}
		</#if>
		<#if column.formatterjs?exists>
		,formatter:function(value, rec, index){
			return ${column.formatterjs}(value, rec, index);
		}
		<#elseif column.image>
		,formatter:function(value, rec, index){
			<#if column.imageSize?exists>
				<#assign hws = column.imageSize?split(",")>
				return '<img border="0" src="'+value+'" width="${hws[0]}" height="${hws1}"/>';
			<#else>
				return '<img border="0" src="'+value+'"/>';
			</#if>
		}
		<#elseif column.downloadName?exists>
		,formatter:function(value, rec, index){
			return '<a target="_blank" href="'+value+'">${column.downloadName}</a>';
		}
		<#elseif column.url?exists>
		,formatter:function(value, rec, index){
			var href = "<a style='color:red' href='#' onclick=${column.funname}('${column.title}','${column.url}')>";
			return href + value + '</a>';
		}
		<#elseif column.field == "opt">
		,formatter:function(value, rec, index){
			if(!rec.id){return '';}
			var href='';
			//
			//TODO 操作列设置
			//
			return href;
		}
		<#elseif column.formatter?exists>
		,formatter:function(value, rec, index){
			return new Date().format('${column.formatter}', value);
		}
		<#elseif column.showLen?exists>
		,formatter:function(value, rec, index){
			if(value==undefined) {return ''}
			if(value.length <= ${column.showLen}) {return value;}
			else{ return '<a title= '+value+'>'+ value.substring(0,${column.showLen}) + '...</a>';}
		}
		<#elseif columnValueList?exists && columnValueList?size gt 0 && column.field != "opt">
			<#list columnValueList as columnValue>
				<#if column.field == columnValue.name>
					<#assign value = columnValue.value?split(",")>
					<#assign text = columnValue.text?split(",")>
				,formatter:function(value, rec, index){
					if(value==undefined) return '';
					var valArray = value.split(',');
					if(valArray.length > 1) {
						var checkboxValue = '';
						for(var k=0; k<valArray.length; k++){
							<#list value as v>
								if(valArray[k] == '${v}') {
									checkboxValue = checkboxValue + '${text[v_index]},';
								}
							</#list>
						}
						return checkboxValue.substring(0,checkboxValue.length-1);
					}
					else {
						<#list value as v>
						if(value == '${v}') { return '${text[v_index]}'; }
						</#list>
					}
				}
				</#if>
			</#list>
		</#if>
		<#if columnStyleList?exists && columnStyleList?size gt 0 && column.field != "opt">
			<#list columnStyleList as columnStyle>
				<#if column.field == columnStyle.name>
					<#assign value = columnStyle.value?split(",")>
					<#assign text = columnStyle.text?split(",")>
					,styler:function(value,rec,index){
						<#if (value?size == 0 || value[0] == "") && text?size == 1>
							<#if text[0]?index_of("(") gt -1>
							return '${text[0]?replace("(","(value,rec,index")}';
							<#else>
							return '${text[0]}';
							</#if>
						<#else>
							<#list value as v>
								if(value == '${v}') {return '${text[v_index]}';}
							</#list>
						</#if>
					}
				</#if>
			</#list>
		</#if>
		}<#if column_has_next>,</#if>
	</#if>
	</#list>
</#macro>
<#-- 定义页面主体部分  -->
<table width="100%" id="${name}" toolbar="#${name}tb"></table>
<div id="${name}tb" style="padding:3px; height: auto">
	<#-- 检索区域是否可收缩 -->
	<#if queryParams?exists && showSearch>
	<input  id="columsShow" type="image" src="plug-in/easyui/themes/default/images/accordion_collapse.png" onclick="isShowBut()"/>
	<script type="text/javascript">
	function isShowBut() {
	    var isShowSearchId = $('#isShowSearchId').val();
	    if (isShowSearchId == "true") {
	        $("#searchColums").hide();
	        $('#isShowSearchId').val("false");
	        $('#columsShow').remove("src");
	        $('#columsShow').attr("src", "plug-in/easyui/themes/default/images/accordion_expand.png");
	    } else {
	        $("#searchColums").show();
	        $('#isShowSearchId').val("true");
	        $('#columsShow').remove("src");
	        $('#columsShow').attr("src", "plug-in/easyui/themes/default/images/accordion_collapse.png");
	    }
	}
	</script>
	</#if>
	<#-- 检索区域 -->
	<#if queryParams?exists>
	<link rel="stylesheet" href="plug-in/Validform/css/style.css" type="text/css" />
	<link rel="stylesheet" href="plug-in/Validform/css/tablefrom.css" type="text/css" />
	<script type="text/javascript" src="plug-in/Validform/js/Validform_v5.3.1_min_zh-cn.js"></script>
	<script type="text/javascript" src="plug-in/Validform/js/Validform_Datatype_zh-cn.js"></script>
	<script type="text/javascript" src="plug-in/Validform/js/datatype_zh-cn.js"></script>
	<div name="searchColums" id="searchColums">
		<input id="isShowSearchId" type="hidden" value="${showSearch?string}" />
		<input id="_sqlbuilder" name="sqlbuilder" type="hidden" />
		<form onkeydown="if(event.keyCode==13){${name}search();return false;}" id="${name}Form">
			<#-- 组合查询 -->
			<#if queryMode == "group">
				<#list columnList as col>
					<#if col.query>
					<span style="display:-moz-inline-box;display:inline-block;">
						<span style="vertical-align:middle;display:-moz-inline-box;display:inline-block;width: 80px;text-align:right;text-overflow:ellipsis;-o-text-overflow:ellipsis; overflow: hidden;white-space:nowrap; " title="${col.title}">${col.title}：</span>
						<#if col.queryMode == "single">
							<#if col.replace?exists>
							<select name="${col.field?replace('_','.')}" WIDTH="100" style="width: 104px">
								<option value="">请选择</option>
								<#list col.replace?split(",") as item>
									<#assign kvs = item?split("_")>
									<option value="${kvs[1]}">${kvs[0]}</option>
								</#list>
							</select>
							<#elseif col.dictionary?exists>
								<#-- TODO: 查询字典 -->
							<#elseif col.autocomplete>
								<#-- TODO: 自动补齐 -->
							<#else>
							<input onkeypress="EnterPress(event)" onkeydown="EnterPress()" type="text" name="${col.field?replace('_','.')}" class="inuptxt" style="width: 100px" value="${col.defaultVal!''}"/>
							</#if>
						<#else>
						<input type="text" name="${col.field}_begin"  style="width: 94px" class="inuptxt"/>
						<span style="display:-moz-inline-box;display:inline-block;width: 8px;text-align:right;">~</span>
						<input type="text" name="${col.field}_end"  style="width: 94px" class="inuptxt"/>
						</#if>
					</span>
					</#if>
				</#list>
			</#if>
		</form>
	</div>
	</#if>
	<#-- 设置ToolBar -->
	<#if toolBarList?size == 0 && !queryParams?exists>
	<div style="height:0px;">
	<#else>
	<div style="height:30px;" class="datagrid-toolbar">
	</#if>
	<span style="float:left;">
	<#if toolBarList?exists && toolBarList?size gt 0>
		<#list toolBarList as toolBar>
		<a href="#" class="easyui-linkbutton" plain="true" icon="${toolBar.icon}" 
			<#if toolBar.onclick?exists && toolBar.onclick?size gt 0>
			    onclick="${toolBar.onclick}"
			<#else>
                onclick="${toolBar.funname}(
				<#if toolBar.funname == "doSubmit"><#else>'${toolBar.title}',</#if>
				'${toolBar.url!""}', '${name}',
				<#if toolBar.width?contains("%")>'${toolBar.width}'<#else>${toolBar.width}</#if>,
				<#if toolBar.height?contains("%")>'${toolBar.height}'<#else>${toolBar.height}</#if>)"
			</#if>
			>${toolBar.title}</a>
		</#list>
	</#if>
	</span>
	<#if queryMode == "group" && queryParams?exists>
	<#-- 如果表单是组合查询 -->
	<span style="float:right">
		<a href="#" class="easyui-linkbutton" iconcls="icon-search" onclick="${name}search()">查询</a>
		<a href="#" class="easyui-linkbutton" iconcls="icon-reload" onclick="searchReset('${name}')">重置</a>
		<#if queryBuilder>
		<a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="queryBuilder()">高级查询</a>
		</#if>
	</span>
	<#elseif queryMode == "single" && queryParams?exists>
	<#-- 如果表单是单查询 -->
	<span style="float:right">
		<input id="${name}searchbox" class="easyui-searchbox"  data-options="searcher:${name}searchbox,prompt:'请输入关键字',menu:'#${name}mm'">
		<div id="${name}mm" style="width:120px">
		<#list columnList as col>
			<#if col.query>
			<div data-options="name:'${col.field?replace('_','.')}',iconCls:'icon-ok'">${col.title}</div> 
			</#if>
		</#list>
		</div>
	</span>
	<script type="text/javascript">
	$(function(){
		$('#${name}searchbox').searchbox({
		    searcher: function(value, name) {
		        ${name}searchbox(value, name);
		    },
		    menu: '#${name}mm',
		    prompt: '请输入查询关键字'
		});
		
		function ${name}searchbox(value, name) {
		    var queryParams = $('#${name}').${grid}('options').queryParams;
		    queryParams[name] = value;
		    queryParams.searchfield = name;
		    $('#${name}').datagrid('reload');
		}
	});
	</script>
	</#if>
	</div>
</div>
<script type="text/javascript">
$(function() {
	storage = $.localStorage;
	if (!storage) storage = $.cookieStorage;
	
	<#-- TODO: getNoAuthOperButton 根据权限控制按钮的显示 -->
	
	$('#${name}').${grid}({
		<#if treegrid>
		idField:'id',
		treeField:'text',
		<#else>
		idField:'${idField}',
		</#if>
		<#if title?exists>
		title:'${title}',
		</#if>
		<#if autoLoadData>
		url:'${actionUrl}&field=${fields}',
		<#else>
		url:'',
		</#if>
		fit:${fit?string},
		queryParams:{${queryParams!""}},
		loadMsg:'数据加载中...',
		pageSize:${pageSize},
		pagination:${pagination?string},
		pageList:[${pageSize},${pageSize*2},${pageSize*3}],
		<#if sortName?exists>
		sortName:'${sortName}',
		</#if>
		sortOrder:'${sortOrder}',
		rownumbers:true,
		<#if singleSelect?exists>
		singleSelect:${singleSelect?string},
		<#else>
		singleSelect:${checkbox?string('false','true')},
		</#if>
		fitColumns:${fitColumns?string},
		striped:true,
		showFooter:true,
		frozenColumns:[[
		<@columns treegrid checkbox columnList columnValueList columnStyleList 0/>
		]],
		columns:[[
		<@columns treegrid checkbox columnList columnValueList columnStyleList 1/>
		]],
		onLoadSuccess:function(data){
			$('#${name}').${grid}("clearSelections");
			<#if openFirstNode && treegrid>
			if(data != null) {
				var firstNode = $('#${name}').treegrid('getRoots')[0];
				$('#${name}').treegrid('expand',firstNode.id);
			}
			</#if>
			<#if onLoadSuccess?exists>
			${onLoadSuccess}(data);
			</#if>
		},
		<#if onDblClick?exists>
		onDblClickRow:function(rowIndex,rowData){
			${onDblClick}(rowIndex,rowData);
		},
		</#if>
		onClickRow:function(${treegrid?string('rowIndex,','')}rowData){
			rowid = rowData.id;
			<#if onClick?exists>
			${onClick}(${treegrid?string('rowIndex,','')}rowData);
			</#if>
		}
	});
	
	//分页设置
	$('#${name}').${grid}('getPager').pagination({
		beforePageText: '第',
		afterPageText: '页    共 {pages} 页',  
		displayMsg: '${showText?string("当前显示 {from} - {to} 条记录   共 {total} 条记录","")}',
		showPageList:${showPageList?string},
		showRefresh:${showRefresh?string},
		onBeforeRefresh: function(pageNumber, pageSize) {
			$(this).pagination('loading');
			$(this).pagination('loaded');
		}
	});
	try{
		restoreheader();
	}catch(ex){}
});
function reloadTable() {
    try {
        $('#${name}').${grid}('reload');
    } catch(ex) {}
}
function reload${name}() {
    $('#${name}').${grid}('reload');
}
function get${name}Selected(field) {
    return getSelected(field);
}
function getSelected(field) {
    var row = $('#${name}').${grid}('getSelected');
    if (row != null) {
        value = row[field];
    } else {
        value = '';
    }
    return value;
}
function get${name}Selections(field) {
    var ids = [];
    var rows = $('#${name}').${grid}('getSelections');
    for (var i = 0; i < rows.length; i++) {
        ids.push(rows[i][field]);
    }
    ids.join(',');
    return ids
};
function getSelectRows() {
    return $('#${name}').${grid}('getChecked');
}
function saveHeader() {
    var columnsFields = null;
    var easyextends = false;
    try {
        columnsFields = $('#${name}').${grid}('getColumns');
        easyextends = true;
    } catch(e) {
        columnsFields = $('#${name}').${grid}('getColumnFields');
    }
    var cols = storage.get('${name}hiddenColumns');
    var init = true;
    if (cols) {
        init = false;
    }
    var hiddencolumns = [];
    for (var i = 0; i < columnsFields.length; i++) {
        if (easyextends) {
            hiddencolumns.push({
                field: columnsFields[i].field,
                hidden: columnsFields[i].hidden
            });
        } else {
            var columsDetail = $('#${name}').${grid}("getColumnOption", columnsFields[i]);
            if (init) {
                hiddencolumns.push({
                    field: columsDetail.field,
                    hidden: columsDetail.hidden,
                    visible: (columsDetail.hidden == true ? false: true)
                });
            } else {
                for (var j = 0; j < cols.length; j++) {
                    if (cols[j].field == columsDetail.field) {
                        hiddencolumns.push({
                            field: columsDetail.field,
                            hidden: columsDetail.hidden,
                            visible: cols[j].visible
                        });
                    }
                }
            }
        }
    }
    storage.set('${name}hiddenColumns', JSON.stringify(hiddencolumns));
}
function restoreheader() {
    var cols = storage.get('${name}hiddenColumns');
    if (!cols) return;
    for (var i = 0; i < cols.length; i++) {
        try {
            if (cols.visible != false) 
            	$('#${name}').${grid}((cols[i].hidden == true ? 'hideColumn': 'showColumn'), cols[i].field);
        } catch(e) {}
    }
}
function resetheader() {
    var cols = storage.get('${name}hiddenColumns');
    if (!cols) return;
    for (var i = 0; i < cols.length; i++) {
        try {
            $('#${name}').${grid}((cols.visible == false ? 'hideColumn': 'showColumn'), cols[i].field);
        } catch(e) {}
    }
}
<#if columnList?exists && columnList?size gt 0>
function ${name}search() {
    try {
        if (!$("#${name}Form").Validform({
            tiptype: 3
        }).check()) {
            return false;
        }
    } catch(e) {}
    if (true) {
        var queryParams = $('#${name}').${grid}('options').queryParams;
        $('#${name}tb').find('*').each(function() {
            queryParams[$(this).attr('name')] = $(this).val();
        });
        $('#${name}').${grid}({
            url: '${actionUrl}&field=${searchFields}',
            pageNumber: 1
        });
    }
}
function EnterPress(e) {
    var e = e || window.event;
    if (e.keyCode == 13) {
        ${name}search();
    }
}
function searchReset(name) {
    $("#${name}tb").find(":input").val("");
    var queryParams = $('#${name}').${grid}('options').queryParams;
    $('#${name}tb').find('*').each(function() {
        queryParams[$(this).attr('name')] = $(this).val();
    });
    $('#${name}').${grid}({
        url: '${actionUrl}&field=${searchFields}',
        pageNumber: 1
    });
}
</#if>
</script>