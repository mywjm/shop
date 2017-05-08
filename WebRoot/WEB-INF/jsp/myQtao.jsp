<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>我的Q淘</title>
    
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
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  
  </head>
  <body>
   <%@include file="top.jsp" %>
  	<div style="background-color: #EEFFBB;">
   		<div style="margin: 0 50px;padding:50px 0; background-color: #DDDDDD; ">
			<form class="form-horizontal" action="${pageContext.request.contextPath }/user_updateUser.action" method="post">
			  <div class="form-group">
			    <label for="nickname" class="col-sm-2 control-label">昵称</label>
			    <div class="col-sm-6">
			      <input type="text" name="nickname" value="<s:property value="#session.exitsUser.nickname" />" class="form-control" id="nickname" placeholder="nickname" >
			    </div>
			    <div class="col-sm-4">
			    <p>用于交友的昵称</p>
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="name" class="col-sm-2 control-label">真实姓名</label>
			    <div class="col-sm-6">
			      <input type="text" name="name" value="<s:property value="#session.exitsUser.name" />" class="form-control" id="name" placeholder="name">
			    </div>
			     <div class="col-sm-4">
			    <p>填写用户姓名，以便于联系</p>
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="gender" class="col-sm-2 control-label">性别</label>
			    <div class="col-sm-6">
			      <label class="radio-inline">
			      	<s:if test="#session.exitsUser.gender=='man' ">
					  <input type="radio" name="gender" id="gender" value="man" checked="checked"> 男
					 </s:if>
					 <s:else>
					 	 <input type="radio" name="gender" id="gender" value="man"> 男
					 </s:else>
				 </label>
				<label class="radio-inline">
				<s:if test="#session.exitsUser.gender=='female' ">
				  <input type="radio" name="gender" id="gender" value="female"  checked="checked"> 女
				  </s:if>
				  <s:else>
				   	<input type="radio" name="gender" id="gender" value="female" > 女
				  </s:else>
				</label>
			    </div>
			     <div class="col-sm-4">
			    
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="birthday" class="col-sm-2 control-label">出生年月日</label>
			    <div class="col-sm-6">
			      <input type="date" name="birthday" value="<s:property value="#session.exitsUser.birthday" />" class="form-control" id="birthday" placeholder="birthday">
			    </div>
			     <div class="col-sm-4">
			    
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="residence" class="col-sm-2 control-label">居住地址</label>
			    <div class="col-sm-6">
			      <input type="text" name="residence" value="<s:property value="#session.exitsUser.residence" />" class="form-control" id="residence" placeholder="residence">
			    </div>
			     <div class="col-sm-4">
			    <p>填写用户居住地址，以便于后期服务</p>
			    </div>
			  </div>

	
			  <div class="form-group">
			    <div class="col-sm-offset-2 col-sm-6">
			      <button type="submit" class="btn btn-default">保存修改</button>
			    </div>
			   <div class="col-sm-4">
			    <font color="red"><s:actionmessage/></font>
			   </div>
			  </div>
			  
			</form>	
		
   		</div>
   		
</div>
   <%@include file="bottom.jsp" %>
   
    
 
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