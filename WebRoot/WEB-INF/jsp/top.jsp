<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
     <div class="header-area">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="user-menu">
                        <ul>
                     		<s:if test="#session.exitsUser != null">
                            <li><a href="${pageContext.request.contextPath}/user_myqtao.action"><i class="glyphicon glyphicon-home"></i> &nbsp;&nbsp;我的Q淘</a></li>
                            <li><a href="${pageContext.request.contextPath}/favorites_MyFavorites.action"><i class="fa fa-heart"></i> 收藏夹</a></li>
                            <li><a href="${pageContext.request.contextPath}/cartt_myCart.action"><i class="glyphicon glyphicon-shopping-cart"></i>&nbsp;&nbsp;购物车</a></li>
                            <li><a href="${pageContext.request.contextPath}/order_findAll.action?page=1"><i class="fa fa-user"></i> 我的订单</a></li>
                           	<li><a href="${pageContext.request.contextPath}/user_quit.action"><i class="glyphicon glyphicon-log-out"></i> &nbsp;&nbsp;退出</a></li>
                     		</s:if>
                            <s:else>
                            <li><a href="${pageContext.request.contextPath}/user_loginPage.action"><i class="glyphicon glyphicon-log-in"></i> &nbsp;&nbsp;登陆</a></li>
                            <li><a href="${pageContext.request.contextPath}/usert_registPage.action"><i class="fa fa-user"></i> 注册</a></li>
                            </s:else>
                        </ul>
                    </div>
                </div>
                
                <div class="col-md-6">
                    <div class="header-right">
                        <ul class="list-unstyled list-inline">
                           	<li><a href="${pageContext.request.contextPath}/index_guidance"><i class="glyphicon glyphicon-leaf"></i> &nbsp;&nbsp;购物指南</a></li>
                            <li class="dropdown dropdown-small">
                                <a data-toggle="dropdown" data-hover="dropdown" class="dropdown-toggle" href="#"><span class="glyphicon glyphicon-info-sign"> </span><i >&nbsp;&nbsp;更多服务</i><span class="value"></span><b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="${pageContext.request.contextPath}/index_returnGood">退货政策</a></li>
                                    <li><a href="${pageContext.request.contextPath}/index_advice">意见建议</a></li>
                                    <li><a href="${pageContext.request.contextPath}/index_aboutus">关于我们</a></li>
                                </ul>
                            </li>
                            <li><a ><i class="glyphicon glyphicon-phone-alt"></i> &nbsp;&nbsp;客服电话：020-81556328</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End header area -->
    <!-- start header -->
<div class="header_bg">
<div class="wrap">
	<div class="header">
		<div class="logo">
			<a href="${pageContext.request.contextPath }/index.action"><img src="${pageContext.request.contextPath}/img/logo.png" alt=""/> </a>
		</div>
		<s:if test="#session.exitsUser != null">
		<div class="h_icon">
		<ul class="icon1 sub-icon1">
			<li>
				<a class="active-icon c1" href="${pageContext.request.contextPath}/portrait_myportrait.action"><img src="${pageContext.request.contextPath}/<s:property value="#session.exitsUser.portrait" />" alt="头像" />
				
				</a>
				<ul class="sub-icon1 list">
					<li><p> <a href="${pageContext.request.contextPath}/user_MyLogistical.action">我的物流</a> </p></li>
					<li><p> <a href="${pageContext.request.contextPath}/address_myAddr.action ">收货地址</a> </p></li>
				</ul>
			</li>
			<li style="padding: 10px 0;">
				<i ><s:property value="#session.exitsUser.nickname"/></i>
			</li>
		</ul>
		</div>
		</s:if>
		<div class="h_search">
    		<form action="${pageContext.request.contextPath }/product_SearchKeyWord.action" method="get">
    			<input type="hidden" name="page" value="1" >
    			<input type="text" name="keyWord" value="宝贝" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = '宝贝';}">
    			<input type="submit" value="">
    		</form>
		</div>
		<div class="clear"></div>
	</div>
</div>
</div>
<div class="header_btm">
<div class="wrap">
	<div class="header_sub">
		<div class="h_menu">
			<ul>
				<li class="active">
					<a  href="${pageContext.request.contextPath}/index.action">首页</a>
				</li> |
				<s:iterator var="c" value="#session.cList">
				<li><a href="${pageContext.request.contextPath}/product_findByCid.action?cid=<s:property value="#c.cid" />&page=1"><s:property value="#c.cname"/></a></li> |
				</s:iterator>
				<li class="dropdown">
				<a href="#" data-toggle="dropdown" data-hover="dropdown" class="dropdown-toggle" id="dropdownMenu1">更多<b class="caret"></b></a>
				<div class="moremenu dropdown-menu" aria-labelledby="dropdownMenu1">
				<ul>
					<s:iterator value="#session.clistMore" var="cm">
                     <li><a href="${pageContext.request.contextPath}/product_findByCid.action?cid=<s:property value="#cm.cid" />&page=1" ><s:property value="#cm.cname"/></a></li>
                    </s:iterator>
                 </ul>
                 </div>
				</li>
			</ul>
		</div>
		
		<div class="top-nav">
	          <nav class="nav">	        	
	    	    <a href="#" id="w3-menu-trigger"> </a>
	                  <ul class="nav-list" style="">
	            	        <li class="nav-item"><a class="active" href="${pageContext.request.contextPath}/index.action">首页</a></li>
							<s:iterator var="c" value="#session.cList">
							<li class="nav-item"><a href="${pageContext.request.contextPath}/product_findByCid.action?cid=<s:property value="#c.cid" />&page=1"><s:property value="#c.cname"/></a></li>
							</s:iterator>
							<li class="nav-item"><a href="${pageContext.request.contextPath}/index_more">更多</a></li>
	                 </ul>
	           </nav>
	             <div class="search_box">
				<form action="${pageContext.request.contextPath }/product_SearchKeyWord.action" method="get">
				  	<input type="hidden" name="page" value="1" >
				   <input type="text" name="keyWord" value="宝贝" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = '宝贝';}"><input type="submit" value="">
			    </form>
			</div>
	          <div class="clear"> </div>
	          <script src="${pageContext.request.contextPath}/js/responsive.menu.js"></script>
         </div>		  
	<div class="clear"></div>
</div>
</div>
</div>