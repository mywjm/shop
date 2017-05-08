<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>订单页</title>
    
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
     <script type="text/javascript">
   	function submitform(){
   		document.getElementById("form").submit();
   	}
    </script>
  </head>
  <body>
   <%@include file="top.jsp" %>
   <!-- 订单列表 -->
   	<div class="table-responsive tablecontainer">
		<div class="carttitle">
			<h5>订单列表</h5>
		</div>
		<div class="ordercolor">
		<table class="table table-bordered">
			<tr>
				<th>商品</th>
				<th>名称</th>
				<th>价格</th>
				<th>数量</th>
				<th>小计</th>
				<th>操作</th>
			</tr>
			<s:iterator value="order.orderItems" var="item">
					<tr>
						<td >
							<a target="_blank" href="${pageContext.request.contextPath }/product_findByPid?pid=<s:property value="#item.product.pid" />">
							<img class="imgbox" src="${ pageContext.request.contextPath }/<s:property value="#item.product.image"/>"/>
							</a>
						</td>
						<td>
							<a  target="_blank" href="${pageContext.request.contextPath }/product_findByPid?pid=<s:property value="#item.product.pid" />"> <s:property value="#item.product.pname"/></a>
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
							<a href="${ pageContext.request.contextPath }/order_deleteItem.action?itemid=<s:property value="#item.itemid"/>&order.oid=<s:property value="order.oid" />" class="delete"><img src="${pageContext.request.contextPath }/img/close1.png" /></a>
						</td>
					</tr>
					</s:iterator>
		</table>
		</div>
		<div class="total">
			赠送积分: <em id="effectivePoint"><s:property value="order.total/10"/></em>
			商品金额: <strong id="effectivePrice">￥<s:property value="order.total"/>元</strong>
		</div>
		<!-- 收货地址 -->
		<div>
		<hr/>
			<form action="${pageContext.request.contextPath}/orderr_payOrder.action" method="post" id="form">
				<s:token></s:token>
				<input type="hidden" name="order.oid" value="<s:property value="order.oid"/>" /> 
				<s:if test="#session.address.size() > 0" >
			  配送详情：	<s:select name="aid" list="#session.address" listKey="aid" listValue="'收货人：'+consignee+'联系电话：'+phone+'收货地址：'+addr" >
				</s:select>
				</s:if>
				<s:else>
				<p><font color="red">没有收货地址</font></p>
				</s:else>
				<a href="${pageContext.request.contextPath}/address_addAddress.action">添加收货地址</a>
					<hr/>
						选择银行：
						<div class="table-responsive">
						  <table class="table">
						   <tr>
						   		<td>
						   			<input type="radio" name="pd_FrpId" value="ICBC-NET-B2C" checked="checked"/>工商银行
						   		</td><td>
									<img src="${pageContext.request.contextPath}/bank_img/icbc.bmp" align="middle"/>
						   		</td>
						   		<td>
						   			<input type="radio" name="pd_FrpId" value="BOC-NET-B2C"/>中国银行
						   				</td><td>
									<img src="${pageContext.request.contextPath}/bank_img/bc.bmp" align="middle"/>
						   		</td>
						   		<td>
						   			<input type="radio" name="pd_FrpId" value="CEB-NET-B2C"/>光大银行
						   				</td><td>
									<img src="${pageContext.request.contextPath}/bank_img/guangda.bmp" align="middle"/>
						   		</td>
						   </tr>
						   <tr>
						   		<td>
									<input type="radio" name="pd_FrpId" value="ABC-NET-B2C"/>农业银行
										</td><td>
									<img src="${pageContext.request.contextPath}/bank_img/abc.bmp" align="middle"/>
						   		</td>
						   		<td>
						   			<input type="radio" name="pd_FrpId" value="BOCO-NET-B2C"/>交通银行
						   				</td><td>
									<img src="${pageContext.request.contextPath}/bank_img/bcc.bmp" align="middle"/>
						   		</td>
						   		<td>
						   			<input type="radio" name="pd_FrpId" value="PINGANBANK-NET"/>平安银行
						   				</td><td>
									<img src="${pageContext.request.contextPath}/bank_img/pingan.bmp" align="middle"/>
						   		</td>
						   </tr>
						   <tr>
						   		<td>
						   			<input type="radio" name="pd_FrpId" value="CMBCHINA-NET-B2C"/>招商银行
						   				</td><td>
									<img src="${pageContext.request.contextPath}/bank_img/cmb.bmp" align="middle"/>
						   		</td>
						   		<td>
						   			<input type="radio" name="pd_FrpId" value="CCB-NET-B2C"/>建设银行
						   				</td><td>
									<img src="${pageContext.request.contextPath}/bank_img/ccb.bmp" align="middle"/>
						   		</td>
						   		<td>
						   			<input type="radio" name="pd_FrpId" value="POST-NET-B2C"/>中国邮政
						   				</td><td>
									<img src="${pageContext.request.contextPath}/bank_img/post.bmp" align="middle"/>
						   		</td>
						   </tr>
						  </table>
						</div>
			</form>
		</div>
		<div class="bottom">
			<button id="submit" class="button"  onclick="submitform()">支付</button>
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