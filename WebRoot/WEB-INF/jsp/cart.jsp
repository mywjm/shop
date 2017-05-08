<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>购物车</title>
    
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
   <s:if test="#session.cart.cartItems.size() > 0">
	<div class="table-responsive tablecontainer table-bordered">
		<div class="carttitle">
			<h5>购物车</h5>
		</div>
		<table class="table table-hover">
			<tr>
				<th>商品</th>
				<th>名称</th>
				<th>价格</th>
				<th>数量</th>
				<th>小计</th>
				<th>操作</th>
			</tr>
			<s:iterator value="#session.cart.cartItems" var="item">
					<tr>
						<td >
							<a target="_blank" href="${pageContext.request.contextPath }/product_findByPid?pid=<s:property value="#item.product.pid" />">
							<img class="imgbox" src="${ pageContext.request.contextPath }/<s:property value="#item.product.image"/>"/>
							</a>
						</td>
						<td>
							<a class="pname" target="_blank" href="${pageContext.request.contextPath }/product_findByPid?pid=<s:property value="#item.product.pid" />"> <s:property value="#item.product.pname"/></a>
						</td>
						<td>
							￥<s:property value="#item.product.shop_price"/>元
						</td>
						<td >
						<s:property value="#item.count"/>
						</td>
						<td >
							￥<s:property value="#item.subtotal"/>元
						</td>
						<td>
							<a href="${ pageContext.request.contextPath }/cartt_deleteCartItem.action?pid=<s:property value="#item.product.pid"/>" class="delete"><img src="${pageContext.request.contextPath }/img/close1.png" /></a>
						</td>
					</tr>
					</s:iterator>
		</table>
		
		<div class="total">
			赠送积分: <em id="effectivePoint">${session.cart.total/10}</em>
			商品金额: <strong id="effectivePrice">￥<s:property value="#session.cart.total"/>元</strong>
		</div>
		<div class="bottom">
			<a href="${pageContext.request.contextPath }/cartt_clearCart.action" id="clear" class="button" >清空购物车</a>
			<a href="${pageContext.request.contextPath}/order_submit.action" id="submit" class="button" >立即购买</a>
		</div>
	</div>
	</s:if>
	<s:else>
		<div style="margin:20px 0;" align="center"><font size="4em" color="green" >购物车空空的，赶紧添加吧！！！</font></div>
		<div  align="center" ><img src="${pageContext.request.contextPath}/img/timg.jpg" alt="购物车" title="购物车"  /></div>
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