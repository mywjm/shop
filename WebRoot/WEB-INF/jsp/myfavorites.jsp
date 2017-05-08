<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>我的收藏夹</title>
    
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

  </head>
  <body>
   <%@include file="top.jsp" %>
   <s:if test="#session.flist.size() > 0">
	<div class="table-responsive tablecontainer table-bordered">
		<div class="carttitle">
			<h5>收藏夹</h5>
		</div>
		<table class="table table-hover">
			<tr>
				<th>商品</th>
				<th>名称</th>
				<th>价格</th>
				<th>操作</th>
			</tr>
			<s:iterator value="#session.flist" var="f">
					<tr>
						<td >
							<a target="_blank" href="${pageContext.request.contextPath }/product_findByPid?pid=<s:property value="#f.product.pid" />">
							<img class="imgbox" src="${ pageContext.request.contextPath }/<s:property value="#f.product.image"/>"/>
							</a>
						</td>
						<td>
							<a class="pname" target="_blank" href="${pageContext.request.contextPath }/product_findByPid?pid=<s:property value="#f.product.pid" />"> <s:property value="#f.product.pname"/></a>
						</td>
						<td>
							￥<s:property value="#f.product.shop_price"/>元
						</td>
						<td>
							<a href="${ pageContext.request.contextPath }/favorites_delete.action?pid=<s:property value="#f.product.pid"/>" class="delete"><img src="${pageContext.request.contextPath }/img/close1.png" /></a>
						</td>
					</tr>
					</s:iterator>
		</table>
	</div>
	</s:if>
	<s:else>
	<div style="margin:20px 0;" align="center"><font size="4em" color="green" >收藏夹空的！！！</font></div>
		<div  align="center" ><img src="${pageContext.request.contextPath}/img/shouchangjia.jpg" alt="收藏夹" title="收藏夹"  /></div>
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