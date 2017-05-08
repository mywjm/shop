<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
  <head>
    <title>后台登陆</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8" />

   <!--  <link rel="icon" type="image/ico" href="http://tattek.com/minimal/assets/images/favicon.ico" /> -->
    <!-- Bootstrap -->
    <link href="assets/css/vendor/bootstrap/bootstrap.min.css" rel="stylesheet">
  <!--   <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet"> -->
    <link rel="stylesheet" href="assets/css/vendor/bootstrap-checkbox.css">

    <link href="assets/css/minimal.css" rel="stylesheet">
	 <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript">
    	function	getpassword() {
    		alert("请找超级管理员更改密码");
    	}
    	function create() {
    		var str = prompt("请输入名字；密码；权限密码，中文分号分隔（如  李四；123456；123456）");
    		var strs= new Array(); //定义一数组 
			strs=str.split("；"); //字符分割 
			var username = strs[0];
    		var password = strs[1];
    		var root = strs[2];
    		$.post("admin_add.action",{username:username,password:password,root:root});
			
			}
			
		function show() {
			
		}
    </script>
  </head>
  <body class="bg-1">
    <!-- Wrap all page content here -->
    <div id="wrap">
      <!-- Make page fluid -->
      <div class="row">
        <!-- Page content -->
        <div id="content" class="col-md-12 full-page login">
          <div class="inside-block">
            <img src="assets/images/logo-big.png" alt="" class="logo">
            <h1><strong>欢迎</strong> 进入</h1>
            <h5>后台管理员登陆</h5>

            <form id="form-signin" class="form-signin" action="${pageContext.request.contextPath }/admin_login.action" method="post">
              <section>
                <div class="input-group">
                  <input type="text" class="form-control" name="username" placeholder="管理员">
                  <div class="input-group-addon"><i class="fa fa-user"></i></div>
                </div>
                <div class="input-group">
                  <input type="password" class="form-control" name="password" placeholder="密码">
                  <div class="input-group-addon"><i class="fa fa-key"></i></div>
                </div>
              </section>
              <section class="controls">
                <div class="checkbox check-transparent">
                  <input type="checkbox" value="1" id="remember" checked>
                  <label for="remember">Remember me</label>
                </div>
                <a href="#" onclick="getpassword()">忘记密码?</a>
              </section>
              <s:actionerror/>
              <section class="log-in">
                <button class="btn btn-greensea">登陆</button>
              <span></span>
                <a class="btn btn-slategray" onclick="create()">创建账户</a> 
              </section>
            </form>
          </div>
        </div>
        <!-- /Page content -->  
      </div>
    </div>
    <!-- Wrap all page content end -->

  </body>
</html>
      
