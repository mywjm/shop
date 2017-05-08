<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Q淘商城</title>

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
  	<script type="text/javascript">
  		function addcart(pid) {
  			var p = document.getElementById("pid");
  			p.setAttribute("value", pid);
  			document.getElementById("form").submit();
  		}
  	</script>
  </head>
  <body>
      <%@include file="top.jsp" %>
   <s:if test="#session.exitsUser != null">
   <form action="${pageContext.request.contextPath }/cartt_indexAddCart.action" method="post" id="form"> 
   	<input type="hidden" name="pid" value="" id="pid"/>
   	<input type="hidden" name="count" value="1" />
   </form>
   </s:if>
    <div class="slider-area">
        	<!-- Slider -->
			<div class="block-slider block-slider4">
				<ul class="" id="bxslider-home4">
					<s:iterator value="#request.slist" var="s">
					<li>
						<img src="${pageContext.request.contextPath}/<s:property value="#s.image"/>" alt="Slide">
						<div class="caption-group">
							<h2 class="caption title">
								 <span class="primary"><strong><s:property value="#s.pname" /></strong></span>
							</h2>
							<h4 class="caption subtitle"><s:property value="#s.pdesc" /></h4>
							<a class="caption button-radius"  ><span class="icon"></span ><i onclick="addcart(<s:property value="#s.pid" />)" style="cursor: pointer;">加入购物车</i></a>
							
						</div>
					</li>
					</s:iterator>
				</ul>
			</div>
			<!-- ./Slider -->
    </div> <!-- End slider area -->
   

   
   <!-- start main1 -->
<div class="main_bg1">
<div class="wrap">	
	<div class="main1">
		<h2>热门商品</h2>
	</div>
</div>
</div>
<!-- start main -->
<div class="main_bg">
<div class="wrap">	
	<div class="main">
		<!-- start grids_of_3 -->
		
		<div class="grids_of_3">
			<s:iterator value="hList1" var="h1">
			<div class="grid1_of_3 ">
				<a href="${pageContext.request.contextPath }/product_findByPid?pid=<s:property value="#h1.pid" /> ">
					<img  src="${pageContext.request.contextPath}/<s:property value="#h1.image"  />" alt="" />
					<div class="imgdesc">
					<h7><a href="${pageContext.request.contextPath }/product_findByPid?pid=<s:property value="#h1.pid" />" title="<s:property value="#h1.pname" />"><s:property value="#h1.pname" /></a></h7>
					</div>
					<div class="price">
						<h4>￥<s:property value="#h1.shop_price" />元<span><i onclick="addcart(<s:property value="#h1.pid" />)" style="cursor: pointer;">加入购物车</i></span></h4>
					</div>
					<span class="b_btm"></span>
				</a>
			</div>
			</s:iterator>
			<div class="clear"></div> 
		</div>
		
		<div class="grids_of_3">
			<s:iterator value="hList2" var="h2">
			<div class="grid1_of_3">
				<a href="${pageContext.request.contextPath }/product_findByPid?pid=<s:property value="#h2.pid" /> ">
					<img src="${pageContext.request.contextPath}/<s:property value="#h2.image" />" alt=""  />
					<div class="imgdesc">
					<h7><a href="${pageContext.request.contextPath }/product_findByPid?pid=<s:property value="#h2.pid" />" title="<s:property value="#h2.pname" />"><s:property value="#h2.pname" /></a></h7>
					</div>
					<div class="price">
						<h4>￥<s:property value="#h2.shop_price" />元<span ><i onclick="addcart(<s:property value="#h2.pid" />)" style="cursor: pointer;">加入购物车</i></span></h4>
					</div>
					<span class="b_btm"></span>
				</a>
			</div>
			</s:iterator>
		<div class="clear"></div> 
		</div>
		<!-- end grids_of_3 -->
	</div>
</div>
</div>	

<!--divi maincontent-area --> 
<div class="main_bg1">
<div class="wrap">	
	<div class="main1">
		<h2>热卖促销</h2>
	</div>
</div>
</div>
    <div class="maincontent-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="latest-product">
                        <div class="product-carousel">
                          <s:iterator value="nList" var="n">
                            <div class="single-product">
                                <div class="product-f-image">
                                    <img src="${pageContext.request.contextPath}/<s:property value="#n.image" />" alt="">
                                    <div class="product-hover">
                                        <a  class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> <i onclick="addcart(<s:property value="#n.pid" />)" style="cursor: pointer;">加入购物车</i></a>
                                        <a href="${pageContext.request.contextPath }/product_findByPid?pid=<s:property value="#n.pid" />" class="view-details-link"><i class="fa fa-link"></i>  商品详情 </a>
                                    </div>
                                </div>
                                <div class="imgdesc">
                               <a href="${pageContext.request.contextPath }/product_findByPid?pid=<s:property value="#n.pid" />" ><s:property value="#n.pname" /></a>
                                </div>
                                <div class="product-carousel-price">
                                    <ins>￥<s:property value="#n.shop_price" />元</ins> <del>￥<s:property value="#n.market_price" />元</del>
                                </div> 
                            </div>
                 		 </s:iterator>
                         
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End main content area -->
   <!-- main2 --> 
<div class="main_bg1">
<div class="wrap">	
	<div class="main1">
		<h2>热门品牌</h2>
	</div>
</div>
</div>
    <div class="brands-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="brand-wrapper">
                        <div class="brand-list">
                        <s:iterator value="logoList" var="l">
                            <a href="${pageContext.request.contextPath }/product_SearchKeyWord.action?keyWord=<s:property value="#l.pname" />&page=1   ">
                            <img src="${pageContext.request.contextPath}/<s:property value="#l.image" />"  alt="<s:property value="#l.pname" />">
                            </a>
                         </s:iterator>                       
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End brands area -->
   
    <div class="product-widget-area">
        
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="single-product-widget">
                        <h2 class="product-wid-title">  潮流女包</h2>
                        <a href="${pageContext.request.contextPath }/product_findByCsid?csid=9&page=1" class="wid-view-more">更多</a>
                       <s:iterator value="nvbaolist" var="n">
                        <div class="single-wid-product">
                            <a href="${pageContext.request.contextPath }/product_findByPid?pid=<s:property value="#n.pid" />" title="<s:property value="#n.pname" />"><img src="${pageContext.request.contextPath}/<s:property value="#n.image" />" alt="" class="product-thumb"></a>
                             <div style="height: 100px; overflow:hidden;">
                            <h2><a  href="${pageContext.request.contextPath }/product_findByPid?pid=<s:property value="#n.pid" />" title="<s:property value="#n.pname" />"><s:property value="#n.pname" /></a></h2>
                           	</div>
                            <div class="product-wid-rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                        </div>
                        <div class="product-wid-price">
                             <i class="myprice">劲爆价：</i>	 <ins>￥<s:property value="#n.shop_price" />元</ins> <del>￥<s:property value="#n.market_price" />元</del>
                        </div>  
         		   </s:iterator>
                
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="single-product-widget">
                        <h2 class="product-wid-title">  小米系列</h2>
                        <a href="${pageContext.request.contextPath }/product_findByCsid?csid=58&page=1" class="wid-view-more">更多</a>
                         <s:iterator value="yingyinlist" var="y">
                        <div class="single-wid-product">
                            <a href="${pageContext.request.contextPath }/product_findByPid?pid=<s:property value="#y.pid" />" title="<s:property value="#y.pname" />"><img src="${pageContext.request.contextPath}/<s:property value="#y.image" />" alt="" class="product-thumb"></a>
                            <div style="height: 100px; overflow:hidden;">
                            <h2><a href="${pageContext.request.contextPath }/product_findByPid?pid=<s:property value="#y.pid" />" title="<s:property value="#y.pname" />"><s:property value="#y.pname" /></a></h2>
                           </div>
                            <div class="product-wid-rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                        </div>
                         <div class="product-wid-price">
                           <i class="myprice">劲爆价：</i>	 <ins>￥<s:property value="#y.shop_price" />元</ins> <del>￥<s:property value="#y.market_price" />元</del>
                         </div>  
                 </s:iterator>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="single-product-widget">
                        <h2 class="product-wid-title">  女短外套</h2>
                        <a href="${pageContext.request.contextPath }/product_findByCsid?csid=1&page=1" class="wid-view-more">更多</a>
                        <s:iterator value="shoubiaolist" var="s">
                        <div class="single-wid-product">
                            <a href="${pageContext.request.contextPath }/product_findByPid?pid=<s:property value="#s.pid" />" title="<s:property value="#s.pname" />"><img src="${pageContext.request.contextPath}/<s:property value="#s.image" />" alt="" class="product-thumb"></a>
                            <div style="height: 100px; overflow:hidden;">
                            <h2><a href="${pageContext.request.contextPath }/product_findByPid?pid=<s:property value="#s.pid" />" title="<s:property value="#s.pname" />"><s:property value="#s.pname" /></a></h2>
                            </div>
                            <div class="product-wid-rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                        </div>
                         <div class="product-wid-price">
                              <i class="myprice">劲爆价：</i>	   <ins>￥<s:property value="#s.shop_price" />元</ins> <del>￥<s:property value="#s.market_price" />元</del>
                            </div>  
                         </s:iterator>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End product widget area -->
    
    
  <%@include file="bottom.jsp" %>
    <!-- End footer bottom area -->
   <%--  <!-- Latest jQuery form server -->
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    
    <!-- Bootstrap JS form CDN -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script> --%>
     <!-- Latest jQuery form server -->
    <script src="https://code.jquery.com/jquery.min.js"></script>
    
    <!-- Bootstrap JS form CDN -->
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    
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