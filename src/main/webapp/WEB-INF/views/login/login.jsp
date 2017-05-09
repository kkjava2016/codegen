<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <meta charset="utf-8" />
  <title>CodeGen在线开发平台</title>
   <link rel="shortcut icon" href="images/favicon.ico">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
  <!-- bootstrap & fontawesome -->
  <link rel="stylesheet" href="plug-in/ace/css/bootstrap.css" />
  <link rel="stylesheet" href="plug-in/ace/css/font-awesome.css" />
  <link rel="stylesheet" type="text/css" href="plug-in/accordion/css/accordion.css">
  <!-- text fonts -->
  <link rel="stylesheet" href="plug-in/ace/css/ace-fonts.css" />

  <link rel="stylesheet" href="plug-in/ace/css/jquery-ui.css" />
  <!-- ace styles -->
  <link rel="stylesheet" href="plug-in/ace/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />
  <!--[if lte IE 9]>
  <link rel="stylesheet" href="plug-in/ace/css/ace-part2.css" class="ace-main-stylesheet" />
  <![endif]-->

  <!--[if lte IE 9]>
  <link rel="stylesheet" href="plug-in/ace/css/ace-ie.css" />
  <![endif]-->
  <!-- ace settings handler -->
  <script src="plug-in/ace/js/ace-extra.js"></script>

  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

  <!--[if lte IE 8]>
  <script src="plug-in/ace/js/html5shiv.js"></script>
  <script src="plug-in/ace/js/respond.js"></script>
  <![endif]-->

<style type="text/css">
/*
	loading layout
*/
#overlay {
	width:100%;
	height:100%;
	position:fixed;
	top:0;
	left:0;
	background-color:#111;
	/*	opacity:0.1;
	filter:alpha(opacity=10);*/
	z-index:1000;
	display: none;
}
#preloader {
	background: #000000 url(images/preloader.gif) no-repeat 12px 10px;
	font-size: 11px;
	height: 40px;
	left: 50%;
	line-height: 20px;
	margin: -20px 0 0 -45px;
	padding: 10px;
	position: fixed;
	text-align: left;
	text-indent: 36px;
	top: 50%;
	width: 130px;
	z-index: 1209;
	opacity:0.8;
	filter:alpha(opacity=80);
	-moz-border-radius: 8px;
	-webkit-border-radius: 8px;
	border-radius: 8px;
	color: #FFF;
	text-shadow:none;
	display: none;
}
</style>
</head>
<body class="login-layout light-login">
<div class="main-container">
  <div class="main-content">
    <div class="row">
      <div class="col-sm-10 col-sm-offset-1">
        <div class="login-container">
          <div class="center">
            <h1 id="id-text2" class="grey">
              <i class="ace-icon fa fa-leaf green"></i>
               CodeGen 演示系统
            </h1>
            <!-- <h4 class="blue" id="id-company-text"></h4> -->
          </div>
          <div class="space-6"></div>
          <div class="position-relative">
            <div id="login-box" class="login-box visible widget-box no-border">
              <div class="widget-body">
                <form id="loinForm" class="form-horizontal"  role="form" action=""  method="post">
                <div class="widget-main">
                 <div class="alert alert-warning alert-dismissible" role="alert" id="errMsgContiner">
				  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				  <div id="showErrMsg"></div>
				</div>
                  <h4 class="header blue lighter bigger">
                    <i class="ace-icon fa fa-coffee green"></i>
                	    用户登录
                  </h4>
                  <div class="space-6"></div>
                      <label class="block clearfix">
								<span class="block input-icon input-icon-right">
									<input type="text"  name="userName" class="form-control" placeholder="请输入用户名"  id="userName" value="admin"/>
									<i class="ace-icon fa fa-user"></i>
								</span>
                      </label>
                      <label class="block clearfix">
								<span class="block input-icon input-icon-right">
									<input type="password" name="password" class="form-control" placeholder="请输入密码" id="password" value="123456"/>
									<i class="ace-icon fa fa-lock"></i>
								</span>
                      </label>
                      <label class="block clearfix">
                        <div class="input-group">
                          <input type="text" style="width:150px" name="randCode" class="form-control" placeholder="请输入验证码"  id="randCode"/>
                          <span class="input-group-addon" style="padding: 0px;"><img id="randCodeImage" src=""  /></span>
                        </div>
                      </label>
                      <div class="space"></div>
                      <div class="clearfix">
                        <label class="inline">
                          <input type="checkbox" class="ace" id="on_off"  name="remember" value="yes"/>
                          <span class="lbl">记住用户名</span>
                        </label>
                        <button type="button" id="but_login"  class="width-35 pull-right btn btn-sm btn-primary">
                          <i class="ace-icon fa fa-key"></i>
                          <span class="bigger-110" >登录</span>
                        </button>
                      </div>
                      <div class="space-4"></div>

                </div>
                <div class="toolbar clearfix">
                  <div style="float: right;width:30%">
                    <a href="#"  class="forgot-password-link">忘记密码?</a>
                  </div>
                </div>
                </form>
              </div>
            </div>
            <div class="center"><h4 class="blue" id="id-company-text">&copy; XXXX版权所有 v_1.0.0</h4></div>
            <div id="toggleStyle" class="navbar-fixed-top align-right">
              <br />
              &nbsp;
              <a id="btn-login-dark" class="blue" href="#">Dark</a>
              &nbsp;
              <span class="blue">/</span>
              &nbsp;
              <a id="btn-login-blur" class="blue" href="#">Blur</a>
              &nbsp;
              <span class="blue">/</span>
              &nbsp;
              <a id="btn-login-light" class="blue" href="#">Light</a>
              &nbsp; &nbsp; &nbsp;
            </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
<script type="text/javascript" src="plug-in/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
//登录操作
var LoginPage = {
	/*登录验证rl */
	checkUrl : 'loginController.do?checkuser',
	/*登录成功后跳转路径*/
	actionUrl : 'loginController.do?login',
	/*验证码输出url*/
	randCodeImgUrl : 'servlet/randCodeImage',
	/*验证必输项*/
	validForm : function(){
		if($.trim($("#userName").val()).length==0){
			LoginPage.showError("请输入用户名!")
	      	return false;
	    }
	    if($.trim($("#password").val()).length==0){
	    	LoginPage.showError("请输入密码!");
	      	return false;
	    }
	    if($.trim($("#randCode").val()).length==0){
	    	LoginPage.showError("请输入验证码!");
	      	return false;
	    }
	    return true;
	},
	/*实际登录操作*/
	login : function(){
		if(!LoginPage.validForm()) {
			//验证不通过，直接退出
			return;
		}
		LoginPage.loading();
		
		var actionurl=$('form').attr('action');//提交路径
	    var checkurl=$('form').attr('check');//验证路径
	    var formData = new Object();
	    var data=$(":input").each(function() {
	      formData[this.name] =$("#"+this.name ).val();
	    });

	    $.ajax({
		     async : false,
		     cache : false,
		     type : 'POST',
		     url : LoginPage.checkUrl,// 请求的action路径
		     data : formData,
		     error : function() {// 请求失败处理函数
		    	 LoginPage.unloading();
		     },
		     success : function(d) {
		    	 LoginPage.unloading();
			      if (d.success) {
			          window.location.href = LoginPage.actionUrl;
			      } else {
			    	  LoginPage.showError(d.msg);
			      }
	    	}
      });
	},
	/*登录页样式切换*/
	toggleStyle : function(styleType) {
		if("Dark" == styleType) {
		    $('body').attr('class', 'login-layout');
		    $('#id-text2').attr('class', 'red');
		    $('#id-company-text').attr('class', 'blue');
		}
		else if("Light" == styleType) {
		    $('body').attr('class', 'login-layout light-login');
		    $('#id-text2').attr('class', 'grey');
		    $('#id-company-text').attr('class', 'blue');
		}
		else {
		    $('body').attr('class', 'login-layout blur-login');
		    $('#id-text2').attr('class', 'white');
		    $('#id-company-text').attr('class', 'light-blue');
		}
		return false;
	},
	/*显示错误信息*/
	showError : function(msg) {
		$("#errMsgContiner").show();
	    $("#showErrMsg").html(msg);
	    window.setTimeout(LoginPage.hideError,3000); 
	},
	/*隐藏错误显示区域*/
	hideError : function() {
		$("#showErrMsg").html('');
		$("#errMsgContiner").hide();
	},
	
	/*加载框显示*/
	loading : function(){
		$('body').append('<div id="overlay"></div><div id="preloader">核实中...</div>');
		$('#overlay').css('opacity', 0.1).fadeIn(function() {
			$('#preloader').fadeIn();
		});
		return false;
	},
	unloading : function() {
		$('#preloader').fadeOut('fast', function() {
			$('#overlay').fadeOut();
		});
	},
	/*初始化*/
	init : function() {
		this.hideError();
		$('#randCodeImage').attr("src", this.randCodeImgUrl);
		//登录按钮点击事件注册
		$("#but_login").click(this.login);
		//
		$(document).keydown(function(e) {
			if(e.keyCode == 13)
				$("#but_login").click();
		});
		//验证码
		$('#randCodeImage').click(function(){
			var date = new Date();
		    var img = document.getElementById("randCodeImage");
		    img.src= LoginPage.randCodeImgUrl + '?a=' + date.getTime();
		});
		//样式切换
		$("#toggleStyle a").click(function(){
			var styleType = $(this).text();
			LoginPage.toggleStyle(styleType);
		});
	}
};
$(function(){
	LoginPage.init();
});
</script>
</body>
</html>