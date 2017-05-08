<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>重置密码</title>
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
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/regist.js" charset="UTF-8"></script>
   
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
                           	<li><a href="#"><i class="glyphicon glyphicon-leaf"></i> &nbsp;&nbsp;购物指南</a></li>
                            <li class="dropdown dropdown-small">
                                <a data-toggle="dropdown" data-hover="dropdown" class="dropdown-toggle" href="#"><span class="glyphicon glyphicon-info-sign"> </span><i >&nbsp;&nbsp;更多服务</i><span class="value"></span><b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">退货政策</a></li>
                                    <li><a href="#">意见建议</a></li>
                                    <li><a href="#">关于我们</a></li>
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

<!-- login-form -->
 <div style="background-color: #AAAAAA; padding: 150px 0;" >
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-offset-4 col-sm-8">
		    		 <h1 class="divleft topform">重置密码</h1>
			</div>
			<div class="col-sm-offset-2 col-sm-10">
		    		 	<font color="red" class="divleft topform"><s:actionerror/></font>
		     </div>
		</div>
		<div class="row">
			<div class="regist-content col-sm-offset-2 col-sm-10">
					<form class="form-horizontal" action = "${pageContext.request.contextPath}/user_submitpassword.action" method="post" id="formid"  name="form1" onsubmit="checkUser()">
					<input type="hidden" name="uid" value="<s:property value="#request.uid" />">
                <div class="form-group">
					    <label for="password" class="col-sm-2 control-label">密码</label>
					    <div class="col-sm-4">
					      <input type="password" name="password" class="form-control" id="password" placeholder="密码" onblur="checkPassword()">
					    </div>
						<div class="col-sm-4"> 
					    <span id="span3" class="divleft"></span>
					    <font color="red"><s:fielderror fieldName="password"></s:fielderror></font>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="repassword" class="col-sm-2 control-label">确认密码</label>
					    <div class="col-sm-4">
					      <input type="password" class="form-control" id="repassword" placeholder="确认密码" onblur="checkRepassword()">
					    </div>
					    <div class="col-sm-4"> 
					    <span id="span4" class="divleft"></span>
					    </div>
					  </div>
               			  <div class="form-group">
					    <div class="col-sm-offset-2 col-sm-10">
					      <button type="submit" name="sub" class="btn btn-default divleft" >重置</button>
					    </div>
					  </div>
      
            </form>
        </div>
        </div></div></div>
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