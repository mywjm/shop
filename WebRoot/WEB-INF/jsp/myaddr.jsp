<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>收货地址管理</title>
    
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
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/details.css">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  <script  type="text/javascript">
  	function isSure(){
		if(!confirm("确认操作？")) {
			
			return false;
		}  	
  	}
  </script>
  </head>
  <body>
   <%@include file="top.jsp" %>
   <s:if test="#session.myAddr.size() > 0">
   <div class="table-responsive" style="padding: 50px;">
   <div class="carttitle">
			<h5>收货地址</h5>
	</div>
 	 <table class="table">
   	<tr> 
   		<th>收货人</th>
   		<th>联系电话</th>
   		<th>收货地址</th>
   		<th><a href="${pageContext.request.contextPath}/address_addAddress.action" style="cursor: pointer"><img src="${pageContext.request.contextPath}/img/add.jpg" /></a></th>
   		<th><a href="${pageContext.request.contextPath}/address_deleteAll.action" style="cursor: pointer" onclick="isSure()"><img src = "${pageContext.request.contextPath}/img/del.jpg" /></a></th>
   		<th>更新</th>
   	</tr>
   	<s:iterator value="#session.myAddr"  var="a">
   	<tr>
   		<td><s:property value="#a.consignee" /></td>
   		<td><s:property value="#a.phone" /></td>
   		<td><s:property value="#a.addr" /></td>
		<td><a></a></td>
		<td><a href="${pageContext.request.contextPath}/address_delete.action?aid=<s:property value="#a.aid" />" style="cursor: pointer" onclick="isSure()"><img src = "${pageContext.request.contextPath}/img/delete.jpg" /></a></td>
		<td><a href="${pageContext.request.contextPath}/address_toUpdate.action?aid=<s:property value="#a.aid" />" style="cursor: pointer"><img src="${pageContext.request.contextPath}/img/update.jpg" /></a></td>
   	</tr>
   </s:iterator>
   </table>
   </div>
   </s:if>
   <s:else>
   	<div style="margin:20px 0;" align="center"><font size="4em" color="green" >还没收货地址呢！！！</font></div>
	<div  align="center" ><img src="${pageContext.request.contextPath}/img/addr.jpg" alt="地址" title="地址"  /></div>
   </s:else>
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