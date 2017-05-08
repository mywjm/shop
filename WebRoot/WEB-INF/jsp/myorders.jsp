<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>我的订单</title>
    
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
   <s:if test="pageBean.list.size() > 0">
	<div class="table-responsive tablecontainer table-bordered">
		<div class="carttitle">
			<h5>我的订单</h5>
		</div>
		<s:iterator value="pageBean.list" var="order">
		<table class="table">
			<tr style="background-color: #FF8C00;">
				<th>商品</th>
				<th>名称</th>
				<th>价格</th>
				<th>数量</th>
				<th>小计</th>
				<th>操作</th>
			</tr>
			<s:iterator value="#order.orderItems" var="item">
					<tr style="background-color: #DEB887 ">
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
							<a href="${ pageContext.request.contextPath }/order_deleteOrderItem.action?itemid=<s:property value="#item.itemid"/>&order.oid=<s:property value="#order.oid" />" class="delete"><img src="${pageContext.request.contextPath }/img/close1.png" /></a>
						</td>
					</tr>
					</s:iterator>
		</table>
		
		<div class="total">
			<div style="float: left;" >订单时间：<s:property value="#order.ordertime+2000" /></div>
			赠送积分: <em id="effectivePoint"><s:property value="#order.total/10" /></em>
			商品金额: <strong id="effectivePrice">￥<s:property value="#order.total"/>元</strong>
		</div>
		<div class="bottom">
			<s:if test="#order.state == 1">
				<a style="cursor: pointer;" href="${pageContext.request.contextPath}/order_gotoPay.action?order.oid=<s:property value="#order.oid" />" id="submit" class="button" >去支付</a>
			</s:if>
			<s:if test="#order.state == 2">
				<a  id="submit" class="button" >待发货</a>
			</s:if>
			<s:if test="#order.state == 3">
				<a style="cursor: pointer;" href="${pageContext.request.contextPath}/order_beyFromCart.action" id="submit" class="button" >确认收货</a>
			</s:if>
			<s:if test="#order.state == 4">
				<s:if test="m[#order.oid] == 0"><a href="${pageContext.request.contextPath}/order_toComment?oid=<s:property value="#order.oid" />" style="padding: 5px 15px; color:#FFFFFF; background-color: #00DD00;">评价</a></s:if>
				<a  id="submit" class="button" >交易完成</a>
			</s:if>
			
		</div><br></s:iterator>
		
	</div>
	</s:if><s:else>
	<div style="margin:20px 0;" align="center"><font size="4em" color="green" >亲，没订单呢！！！</font></div>
		<div  align="center"><img src="${pageContext.request.contextPath}/img/dingdan.jpg" alt="订单" title="订单" /></div>
	</s:else>
	<!-- 分页 -->
<s:if test="pageBean.totalPage != 0">
 <div class="single-product-area">
   <div class="container">
		<div class="row">
                <div class="col-md-12">
                    <div class="product-pagination text-center">
                        <nav>
                          <ul class="pagination  pagination-lg">
                            <li>
                              <a href="${pageContext.request.contextPath}/order_findAll.action?page=1" aria-label="first">
                                <span aria-hidden="true">&laquo;</span>
                              </a>
                            </li>
                            <s:if test="pageBean.page>1">
                            <li>
                              <a href="${pageContext.request.contextPath}/order_findAll.action?page=<s:property value="pageBean.page-1" />" aria-label="Previous">
                                <span aria-hidden="true">上一页</span>
                              </a>
                            </li>
                            </s:if>
                            <s:else>
                            <li>
                            	<a aria-label="Previous">
                                <span aria-hidden="true">上一页</span>
								</a>
							</li>
                            </s:else>
                           
                             <s:if test="pageBean.totalPage >= 5">
                             	<s:if test="pageBean.page >2 " >
	                           	 <li><a href="${pageContext.request.contextPath}/order_findAll.action?page=<s:property value="pageBean.page-2" />"><s:property value="pageBean.page-2" /></a></li>
	                           	 <li><a href="${pageContext.request.contextPath}/order_findAll.action?page=<s:property value="pageBean.page-1" />"><s:property value="pageBean.page-1" /></a></li>
	                           	 <li class="active"><a href="${pageContext.request.contextPath}/order_findAll.action?page=<s:property value="pageBean.page" />" ><s:property value="pageBean.page" /></a></li>
	                           	 <s:if test="pageBean.page < pageBean.totalPage-1">
	                           	 <li><a href="${pageContext.request.contextPath}/order_findAll.action?page=<s:property value="pageBean.page+1" />"><s:property value="pageBean.page+1" /></a></li>
	                           	 <li><a href="${pageContext.request.contextPath}/order_findAll.action?page=<s:property value="pageBean.page+2" />"><s:property value="pageBean.page+2" /></a></li>
	                           	 </s:if>
                           	 	</s:if>
                           	 	<s:if test="pageBean.page==1 " >
                           	 	 <li class="active"><a href="#" ><s:property value="pageBean.page" /></a></li>
	                           	 <li><a href="${pageContext.request.contextPath}/order_findAll.action?page=<s:property value="pageBean.page+1" />"><s:property value="pageBean.page+1" /></a></li>
	                           	 <li><a href="${pageContext.request.contextPath}/order_findAll.action?page=<s:property value="pageBean.page+2" />"><s:property value="pageBean.page+2" /></a></li>
	                           	 <li><a href="${pageContext.request.contextPath}/order_findAll.action?page=<s:property value="pageBean.page+3" />"><s:property value="pageBean.page+3" /></a></li>
	                           	 <li><a href="${pageContext.request.contextPath}/order_findAll.action?page=<s:property value="pageBean.page+4" />"><s:property value="pageBean.page+4" /></a></li>
                           	 	</s:if>
                           	 	<s:if test="pageBean.page==2" >
                           	 	 <li><a href="${pageContext.request.contextPath}/order_findAll.action?page=<s:property value="pageBean.page-1" />"><s:property value="pageBean.page-1" /></a></li>
                           	 	 <li class="active"><a href="${pageContext.request.contextPath}/order_findAll.action?page=<s:property value="pageBean.page" />" ><s:property value="pageBean.page" /></a></li>
                           	 	 <li><a href="${pageContext.request.contextPath}/order_findAll.action?page=<s:property value="pageBean.page+1" />"><s:property value="pageBean.page+1" /></a></li>
                           	 	 <li><a href="${pageContext.request.contextPath}/order_findAll.action?page=<s:property value="pageBean.page+2" />"><s:property value="pageBean.page+2" /></a></li>
                           	 	 <li><a href="${pageContext.request.contextPath}/order_findAll.action?page=<s:property value="pageBean.page+3" />"><s:property value="pageBean.page+3" /></a></li>
                           	 	</s:if>
                              </s:if>
                             
                              	<!-- totalPage小于5 -->
                              <s:if test="pageBean.totalPage == 4">
                              		<li class="active"><a href="${pageContext.request.contextPath}/order_findAll.action?page=<s:property value="pageBean.page" />" ><s:property value="pageBean.page" /></a></li>
                              	</s:if>
                              	<s:if test="pageBean.totalPage == 3">
	                           		 <li class="active"><a href="${pageContext.request.contextPath}/order_findAll.action?page=<s:property value="pageBean.page" />" ><s:property value="pageBean.page" /></a></li>
                              	</s:if>
                              	<s:if test="pageBean.totalPage == 2">
	                           		 <li class="active"><a href="${pageContext.request.contextPath}/order_findAll.action?page=<s:property value="pageBean.page" />" ><s:property value="pageBean.page" /></a></li>
                              	</s:if>
                              	<s:if test="pageBean.totalPage == 1">
	                           		 <li class="active"><a href="${pageContext.request.contextPath}/order_findAll.action?page=<s:property value="pageBean.page" />" ><s:property value="pageBean.page" /></a></li>
                              	</s:if>
                              
                           
                            
                            <s:if test="pageBean.page<pageBean.totalPage">
                            <li>
                              <a href="${pageContext.request.contextPath}/order_findAll.action?page=<s:property value="pageBean.page+1" />" aria-label="Next">
                                <span aria-hidden="true">下一页</span>
                              </a>
                            </li>
                            </s:if>
                            <s:else>
                             <li>
                              <a  aria-label="Next">
                                <span aria-hidden="true">下一页</span>
                              </a>
                            </li>
                            </s:else>
                            <li>
                              <a href="${pageContext.request.contextPath}/order_findAll.action?page=<s:property value="pageBean.totalPage" />" aria-label="last">
                                <span aria-hidden="true">&raquo;</span>
                              </a>
                            </li>
                            <li > <a style="margin: 0 20px;">共<s:property value="pageBean.totalPage" />页   </a> </li>
                          </ul>
                        </nav>   
                        		                 
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    </s:if>
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