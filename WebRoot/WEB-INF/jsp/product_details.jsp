<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>商品详情</title>
    
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
   	function bey(){
   		 var count = document.getElementById("count").value;
   		 var hiddenCount = document.getElementById("count1");
   		 hiddenCount.setAttribute("value", count);
   		document.getElementById("form1").submit();
    
   	}
   	
   	function checklogin(){
   		if(confirm("请登录后操作，是否登录？")) {
   			location.href="user_loginPage.action";
   		}
   		
   	}

  	function submit() {
  	
  		 // 1.创建异步交互对象
		var xhr = createXmlHttp();
		// 2.设置监听
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4){
				if(xhr.status == 200){
					document.getElementById("span1").innerHTML = xhr.responseText;
				}
			}
		};
		// 3.打开连接
		xhr.open("GET","${pageContext.request.contextPath}/favorites_addFavorites.action?time="+new Date().getTime()+"&pid="+<s:property value="model.pid" />,true);
		// 4.发送
		xhr.send(null);
	
  	}
	
	function createXmlHttp(){
		   var xmlHttp;
		   try{ // Firefox, Opera 8.0+, Safari
		        xmlHttp=new XMLHttpRequest();
		    }
		    catch (e){
			   try{// Internet Explorer
			         xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
			      }
			    catch (e){
			      try{
			         xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
			      }
			      catch (e){}
			      }
		    }

			return xmlHttp;
		 }
 	
    </script>
</head>
  <body>
   <%@include file="top.jsp" %>
   	
   <!-- start main -->
<div class="main_bg">
<div class="wrap">	
	<div class="main">
	<!-- start content -->
	<div class="single">
			<!-- start span1_of_1 -->
			<div class="left_content">
			<div class="span1_of_1 ">
				<!-- start product_slider -->
				<div class="product-view ">
				    <div class="product-essential">
				    <div class="product-img-box ">
				    <div class="product-image" > 
				        <a target="_blank"   href="${pageContext.request.contextPath }/<s:property value="model.image" />"   >
				           	<img src="${pageContext.request.contextPath }/<s:property value="model.image" />"  alt="<s:property value="model.pname" />" title="<s:property value="model.pname" />" />
				        </a>
				   </div>
				  
				</div>
				</div>
				</div>
				<s:if test="#session.exitsUser != null">
				<s:if test="#session.empty == 0" >
				<div  style="padding: 5px 0 0;">
				<span id="span1"><a id="bt" onclick="submit()" style="cursor: pointer">添加到收藏夹</a></span>
				
				</div>
				</s:if>
				<s:else>
				<div  style="padding: 5px 0 0;">
				<a id="bt"  style="cursor: pointer">已经添加到收藏夹</a>
				</div>
				</s:else>
				</s:if>
				
				<!-- end product_slider -->
			</div>
			<!-- start span1_of_1 -->
			<div class="span1_of_1_des">
				  <div class="desc1">
					<h3><s:property value="model.pname" /></h3>
					<p>产品编号:<s:property value="model.pid" /></p>
					<h6>限时促销（2017.01-2017.06）</h6>
					 <div class="product-carousel-price">
                  		<ins>￥<s:property value="model.shop_price" />元</ins> <del>￥<s:property value="model.market_price" />元</del>
              		 	<p><span class="glyphicon glyphicon-hand-right" aria-hidden="true"></span><a href="#">客服</a></p>
              		  </div>
					
					<div class="available">
					<s:if test="#session.exitsUser != null">
						<div class="btn_form">
							<form action="${pageContext.request.contextPath }/cart_addCart.action" method="post">
							<s:token></s:token>
							<input type="hidden" name="pid" value="<s:property value="model.pid"/>" />
							数量:
							<input type="number" id="count" size="4" class="input-text qty text" title="Qty" value="1" name="count" min="1" step="1" style="width:50px;">
							<input type="submit" value="添加到购物车" title="" />
							<input type="button" value="立即购买" onclick="bey()"/>
							</form>
							<form id="form1" action="${pageContext.request.contextPath }/orderr_bey.action" method="post">
							<s:token></s:token>
							<input type="hidden" name="pid" value="<s:property value="model.pid"/>" />
							<input type="hidden" name="count" id="count1"/>
							</form>
						</div>
						</s:if>
						<s:else>
						<div class="btn_form">
							<form >
							<s:token></s:token>
							<input type="hidden"name="pid" value="<s:property value="model.pid"/>" />
							数量:
							<input type="number" id="count" size="4" class="input-text qty text" title="Qty" value="1" name="count" min="1" step="1" style="width:50px;">
							<input type="button" value="添加到购物车" onclick="checklogin()"/>
							<input type="button" value="立即购买"  onclick="checklogin()"/>
							</form>
							</div>
						</s:else>
						<div class="clear"></div>
					</div>
			   	 </div>
			   	</div>
			   	<div class="clear"></div>
			   	<!-- start tabs -->
				   	<section class="tabs">
		            <input id="tab-1" type="radio" name="radio-set" class="tab-selector-1" checked="checked">
			        <label for="tab-1" class="tab-label-1">用户评论</label>
			
		            <input id="tab-2" type="radio" name="radio-set" class="tab-selector-2">
			        <label for="tab-2" class="tab-label-2">商品详情</label>
			
		           
	          
				    <div class="clear-shadow"></div>
					
			        <div class="content">
				        <div class="content-1">
				        	<p class="para top"><span>LOREM IPSUM</span>  </p>
							<ul>
								<li>Research</li>
								<li>Design and Development</li>
								<li>Porting and Optimization</li>
								<li>System integration</li>
								<li>Verification, Validation and Testing</li>
								<li>Maintenance and Support</li>
							</ul>
							<div class="clear"></div>
						</div>
				        <div class="content-2">
							<p class="para"><span>产品介绍</span>  </p>
							<ul class="qua_nav">
								<li><s:property value="model.pdesc" /></li>
							</ul>
						</div>
			        </div>
			        </section>
		         	<!-- end tabs -->
			   	</div>
			   	<!-- start sidebar -->
			 <div class="left_sidebar">
					<div class="sellers">
						<h4>热门推荐</h4>
						<div class="single-nav">
			                <ul>
			                <s:iterator value="list" var="l">
			                   <li>
			                   <a href="${pageContext.request.contextPath }/product_findByPid?pid=<s:property value="#l.pid" />">
			                   	<img class="detailright" title="<s:property value="#l.pname" />" alt="<s:property value="#l.pname" />" src="${pageContext.request.contextPath}/<s:property value="#l.image"/>">
			                   </a>
			                    <div class="product-wid-price" align="center">
			                   <ins>￥<s:property value="#l.shop_price" />元</ins> <del>￥<s:property value="#l.market_price" />元</del>
			                  	</div>
			                   </li>
			                   </s:iterator>
			                </ul>
			              </div>
						  <div class="banner-wrap bottom_banner color_link">
								<a href="#" class="main_link">
								<figure><img src="${pageContext.request.contextPath }/img/delivery.png" alt=""></figure>
								<h5><span>包邮政策</span><br> 满99块包邮</h5></a>
						 </div> 
					</div>
				</div>
					<!-- end sidebar -->
          	    <div class="clear"></div>
	       </div>	
	<!-- end content -->
	</div>
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