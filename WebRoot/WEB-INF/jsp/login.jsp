<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登录Q淘商城</title>
         <!-- Latest jQuery form server -->
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <!-- Bootstrap JS form CDN -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script> 
    <!-- Bootstrap -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style1.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
	<link href="${pageContext.request.contextPath}/css/slide-unlock.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript">
	function checkisactive(){
	
		// 获得文件框值:
		var nickname1 = document.getElementById("temp");
		var nickname = nickname1.value;
		if(nickname == null || nickname==''){
			document.getElementById("span1").innerHTML ="昵称或email不能为空!";
			nickname1.focus();
			return false;
		}
		
	}
	
	</script>
  
  </head>
  <body>
  
      <div class="header-area">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="user-menu">
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/usert_registPage.action"><i class="fa fa-user"></i> 注册</a></li>
                        </ul>
                    </div>
                </div>
                
                <div class="col-md-6">
                    <div class="header-right">
                        <ul class="list-unstyled list-inline">
                           	<li><a href="${pageContext.request.contextPath}/index_guidance"><i class="glyphicon glyphicon-leaf"></i> &nbsp;&nbsp;购物指南</a></li>
                            <li class="dropdown dropdown-small">
                                <a data-toggle="dropdown" data-hover="dropdown" class="dropdown-toggle" href="#"><span class="glyphicon glyphicon-info-sign"> </span><i >&nbsp;&nbsp;更多服务</i><span class="value"></span><b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                     <li><a href="${pageContext.request.contextPath}/index_returnGood">退货政策</a></li>
                                    <li><a href="${pageContext.request.contextPath}/index_advice">意见建议</a></li>
                                    <li><a href="${pageContext.request.contextPath}/index_aboutus">关于我们</a></li>
                                </ul>
                            </li>
                            <li><a ><i class="glyphicon glyphicon-phone-alt"></i> &nbsp;&nbsp;客服电话：020-81556328</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
   <!-- header -->
<div class="header_bg">
<div class="wrap">
	<div class="header">
		<div class="logo">
			<a href="${pageContext.request.contextPath}/index.action"><img src="${pageContext.request.contextPath}/img/logo.png" alt=""/> </a>
		</div>
		<div class="clear"></div>
	</div>
</div>
</div>
<!-- login-form -->
 <div class="page-container">
            <h1>用户登陆</h1>
            <form action="${pageContext.request.contextPath}/user_login.action" method="post" name="loginform" id="form">
                <font color="red"> <span id="span1"></span><s:actionmessage /></font>
                <input type="text" name="temp" class="username" placeholder="昵称或email" id="temp" onblur="checkisactive()">
                <input type="password" name="password" class="password" placeholder="密码" id="password"><font color="red"><s:fielderror fieldName="password"></s:fielderror></font>
               	
               	<div id="slider">
 			   <div id="slider_bg"></div>
    			<span id="label">>></span> <span id="labelTip">拖动滑块验证</span> 
    			
    			<script src="${pageContext.request.contextPath}/js/jquery.slideunlock.js"></script> 
    			<script>
				    $(function () {
				        var slider = new SliderUnlock("#slider",{
								successLabelTip : "欢迎访问Q淘商城"	
							},function(){
								 var temp = document.getElementById("temp").value;
	  							 var password = document.getElementById("password").value;
	  							 if(temp == "" || temp == null  ){
	  							 slider.init();
							     alert("昵称或email不能为空");
							     return false;
							   }
							   if(password == "" || password == null  ){
							   slider.init();
							    alert("密码不能为空");
							     return false;
							   }
								
				            	document.getElementById("form").submit();
				        	});
				        slider.init();
				    });
				</script> 
    			</div>
               <div>
                <h5 ><a href="${pageContext.request.contextPath }/user_findPassword.action"><font color="yellow">忘记密码？</font></a></h5>
               </div> 
            </form>
        </div>
<!-- footer -->
<div class="footer_bg1">
<div class="wrap">
	<div class="footer">
		<div class="copy">
			<p class="link">Copyright &copy; 2017.Q淘商城 All rights reserved.</p>
		</div>
		<div class="clear"></div>
	</div>
</div>
</div>
    <!-- End footer bottom area -->
    <!-- jQuery sticky menu -->
    <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.sticky.js"></script>
    
    <!-- jQuery easing -->
    <script src="${pageContext.request.contextPath}/js/jquery.easing.1.3.min.js"></script>
    
    <!-- Main Script -->
    <script src="${pageContext.request.contextPath}/js/main.js"></script>
    
    <!-- Slider -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bxslider.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/script.slider.js"></script>
	
  </body>
</html>