<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><s:property value="category.cname" /></title>
     <!-- Latest jQuery form server -->
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <!-- Bootstrap JS form CDN -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script> 
  <%--   <script src="https://code.jquery.com/jquery.min.js"></script> --%>
    <script type="text/javascript" src="js/jquery.mixitup.min.js"></script>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style1.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css">
	<link href="${pageContext.request.contextPath}/css/lanrenzhijia.css" type="text/css" rel="stylesheet" />
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  <script type="text/javascript">
	$(function () {
		
		var filterList = {
		
			init: function () {
			
				// MixItUp plugin
				// http://mixitup.io
				$('#portfolio').mixitup({
					targetSelector: '.portfolio',
					filterSelector: '.filter',
					effects: ['fade'],
					easing: 'snap',
					// call the hover effect
					onMixEnd: filterList.hoverEffect()
				});				
			
			},
			
			hoverEffect: function () {
			
				// Simple parallax effect
				$('#portfolio .portfolio').hover(
					function () {
						$(this).find('.label').stop().animate({bottom: 0}, 200, 'easeOutQuad');
						$(this).find('img').stop().animate({top: -30}, 500, 'easeOutQuad');				
					},
					function () {
						$(this).find('.label').stop().animate({bottom: -40}, 200, 'easeInQuad');
						$(this).find('img').stop().animate({top: 0}, 300, 'easeOutQuad');								
					}		
				);				
			
			}

		};
		
		// Run the show!
		filterList.init();
		
		
	});	
	</script>
	<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event){		
				event.preventDefault();
				$('html,body').animate({scrollTop:$(this.hash).offset().top},1200);
			});
		});
	</script>
	
</head>
 <body>
<%@include file="top.jsp" %>

<!-- start main -->
<div class="main_bg">
<div class="l_nav">  
	<s:iterator value="#session.cslist" var="cs" status="s">
      <a href="${pageContext.request.contextPath}/product_findByCsid?csid=<s:property value="#cs.csid" />&page=1"><s:property value="#cs.csname" /><span><s:property value="#s.getIndex()" /></span></a>
      </s:iterator> 
</div>	
<div class="wrap">
	<div class="main">
	<!-- start gallery_sale  -->
			<div class="gallery1">
			<div class="container">
			<div id="portfolio">
			<s:iterator value="pageBean.list" var="p" >
			<div class="portfolio logo1" data-cat="logo">
				<div class="portfolio-wrapper">	
					<div>			
					<a  href="${pageContext.request.contextPath }/product_findByPid?pid=<s:property value="#p.pid" />">
						<img src="${pageContext.request.contextPath }/<s:property value="#p.image" />"  alt="Image 2" />
					</a>
					</div>
					<div class="label">
						<div class="label-text">
							<a class="text-title" href="${pageContext.request.contextPath }/product_findByPid?pid=<s:property value="#p.pid" />"><s:property value="#p.pname" /></a>
							
						</div>
						<div class="label-bg"></div>
					</div>
				</div>
				 <div class="product-carousel-price">
                  	<ins>￥<s:property value="#p.shop_price" />元</ins> <del>￥<s:property value="#p.market_price" />元</del>
                </div>
			</div>	
			</s:iterator>
		</div>
	</div><!-- container -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/fliplightbox.min.js"></script>
	<script type="text/javascript">$('body').flipLightBox()</script>
	<div class="clear"> </div>
	</div>
<!---End-gallery----->
	</div>
</div>
</div>	
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
                              <a href="${pageContext.request.contextPath}/product_findByCid.action?cid=<s:property value="cid" />&page=1" aria-label="first">
                                <span aria-hidden="true">&laquo;</span>
                              </a>
                            </li>
                            <s:if test="pageBean.page>1">
                            <li>
                              <a href="${pageContext.request.contextPath}/product_findByCid.action?cid=<s:property value="cid" />&page=<s:property value="pageBean.page-1" />" aria-label="Previous">
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
	                           	 <li><a href="${pageContext.request.contextPath}/product_findByCid.action?cid=<s:property value="cid" />&page=<s:property value="pageBean.page-2" />"><s:property value="pageBean.page-2" /></a></li>
	                           	 <li><a href="${pageContext.request.contextPath}/product_findByCid.action?cid=<s:property value="cid" />&page=<s:property value="pageBean.page-1" />"><s:property value="pageBean.page-1" /></a></li>
	                           	 <li class="active"><a href="${pageContext.request.contextPath}/product_findByCid.action?cid=<s:property value="cid" />&page=<s:property value="pageBean.page" />" ><s:property value="pageBean.page" /></a></li>
	                           	 <s:if test="pageBean.page < pageBean.totalPage-1">
	                           	 <li><a href="${pageContext.request.contextPath}/product_findByCid.action?cid=<s:property value="cid" />&page=<s:property value="pageBean.page+1" />"><s:property value="pageBean.page+1" /></a></li>
	                           	 <li><a href="${pageContext.request.contextPath}/product_findByCid.action?cid=<s:property value="cid" />&page=<s:property value="pageBean.page+2" />"><s:property value="pageBean.page+2" /></a></li>
	                           	 </s:if>
                           	 	</s:if>
                           	 	<s:if test="pageBean.page==1 " >
                           	 	 <li class="active"><a href="#" ><s:property value="pageBean.page" /></a></li>
	                           	 <li><a href="${pageContext.request.contextPath}/product_findByCid.action?cid=<s:property value="cid" />&page=<s:property value="pageBean.page+1" />"><s:property value="pageBean.page+1" /></a></li>
	                           	 <li><a href="${pageContext.request.contextPath}/product_findByCid.action?cid=<s:property value="cid" />&page=<s:property value="pageBean.page+2" />"><s:property value="pageBean.page+2" /></a></li>
	                           	 <li><a href="${pageContext.request.contextPath}/product_findByCid.action?cid=<s:property value="cid" />&page=<s:property value="pageBean.page+3" />"><s:property value="pageBean.page+3" /></a></li>
	                           	 <li><a href="${pageContext.request.contextPath}/product_findByCid.action?cid=<s:property value="cid" />&page=<s:property value="pageBean.page+4" />"><s:property value="pageBean.page+4" /></a></li>
                           	 	</s:if>
                           	 	<s:if test="pageBean.page==2" >
                           	 	 <li><a href="${pageContext.request.contextPath}/product_findByCid.action?cid=<s:property value="cid" />&page=<s:property value="pageBean.page-1" />"><s:property value="pageBean.page-1" /></a></li>
                           	 	 <li class="active"><a href="${pageContext.request.contextPath}/product_findByCid.action?cid=<s:property value="cid" />&page=<s:property value="pageBean.page" />" ><s:property value="pageBean.page" /></a></li>
                           	 	 <li><a href="${pageContext.request.contextPath}/product_findByCid.action?cid=<s:property value="cid" />&page=<s:property value="pageBean.page+1" />"><s:property value="pageBean.page+1" /></a></li>
                           	 	 <li><a href="${pageContext.request.contextPath}/product_findByCid.action?cid=<s:property value="cid" />&page=<s:property value="pageBean.page+2" />"><s:property value="pageBean.page+2" /></a></li>
                           	 	 <li><a href="${pageContext.request.contextPath}/product_findByCid.action?cid=<s:property value="cid" />&page=<s:property value="pageBean.page+3" />"><s:property value="pageBean.page+3" /></a></li>
                           	 	</s:if>
                              </s:if>
                             
                              	<!-- totalPage小于5 -->
                              <s:if test="pageBean.totalPage == 4">
                              		<li class="active"><a href="${pageContext.request.contextPath}/product_findByCid.action?cid=<s:property value="cid" />&page=<s:property value="pageBean.page" />" ><s:property value="pageBean.page" /></a></li>
                              	</s:if>
                              	<s:if test="pageBean.totalPage == 3">
	                           		 <li class="active"><a href="${pageContext.request.contextPath}/product_findByCid.action?cid=<s:property value="cid" />&page=<s:property value="pageBean.page" />" ><s:property value="pageBean.page" /></a></li>
                              	</s:if>
                              	<s:if test="pageBean.totalPage == 2">
	                           		 <li class="active"><a href="${pageContext.request.contextPath}/product_findByCid.action?cid=<s:property value="cid" />&page=<s:property value="pageBean.page" />" ><s:property value="pageBean.page" /></a></li>
                              	</s:if>
                              	<s:if test="pageBean.totalPage == 1">
	                           		 <li class="active"><a href="${pageContext.request.contextPath}/product_findByCid.action?cid=<s:property value="cid" />&page=<s:property value="pageBean.page" />" ><s:property value="pageBean.page" /></a></li>
                              	</s:if>
                              
                           
                            
                            <s:if test="pageBean.page<pageBean.totalPage">
                            <li>
                              <a href="${pageContext.request.contextPath}/product_findByCid.action?cid=<s:property value="cid" />&page=<s:property value="pageBean.page+1" />" aria-label="Next">
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
                              <a href="${pageContext.request.contextPath}/product_findByCid.action?cid=<s:property value="cid" />&page=<s:property value="pageBean.totalPage" />" aria-label="last">
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
 <script type="text/javascript">
	var btb=$(".l_nav");
	var tempS;
	$(".l_nav").hover(function(){
		var thisObj = $(this);
		tempS = setTimeout(function(){
			thisObj.find("a").each(function(i){
				var tA=$(this);
				setTimeout(function(){
					tA.animate({left:"0"},300);
				},50*i);
			});
		},200);
	},
	function(){
		if(tempS){
			clearTimeout(tempS);
		}
		$(this).find("a").each(function(i){
			var tA=$(this);
			setTimeout(function(){
				tA.animate({left:"-100"},300,function(){
				});
			},50*i);
		});
	});
</script>
<%@include file="bottom.jsp" %>
    <!-- End footer bottom area -->


    
<%--     <!-- Bootstrap JS form CDN -->
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    --%> 
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