<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>添加收货地址</title>
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
 	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/regist.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
   
  </head>
  <body>
     <div class="header-area">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="user-menu">
                        <ul>
                     		<s:if test="#session.exitsUser != null">
                            <li><a href="${pageContext.request.contextPath}/user_myqtao.action"><i class="glyphicon glyphicon-home"></i> &nbsp;&nbsp;我的Q淘</a></li>
                            <li><a href="${pageContext.request.contextPath}/favorites_MyFavorites.action"><i class="fa fa-heart"></i> 收藏夹</a></li>
                            <li><a href="${pageContext.request.contextPath}/cartt_myCart.action"><i class="glyphicon glyphicon-shopping-cart"></i>&nbsp;&nbsp;购物车</a></li>
                            <li><a href="${pageContext.request.contextPath}/order_findAll.action?page=1"><i class="fa fa-user"></i> 我的订单</a></li>
                           	<li><a href="${pageContext.request.contextPath}/user_quit.action"><i class="glyphicon glyphicon-log-out"></i> &nbsp;&nbsp;退出</a></li>
                     		</s:if>
                            <s:else>
                            <li><a href="${pageContext.request.contextPath}/user_loginPage.action"><i class="glyphicon glyphicon-log-in"></i> &nbsp;&nbsp;登陆</a></li>
                            <li><a href="${pageContext.request.contextPath}/usert_registPage.action"><i class="fa fa-user"></i> 注册</a></li>
                            </s:else>
                        </ul>
                    </div>
                </div>
                
                <div class="col-md-6">
                    <div class="header-right">
                        <ul class="list-unstyled list-inline">
                           	<li><a href="#"><i class="glyphicon glyphicon-leaf"></i> &nbsp;&nbsp;购物指南</a></li>
                            <li class="dropdown dropdown-small">
                                <a data-toggle="dropdown" data-hover="dropdown" class="dropdown-toggle" href="#"><span class="glyphicon glyphicon-info-sign"> </span><i >&nbsp;&nbsp;更多服务</i><span class="value"></span><b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="${pageContext.request.contextPath}/">退货政策</a></li>
                                    <li><a href="${pageContext.request.contextPath}/">意见建议</a></li>
                                    <li><a href="${pageContext.request.contextPath}/">关于我们</a></li>
                                </ul>
                            </li>
                            <li><a ><i class="glyphicon glyphicon-phone-alt"></i> &nbsp;&nbsp;客服电话：020-81556328</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End header area -->
    <div class="header_bg">
<div class="wrap">
	<div class="header">
		<div class="logo">
			<a href="${pageContext.request.contextPath }/index.action"><img src="${pageContext.request.contextPath}/img/logo.png" alt=""/> </a>
		</div>
		<s:if test="#session.exitsUser != null">
		<div class="h_icon">
		<ul class="icon1 sub-icon1">
			<li>
				<a class="active-icon c1" href="${pageContext.request.contextPath}/portrait_myportrait.action"><img src="${pageContext.request.contextPath}/<s:property value="#session.exitsUser.portrait" />" alt="头像" />
				
				</a>
				<ul class="sub-icon1 list">
					<li><p> <a href="${pageContext.request.contextPath}/user_MyLogistical.action">我的物流</a> </p></li>
					<li><p> <a href="${pageContext.request.contextPath}/address_myAddr.action ">收货地址</a> </p></li>
				</ul>
			</li>
			<li style="padding: 10px 0;">
				<i ><font color="green"><s:property value="#session.exitsUser.nickname"/></font></i>
			</li>
		</ul>
		</div>
		</s:if>
		<div class="h_search">
    		<form>
    			<input type="text" value="宝贝" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = '宝贝';}">
    			<input type="submit" value="">
    		</form>
		</div>
		<div class="clear"></div>
	</div>
</div>
</div>
<!-- login-form -->
 <div class="page-container">
 <div style="margin: 10px 250px 10px 50px; padding: 10px;">
 	<div class="row">
 	 <h1>添加收货地址</h1>
	<form class="form-horizontal" action="${pageContext.request.contextPath }/address_add.action" method="post">
  <div class="form-group">
    <label for="consignee" class="col-sm-2 control-label">收货人</label>
    <div class="col-sm-10">
      <input type="text" name="consignee" class="form-control" id="consignee" placeholder="收货人">
    </div>
  </div>
  <div class="form-group">
    <label for="phone" class="col-sm-2 control-label">联系电话</label>
    <div class="col-sm-10">
      <input type="text" name="phone" class="form-control" id="phone" placeholder="电话">
    </div>
  </div>
 <div class="form-group">
    <label for="addr" class="col-sm-2 control-label">收货地址</label>
    <div class="col-sm-10">
      <input type="text" name="addr" class="form-control" id="addr" placeholder="地址">
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-default">添加</button>
    </div>
  </div>
</form>  
</div>
</div>
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