<#if types?exists && types?size gt 0>
	<#list types as type>
		<#if type == "jquery">
<script type="text/javascript" src="plug-in/jquery/jquery-1.8.3.js"></script>
<script type="text/javascript" src="plug-in/jquery/jquery.cookie.js" ></script>
<script type="text/javascript" src="plug-in/jquery-plugs/storage/jquery.storageapi.min.js" ></script>
		</#if>
	</#list>
</#if>