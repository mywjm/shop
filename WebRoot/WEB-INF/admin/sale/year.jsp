<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
  <head>
    <title>年度销售表</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8" />

    <link rel="icon" type="image/ico" href="http://tattek.com/minimal/assets/images/favicon.ico" />
    <!-- Bootstrap -->
    <link href="assets/css/vendor/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/vendor/animate/animate.css">
    <link type="text/css" rel="stylesheet" media="all" href="assets/js/vendor/mmenu/css/jquery.mmenu.all.css" />
    <link rel="stylesheet" href="assets/js/vendor/videobackground/css/jquery.videobackground.css">
    <link rel="stylesheet" href="assets/css/vendor/bootstrap-checkbox.css">

    <link rel="stylesheet" href="assets/js/vendor/rickshaw/css/rickshaw.min.css">
    <link rel="stylesheet" href="assets/js/vendor/morris/css/morris.css">

    <link href="assets/css/minimal.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript" >
    	function search() {
			document.getElementById("searchproduct").submit();    	
    	
    	}
    </script>
  </head>
  <body class="bg-1">


 



    <!-- Preloader -->
    <div class="mask"><div id="loader"></div></div>
    <!--/Preloader -->

    <!-- Wrap all page content here -->
    <div id="wrap">

      


      <!-- Make page fluid -->
      <div class="row">
        
	<!-- 左侧和顶端 -->
	 <!-- Fixed navbar -->
        <div class="navbar navbar-default navbar-fixed-top navbar-transparent-black mm-fixed-top" role="navigation" id="navbar">
          
          <!-- Branding -->
          <div class="navbar-header col-md-2">
            <a class="navbar-brand" href="${pageContext.request.contextPath }/admin_index.action">
              <strong>Q</strong>淘
            </a>
            <div class="sidebar-collapse">
              <a href="#">
                <i class="fa fa-bars"></i>
              </a>
            </div>
          </div>
          <!-- Branding end -->



          <!-- .nav-collapse -->
          <div class="navbar-collapse">
                        
            <!-- Page refresh -->
            <ul class="nav navbar-nav refresh">
              <li class="divided">
                <a href="#" class="page-refresh"><i class="fa fa-refresh"></i></a>
              </li>
            </ul>
            <!-- /Page refresh -->

            <!-- Search -->
            <div class="search" id="main-search">
            	<form action="${pageContext.request.contextPath }/AdminProduct_SearchWord.action" method="post" id="searchproduct">
				<input type="text" name="keyWord" placeholder="Search...">
				<i class="fa fa-search" onclick="search()" style="cursor: pointer"></i> 
          		</form>
            </div>
            <!-- Search end -->

            <!-- Quick Actions -->
            <ul class="nav navbar-nav quick-actions">
              
              <li class="dropdown divided">
                <s:if test="#session.existAdminUser == null">
                 <a href="${pageContext.request.contextPath }/admin_loginPage.action"><font color="black">登陆</font></a>
                 </s:if>
                <a class="dropdown-toggle button" data-toggle="dropdown" href="#">
                  <i class="fa fa-tasks"></i>
                  <span class="label label-transparent-black">1</span>
                </a>

                <ul class="dropdown-menu wide arrow nopadding bordered">
                  <li><h1> 本季度<strong> </strong>销售进度 </h1></li>
                  <li>
                    <a href="#">
                      <div class="task-info">
                        <div class="desc">女装</div>
                        <div class="percent">80%</div>
                      </div>
                      <div class="progress progress-striped progress-thin">
                        <div class="progress-bar progress-bar-green" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                          <span class="sr-only">40% Complete (success)</span>
                        </div>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <div class="task-info">
                        <div class="desc">男鞋</div>
                        <div class="percent">15%</div>
                      </div>
                      <div class="progress progress-striped active progress-thin">
                        <div class="progress-bar progress-bar-cyan" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 15%">
                          <span class="sr-only">45% Complete</span>
                        </div>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <div class="task-info">
                        <div class="desc">生鲜</div>
                        <div class="percent">5%</div>
                      </div>
                      <div class="progress progress-striped progress-thin">
                        <div class="progress-bar progress-bar-orange" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 5%">
                          <span class="sr-only">5% Complete (warning)</span>
                        </div>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <div class="task-info">
                        <div class="desc">女包</div>
                        <div class="percent">30%</div>
                      </div>
                      <div class="progress progress-striped progress-thin">
                        <div class="progress-bar progress-bar-red" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 30%">
                          <span class="sr-only">30% Complete (danger)</span>
                        </div>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <div class="task-info">
                        <div class="desc">手机</div>
                        <div class="percent">60%</div>
                      </div>
                      <div class="progress progress-striped progress-thin">
                        <div class="progress-bar progress-bar-amethyst" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                          <span class="sr-only">60% Complete</span>
                        </div>
                      </div>
                    </a>
                  </li>
                  <li><a href="#">展开所有 <i class="fa fa-angle-right"></i></a></li>
                </ul>

              </li>

              <li class="dropdown divided">
                
                <a class="dropdown-toggle button" data-toggle="dropdown" href="#">
                  <i class="fa fa-envelope"></i>
                  <span class="label label-transparent-black">2</span>
                </a>

                <ul class="dropdown-menu wider arrow nopadding messages">
                  <li><h1>您有 <strong>1</strong> 条新的消息</h1></li>
                  <li>
                    <a class="cyan" href="#">
                      <div class="profile-photo">
                        <img src="assets/images/ici-avatar.jpg" alt="" />
                      </div>
                      <div class="message-info">
                        <span class="sender">李明</span>
                        <span class="time">12 mins</span>
                        <div class="message-content">请问还有货吗？我想买一双鞋，是35码的粉色哦</div>
                      </div>
                    </a>
                  </li>

                  <li>
                    <a class="green" href="#">
                      <div class="profile-photo">
                        <img src="assets/images/arnold-avatar.jpg" alt="" />
                      </div>
                      <div class="message-info">
                        <span class="sender">范和</span>
                        <span class="time">1 hour</span>
                        <div class="message-content">我想问一下打折吗？</div>
                      </div>
                    </a>
                  </li>

                  <li>
                    <a href="#">
                      <div class="profile-photo">
                        <img src="assets/images/profile-photo.jpg" alt="" />
                      </div>
                      <div class="message-info">
                        <span class="sender">诸葛正我</span>
                        <span class="time">3 hours</span>
                        <div class="message-content">急需购买一批电脑主机，请尽快发货吧！</div>
                      </div>
                    </a>
                  </li>

                  <li>
                    <a class="red" href="#">
                      <div class="profile-photo">
                        <img src="assets/images/peter-avatar.jpg" alt ="" />
                      </div>
                      <div class="message-info">
                        <span class="sender">孙林</span>
                        <span class="time">5 hours</span>
                        <div class="message-content">请问我的订单为什么还没发货呢？已经下单几天咯，请尽快发货吧~！谢谢</div>
                      </div>
                    </a>
                  </li>

                  <li>
                    <a class="orange" href="#">
                      <div class="profile-photo">
                        <img src="assets/images/george-avatar.jpg" alt="" />
                      </div>
                      <div class="message-info">
                        <span class="sender">陈旺</span>
                        <span class="time">6 hours</span>
                        <div class="message-content">店家，我的货物已经退还，请尽快回复</div>
                      </div>
                    </a>
                  </li>


                  <li class="topborder"><a href="#">展开所有消息 <i class="fa fa-angle-right"></i></a></li>
                </ul>

              </li>

              <li class="dropdown divided">
                
                <a class="dropdown-toggle button" data-toggle="dropdown" href="#">
                  <i class="fa fa-bell"></i>
                  <span class="label label-transparent-black">3</span>
                </a>

                <ul class="dropdown-menu wide arrow nopadding bordered">
                  <li><h1>您有 <strong>3</strong> 条未读日志</h1></li>
                  
                  <li>
                    <a href="#">
                      <span class="label label-green"><i class="fa fa-user"></i></span>
                 		一个新用户注册了
                      <span class="small">18 mins</span>
                    </a>
                  </li>

                  <li>
                    <a href="#">
                      <span class="label label-red"><i class="fa fa-power-off"></i></span>
                     	服务器宕机
                      <span class="small">27 mins</span>
                    </a>
                  </li>

                  <li>
                    <a href="#">
                      <span class="label label-orange"><i class="fa fa-plus"></i></span>
                     	有一个新的订单
                      <span class="small">36 mins</span>
                    </a>
                  </li>

                  <li>
                    <a href="#">
                      <span class="label label-cyan"><i class="fa fa-power-off"></i></span>
                      	服务器重启
                      <span class="small">45 mins</span>
                    </a>
                  </li>

                  <li>
                    <a href="#">
                      <span class="label label-amethyst"><i class="fa fa-power-off"></i></span>
                     	 服务器正常运行
                      <span class="small">50 mins</span>
                    </a>
                  </li>

                   <li><a href="#">展开所有日志 <i class="fa fa-angle-right"></i></a></li>
                </ul>

              </li>

              <li class="dropdown divided user" id="current-user">
                <s:if test="#session.existAdminUser != null">
				<div class="profile-photo">
				<img src="assets/images/profile-photo.jpg" alt="" />
				</div>
				<a class="dropdown-toggle options" data-toggle="dropdown" href="#">
				<s:property value="#session.existAdminUser.username" /> <i class="fa fa-caret-down"></i>
				</a>
				</s:if>
                
                <ul class="dropdown-menu arrow settings">

                  <li>
                    
                    <h3>皮肤:</h3>
                    <ul id="color-schemes">
                      <li><a href="#" class="bg-1"></a></li>
                      <li><a href="#" class="bg-2"></a></li>
                      <li><a href="#" class="bg-3"></a></li>
                      <li><a href="#" class="bg-4"></a></li>
                      <li><a href="#" class="bg-5"></a></li>
                      <li><a href="#" class="bg-6"></a></li>
                    </ul>

<%--                     <div class="form-group videobg-check">
                      <label class="col-xs-8 control-label">是否打开背景</label>
                      <div class="col-xs-4 control-label">
                        <div class="onoffswitch greensea small">
                          <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="videobg-check">
                          <label class="onoffswitch-label" for="videobg-check">
                            <span class="onoffswitch-inner"></span>
                            <span class="onoffswitch-switch"></span>
                          </label>
                        </div>
                      </div>
                    </div> --%>

                  </li>

<%--                   <li class="divider"></li>

                  <li>
                    <a href="#"><i class="fa fa-user"></i> Profile</a>
                  </li>

                  <li>
                    <a href="#"><i class="fa fa-calendar"></i> Calendar</a>
                  </li>

                  <li>
                    <a href="#"><i class="fa fa-envelope"></i> Inbox <span class="badge badge-red" id="user-inbox">3</span></a>
                  </li> --%>

                  <li class="divider"></li>

                  <li>
                    <a href="${pageContext.request.contextPath }/admin_quit.action"><i class="fa fa-power-off"></i> 退出</a>
                  </li>
                </ul>
              </li>

              <li>
                <a href="#mmenu"><i class="fa fa-comments"></i></a>
              </li>
            </ul>
            <!-- /Quick Actions -->



            <!-- Sidebar -->
            <ul class="nav navbar-nav side-nav" id="sidebar">
              
              <li class="collapsed-content"> 
                <ul>
                  <li class="search"><!-- Collapsed search pasting here at 768px --></li>
                </ul>
              </li>

              <li class="navigation" id="navigation">
                <a href="${pageContext.request.contextPath }/admin_index.action" class="sidebar-toggle" data-toggle="#navigation">管理面板 <i class="fa fa-angle-up"></i></a>
                
                <ul class="menu">
                  
                  <li class="active">
                    <a href="${pageContext.request.contextPath }/admin_index.action">
                      <i class="fa fa-tachometer"></i> 主页
                      <span class="label label-greensea">main</span>
                     
                    </a>
                  </li>

                  <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                      <i class="fa fa-list"></i> 用户管理 <b class="fa fa-plus dropdown-plus"></b>
                    </a>
                    <ul class="dropdown-menu">
                      <li>
                        <a href="${pageContext.request.contextPath }/adminUser_findAll.action?page=1">
                          <i class="fa fa-caret-right"></i> 所有用户
                        </a>
                      </li>
              
                      <li>
                        <a href="${pageContext.request.contextPath }/adminUser_todefriend.action?page=1">
                          <i class="fa fa-caret-right"></i> 被拉黑的用户
                        </a>
                      </li>
                    </ul>
                  </li>

                  <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                      <i class="fa fa-pencil"></i> 管理员管理 <b class="fa fa-plus dropdown-plus"></b>
                    </a>
                    <ul class="dropdown-menu">
                      <li>
                        <a href="${pageContext.request.contextPath }/admin_findAdmins.action?page=1">
                          <i class="fa fa-caret-right"></i> 所有管理员
                        </a>
                      </li>
                      <li>
                        <a href="${pageContext.request.contextPath }/admin_toAdd.action">
                          <i class="fa fa-caret-right"></i> 添加管理员
                        </a>
                      </li>
                
                    </ul>
                  </li>

<!--                   <li>
                    <a href="buttons.html">
                      <i class="fa fa-tint"></i> Buttons & Icons
                    </a>
                  </li>
                  <li>
                    <a href="grid.html">
                      <i class="fa fa-th"></i> Grid Layout
                    </a>
                  </li> -->

                  <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                      <i class="fa fa-th-large"></i> 一级菜单管理 <b class="fa fa-plus dropdown-plus"></b>
                    </a>
                    <ul class="dropdown-menu">
                      <li>
                        <a href="${pageContext.request.contextPath }/AdminCategory_findAll.action">
                          <i class="fa fa-caret-right"></i> 所有一级菜单
                        </a>
                      </li>
                      <li>
                        <a href="${pageContext.request.contextPath }/AdminCategory_toadd.action">
                          <i class="fa fa-caret-right"></i> 添加一级菜单
                        </a>
                      </li>
             
                    </ul>
                  </li>

                  <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                      <i class="fa fa-desktop"></i> 二级菜单管理 <b class="fa fa-plus dropdown-plus"></b>
                    </a>
                    <ul class="dropdown-menu">
                      <li>
                        <a href="${pageContext.request.contextPath }/AdminCS_findAll.action">
                          <i class="fa fa-caret-right"></i> 所有二级菜单
                        </a>
                      </li>
                      <li>
                        <a href="${pageContext.request.contextPath }/AdminCS_toAdd.action">
                          <i class="fa fa-caret-right"></i> 添加二级菜单
                        </a>
                      </li>

                </ul>

              </li>
			   <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                      <i class="fa fa-tint"></i> 三级菜单管理 <b class="fa fa-plus dropdown-plus"></b>
                      <span class="label label-greensea"></span>
                    </a>
                    <ul class="dropdown-menu">
                      <li>
                        <a href="${pageContext.request.contextPath }/AdminCT_findAll.action">
                          <i class="fa fa-caret-right"></i> 所有三级菜单
                        </a>
                      </li>
                      <li>
                        <a href="${pageContext.request.contextPath }/AdminCT_toAdd.action">
                          <i class="fa fa-caret-right"></i> 添加三级菜单
                        </a>
                      </li>

                </ul>

              </li>
              
            	<li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <i class="fa fa-th"></i> 商品管理 <b class="fa fa-plus dropdown-plus"></b>
                    <span class="label label-greensea"></span>
                  </a>
                  <ul class="dropdown-menu">
                    <li>
                      <a href="${pageContext.request.contextPath }/AdminProduct_findAll.action">
                        <i class="fa fa-caret-right"></i> 所有商品
                      </a>
                    </li>
                    <li>
                      <a href="${pageContext.request.contextPath }/AdminProduct_toadd.action">
                        <i class="fa fa-caret-right"></i> 添加商品
                      </a>
                    </li>

                </ul>

              </li>
              
                  <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <i class="fa fa-bar-chart-o"></i> 订单管理 <b class="fa fa-plus dropdown-plus"></b>
                    <span class="label label-greensea"></span>
                  </a>
                  <ul class="dropdown-menu">
                    <li>
                      <a href="${pageContext.request.contextPath }/AdminOrder_findAll.action">
                        <i class="fa fa-caret-right"></i> 所有订单
                      </a>
                    </li>
                    <li>
                      <a href="${pageContext.request.contextPath }/AdminOrder_findByState.action?state=1">
                        <i class="fa fa-caret-right"></i> 未付款订单
                      </a>
                    </li>
                    <li>
                      <a href="${pageContext.request.contextPath }/AdminOrder_findByState.action?state=2">
                        <i class="fa fa-caret-right"></i> 已付款订单
                      </a>
                    </li>
                    <li>
                      <a href="${pageContext.request.contextPath }/AdminOrder_findByState.action?state=3">
                        <i class="fa fa-caret-right"></i> 已发货订单
                      </a>
                    </li>
                    <li>
                      <a href="${pageContext.request.contextPath }/AdminOrder_findByState.action?state=4">
                        <i class="fa fa-caret-right"></i> 已完成订单
                      </a>
                    </li>

                </ul>

              </li>
              
               <li class="dropdown open">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <i class="fa fa-play-circle"></i> 报表管理 <b class="fa fa-plus dropdown-plus"></b>
                    <span class="label label-greensea"></span>
                  </a>
                  <ul class="dropdown-menu">
                    <li>
                      <a href="${pageContext.request.contextPath }/AdminOrder_findmonth.action">
                        <i class="fa fa-caret-right"></i> 月度销售表
                      </a>
                    </li>
                    <li>
                      <a href="${pageContext.request.contextPath }/AdminOrder_findquater.action">
                        <i class="fa fa-caret-right"></i> 季度销售表
                      </a>
                    </li>
                    <li class="active">
                      <a href="${pageContext.request.contextPath }/AdminOrder_findyear.action">
                        <i class="fa fa-caret-right"></i> 年度销售表
                      </a>
                    </li>

                </ul>

              </li>
			 </ul>

              </li>
              <li class="summary" id="order-summary">
                <a href="#" class="sidebar-toggle underline" data-toggle="#order-summary">订单汇总 <i class="fa fa-angle-up"></i></a>

                <div class="media">
                  <a class="pull-right" href="#">
                    <span id="sales-chart"></span>
                  </a>
                  <div class="media-body">
                   	本周总销售额
                    <h3 class="media-heading">26, 149</h3>
                  </div>
                </div>

                <div class="media">
                  <a class="pull-right" href="#">
                    <span id="balance-chart"></span>
                  </a>
                  <div class="media-body">
                    	上月总销售额
                    <h3 class="media-heading">318, 651</h3>
                  </div>
                </div>

              </li>

              <li class="settings" id="general-settings">
                <a href="#" class="sidebar-toggle underline" data-toggle="#general-settings">全局设置 <i class="fa fa-angle-up"></i></a>

                <div class="form-group">
                  <label class="col-xs-8 control-label">开关</label>
                  <div class="col-xs-4 control-label">
                    <div class="onoffswitch greensea">
                      <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="switch-on" checked="">
                      <label class="onoffswitch-label" for="switch-on">
                        <span class="onoffswitch-inner"></span>
                        <span class="onoffswitch-switch"></span>
                      </label>
                    </div>
                  </div>
                </div>

                <div class="form-group">
                  <label class="col-xs-8 control-label">开关</label>
                  <div class="col-xs-4 control-label">
                    <div class="onoffswitch greensea">
                      <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="switch-off">
                      <label class="onoffswitch-label" for="switch-off">
                        <span class="onoffswitch-inner"></span>
                        <span class="onoffswitch-switch"></span>
                      </label>
                    </div>
                  </div>
                </div>

              </li>

              
            </ul>
            <!-- Sidebar end -->





          </div>
          <!--/.nav-collapse -->





        </div>
        <!-- Fixed navbar end -->
        




        
        <!-- Page content -->
        <div id="content" class="col-md-12">
          








          <!-- page header -->
          <div class="pageheader">
            

            <h2><i class="fa fa-bar-chart-o" style="line-height: 48px;padding-left: 0;"></i> 报表管理
             <span><s:actionmessage/></span></h2>
            

            <div class="breadcrumbs">
              <ol class="breadcrumb">
                <li>Q淘后台</li>
                <li><a href="${pageContext.request.contextPath }/admin_index.action">管理面板</a></li>
                <li class="active">年度销售表</li>
              </ol>
            </div>

          </div>
          <!-- /page header -->
          
          




          <!-- content main container -->
          <div class="main">




            <!-- row -->
            <div class="row">

              <!-- col 12 -->
              <div class="col-md-12">



                <!-- tile -->
                <section class="tile">



                  <!-- tile header -->
                  <div class="tile-header">
                    <h1><strong></strong> </h1>
                    <div class="controls">
                      <a href="#" class="refresh"><i class="fa fa-refresh"></i></a>
                      <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                  </div>
                  <!-- /tile header -->

                  <!-- tile body -->
                  <div class="tile-body">
                    
                    <div class="row">
                      
                      <div class="col-md-12">
                        
                        <h5><strong>年度</strong> 总销售表(万元)</h5>
                        <div id="line-example" style="height: 250px;"></div>

                      </div>

                      <div class="col-md-12">
                        
                        <h5><strong> 年度</strong> 平均销售表(万元)</h5>
                        <div id="line-area-example" style="height: 250px;"></div>
                        

                      </div>

                      
                    </div>

                  </div>
                  <!-- /tile body -->
                  
                


                </section>
                <!-- /tile -->



               
              
          </div>
        </div>



		</div>
		</div>
		
		<!-- 最右侧好友列表 -->
		<%@include file="../below.jsp" %>


      </div>
      <!-- Make page fluid-->




    </div>
    <!-- Wrap all page content end -->



    <section class="videocontent" id="video"></section>



    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="assets/js/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="assets/js/vendor/bootstrap/bootstrap.min.js"></script>
    <script type="text/javascript" src="assets/js/vendor/mmenu/js/jquery.mmenu.min.js"></script>
    <script type="text/javascript" src="assets/js/vendor/sparkline/jquery.sparkline.min.js"></script>
    <script type="text/javascript" src="assets/js/vendor/nicescroll/jquery.nicescroll.min.js"></script>
    <script type="text/javascript" src="assets/js/vendor/animate-numbers/jquery.animateNumbers.js"></script>
    <script type="text/javascript" src="assets/js/vendor/videobackground/jquery.videobackground.js"></script>
    <script type="text/javascript" src="assets/js/vendor/blockui/jquery.blockUI.js"></script>

    <script src="assets/js/vendor/flot/jquery.flot.min.js"></script>
    <script src="assets/js/vendor/flot/jquery.flot.categories.min.js"></script>
    <script src="assets/js/vendor/flot/jquery.flot.pie.min.js"></script>
    <script src="assets/js/vendor/flot/jquery.flot.stack.min.js"></script>
    <script src="assets/js/vendor/graphtable/jquery.graphTable-0.3.js"></script>
    <script src="assets/js/vendor/flot/jquery.flot.tooltip.min.js"></script>

    <script src="assets/js/vendor/rickshaw/raphael-min.js"></script> 
    <script src="assets/js/vendor/rickshaw/d3.v2.js"></script>
    <script src="assets/js/vendor/rickshaw/rickshaw.min.js"></script>

    <script src="assets/js/vendor/morris/morris.min.js"></script>

    <script src="assets/js/vendor/easypiechart/jquery.easypiechart.min.js"></script>

    <script src="assets/js/vendor/justgage/justgage.js"></script>

    <script src="assets/js/minimal.min.js"></script>

    <script>
    $(function(){

      // Morris line chart

      Morris.Line({
        element: 'line-example',
        data: [
          { y: '2013', a: 24},
          { y: '2014', a: 14},
          { y: '2015', a: 21},
          { y: '2016', a: 22},
          { y: '2017', a: 13}
        ],
        xkey: 'y',
        ykeys: ['a'],
        labels: ['年度总销售额'],
        lineColors:['#16a085']
      });

      // Morris line area chart

      Morris.Area({
        element: 'line-area-example',
        data: [
          { y: '2013', a: 5 },
           { y: '2014', a: 3 },
          { y: '2015', a: 4 },
          { y: '2016', a: 8},
          { y: '2017', a: 2 }
        ],
        xkey: 'y',
        ykeys: ['a'],
        labels: ['年度平均销售额'],
        lineColors:['#a2d200'],
        lineWidth:'0',
        grid: false,
        fillOpacity:'0.5'
      });

      // Morris bar chart

      Morris.Bar({
        element: 'bar-example',
        data: [
          { y: '2009', a: 75,  b: 65 },
          { y: '2010', a: 50,  b: 40 },
          { y: '2011', a: 75,  b: 65 },
          { y: '2012', a: 100, b: 90 }
        ],
        xkey: 'y',
        ykeys: ['a', 'b'],
        labels: ['Series A', 'Series B'],
        barColors:['#ff4a43','#1693A5']
      });

      // Morris donut chart

      Morris.Donut({
        element: 'donut-example',
        data: [
          {label: "Download Sales", value: 12},
          {label: "In-Store Sales", value: 30},
          {label: "Mail-Order Sales", value: 20}
        ],
        colors: ['#00a3d8', '#2fbbe8', '#72cae7']
      });

      // Sparkline Line Chart
      $('#sparkline01').sparkline([15,16,18,17,16,18,25,26,23], {
        type: 'line', 
        width: '100%',
        height:'250px',
        fillColor: 'rgba(34, 190, 239, .3)',
        lineColor: 'rgba(34, 190, 239, .5)',
        lineWidth: 2,
        spotRadius: 5,
        valueSpots:[5,6,8,7,6,8,5,4,7],
        minSpotColor: '#eaf9fe',
        maxSpotColor: '#00a3d8',
        highlightSpotColor: '#00a3d8',
        highlightLineColor: '#bec6ca',
        normalRangeMin: 0
      });
      $('#sparkline01').sparkline([1,2,1,3,1,2,4,1,3], {
        type: 'line', 
        composite: true,
        width: '100%',
        height:'250px',
        fillColor: 'rgba(255, 74, 67, .6)',
        lineColor: 'rgba(255, 74, 67, .8)',
        lineWidth: 2,
        minSpotColor: '#ffeced',
        maxSpotColor: '#d90200',
        highlightSpotColor: '#d90200',
        highlightLineColor: '#bec6ca',
        spotRadius: 5,
        valueSpots:[2,3,4,3,1,2,4,1,3],
        normalRangeMin: 0
      }); 

      // Sparkline Bar Chart

      var $el = $('#sparkline02');

      var values = $el.data('values').split(',').map(parseFloat);
      var type = $el.data('type') || 'line' ;
      var height = $el.data('height') || 'auto';

      var parentWidth = $el.parent().width();
      var valueCount = values.length;
      var barSpacing = 5;

      var barWidth = Math.round((parentWidth - ( valueCount - 1 ) * barSpacing ) / valueCount);

      $el.sparkline(values, {
        width:'100%',
        type: type,
        height: height,
        barWidth: barWidth, 
        barSpacing: barSpacing,
        barColor: '#16a085',
        negBarColor: '#FF0066'
      });

      // Sparkline Pie Chart

      $('#sparkline03').sparkline([5,10,20,15 ], {
        type: 'pie',
        width: 'auto',
        height: '250px',
        sliceColors: ['#22beef','#a2d200','#ffc100','#ff4a43']
      });

      // Line Chart

      var bars = false;
      var lines = true;
      var pie = false;

      var initializeFlot = function(){
        
        var el = $('table.flot-chart');

        el.each(function(){
          var data = $(this).data();
          var colors = [];
          var gridColor = data.tickColor || 'rgba(0,0,0,.1)';

          $(this).find('thead th:not(:first)').each(function() {
            colors.push($(this).css('color'));
          });

          if(data.type){
            bars = data.type.indexOf('bars') != -1;
            lines = data.type.indexOf('lines') != -1;
            pie = data.type.indexOf('pie') != -1;
          }

          $(this).graphTable({
            series: 'columns',
            position: 'replace',
            colors: colors,
            width: data.width,
            height: data.height
          },
          {
            series: { 
              stack: data.stack,
              pie: {
                show: pie,
                innerRadius: data.innerRadius || 0,
                label:{ 
                  show: data.pieLabel=='show' ? true:false
                }
              },
              bars: {
                show: bars,
                barWidth: data.barWidth || 0.5,
                fill: data.fill || 1,
                align: 'center'
              },
              lines: { 
                show: lines,
                fill: 0.1,
                lineWidth: 3
              },
              shadowSize: 0,
              points: {
                radius: 4
              }
            },
            xaxis: {
              mode: 'categories',
              tickLength: 0,
              font :{
                lineHeight: 24,
                weight: '300',
                color: data.fontColor,
                size: 14
              } 
            },
            yaxis: { 
              tickColor: gridColor,
              tickFormatter: function number(x) {  var num; if (x >= 1000) { num=(x/1000)+'k'; }else{ num=x; } return num; },
              max: data.yMax,
              font :{
                lineHeight: 13,
                weight: '300',
                color: data.fontColor
              }
            },  
            grid: { 
              borderWidth: {
                top: 0,
                right: 0,
                bottom: 1,
                left: 1
              },
              borderColor: gridColor,
              margin: 13,
              minBorderMargin:0,              
              labelMargin:20,
              hoverable: true,
              clickable: true,
              mouseActiveRadius:6
            },
            legend: { show: data.legend=='show' ? true:false },
            tooltip: data.toolTip=='show' ? true:false,
            tooltipOpts: { content: (pie ? '%p.0%, %s':'<b>%s</b> :  %y') }
          });
        });

        // tooltips showing
        $('.flot-graph').bind("plothover", function (event, pos, item) {
          if (item) {
            var x = item.datapoint[0],
                y = item.datapoint[1];
            $("#flotTip").css({top: item.pageY-30});
          } else {
            $("#flotTip").hide();
          }
        });
        
      };   

      // Pie Chart custom labels

      $('.custom-labels').each(function () {
        var el= $(this);
        var data = el.data();
        var colors = [];
        var info = [];
        var item = '';

        $(data.targetFlot).find('thead th:not(:first)').each(function() {
          colors.push($(this).css('color'));
          info.push($(this).text());
        });

        for(var i=0;i<info.length;i++){
          item += '<li><span class="badge badge-outline" style="border-color:' + colors[i] + '"></span>' + info[i] + ' ' + '<small>' + $(data.targetFlot).find("tbody td").eq(i).text() + '%' + '</small>' + '</li>';
        }

        el.append('<ul class="nolisttypes chart-legend">'+item+'</ul>');
        
      }); 

      initializeFlot();

      // Combined flot chart 
      var d1 = [['JAN', 150], ['FEB', 181], ['Mar', 252], ['APR', 356],['MAY', 851], ['JUN', 1589], ['JUL', 951], ['AUG', 651],['SEP', 591], ['OCT', 382], ['NOV', 951], ['DEC', 741]];
      var d2 = [['JAN', 145], ['FEB', 178], ['Mar', 200], ['APR', 350],['MAY', 212], ['JUN', 486], ['JUL', 841], ['AUG', 546],['SEP', 571], ['OCT', 300], ['NOV', 854], ['DEC', 685]];
      $.plot('#combined-chart', [
      {
        label: 'Last Year',
        data: d1,
        bars: { 
          show: true, 
          barWidth:  0.5, 
          fill:  1, 
          align: 'center'  
        }
      },
      {
        label: 'This Year',
        data: d2,
        lines: { 
          show: true,
          lineWidth: 3
        }
      }],
      {
        colors: ['#418bca' ,'#22beef'],
        xaxis: { 
          mode: 'categories',
          tickLength: 0,
          font :{
            lineHeight: 24,
            weight: '300',
            color: 'rgba(255,255,255,.8)',
            size: 14
          } 
        },
        yaxis: { 
          tickColor: 'rgba(255,255,255,.2)' ,
          tickFormatter: function number(x) {  var num; if (x >= 1000) { num=(x/1000)+'k'; }else{ num=x; } return num; },
          font :{
            lineHeight: 13,
            weight: '300',
            color: 'rgba(255,255,255,.8)'
          }
        },  
        grid: { 
          borderWidth: {
            top: 0,
            right: 0, 
            bottom: 1, 
            left: 1
          },
          margin: 13,
          labelMargin:20,
          hoverable: true,
          clickable: true,
          mouseActiveRadius:6,
          color : 'rgba(255,255,255,.2)' 
        },
        legend: { show: true },
        tooltip: true
      });

      $("#combined-chart div.legend >div").css("background", "transparent");
      $("#combined-chart div.legend table").css("color", "rgba(255,255,255,.8)");

      // tooltips showing
      $('#combined-chart').bind("plothover", function (event, pos, item) {
        if (item) {
          var x = item.datapoint[0],
              y = item.datapoint[1];
          $("#flotTip").css({top: item.pageY-30});
        } else {
          $("#flotTip").hide();
        }
      });

      // Real-Time flot chart
      var realTimeData = [];
      var totalPoints = 30;
      var updateInterval = 3000;

      function getData() {
        realTimeData.shift();

        while (realTimeData.length<totalPoints) {     
          var y = Math.random() * 100;
          var temp = [];
          realTimeData.push(y);
        }

        var temp = [];
        for (var i = 0; i<realTimeData.length; ++i) {
          temp.push([i, realTimeData[i]])
        }
        return temp;

      }

      var plot = $.plot('#realtime-chart', [getData()], 
      {
        colors: ['#a2d200'],
        series: {
          lines: { 
            show: true,
            fill: 0.1 
          },
          shadowSize: 0
        },
        yaxis: { 
          tickColor: 'rgba(255,255,255,.2)',
          min: 0,
          max: 100,
          font :{
            color: 'rgba(255,255,255,.8)'
          }
        },  
        grid: { 
          borderWidth: {
            top: 0,
            right: 0,
            bottom: 1,
            left: 1
          },
          color :  'rgba(255,255,255,.2)' 
        },
        tooltip: false,
        xaxis: { 
          show: false
        }
      });

      function update() {
        plot.setData([getData()]);
        plot.draw();
        setTimeout(update, updateInterval);
      };

      update(); 

      //server load rickshaw chart
      var graph;

      var seriesData = [ [], []];
      var random = new Rickshaw.Fixtures.RandomData(50);

      for (var i = 0; i < 50; i++) {
        random.addData(seriesData);
      }

      graph = new Rickshaw.Graph( {
        element: document.querySelector("#rickshaw-chart"),
        height: 150,
        renderer: 'area',
        series: [
          {
            data: seriesData[0],
            color: '#6e6e6e',
            name:'File Server'
          },{
            data: seriesData[1],
            color: '#fff',
            name:'Mail Server'
          }
        ]
      } );

      var hoverDetail = new Rickshaw.Graph.HoverDetail( {
        graph: graph,
      });

      setInterval( function() {
        random.removeData(seriesData);
        random.addData(seriesData);
        graph.update();

      },1000);


      // Generate easy-pie charts
      var charts = $('.easypiechart .percentage');
      charts.easyPieChart({
        animate: 2000,
        onStart: function(value) {
          $(this.el).find('span').animateNumbers(Math.floor(100*Math.random()));
        }
      });

      //update instance every 5 sec
      window.setInterval(function() {

        // refresh easy pie chart
        charts.each(function() {
          $(this).data('easyPieChart').update(Math.floor(100*Math.random()));
        });

      }, 5000);

      // Generate justGage charts

      var g01 = new JustGage({
        id: "gauge01", 
        value: 67, 
        min: 0,
        max: 100,
        title: "New Users",
        titleFontColor : "rgba(255,255,255,.6)",
        valueFontColor:  "rgba(255,255,255,.8)"
      }); 

      var g02 = new JustGage({
        id: "gauge02",
        value : 30,
        title : "Custom Width",
        min: 0,
        max: 100,
        gaugeWidthScale: .3,
        titleFontColor : "rgba(255,255,255,.6)",
        valueFontColor:  "rgba(255,255,255,.8)"
      }); 

      var g03 = new JustGage({
        id: "gauge03",
        value : 92,
        title : "Animation",
        min: 0,
        max: 100,
        startAnimationType: 'bounce',
        refreshAnimationType: 'bounce',
        refreshAnimationTime: 2500,
        titleFontColor : "rgba(255,255,255,.6)",
        valueFontColor:  "rgba(255,255,255,.8)"
      });

      var g04 = new JustGage({
        id: "gauge04",
        value : 72,
        title : "Donut Style",
        min: 0,
        max: 100,
        donut: true,
        titleFontColor : "rgba(255,255,255,.6)",
        valueFontColor:  "rgba(255,255,255,.8)"
      }); 

      //update instance every 5 sec
      window.setInterval(function() {

        // refresh justGage charts
        g01.refresh(getRandomInt(0, 100));
        g02.refresh(getRandomInt(0, 100));
        g03.refresh(getRandomInt(0, 100));
        g04.refresh(getRandomInt(0, 100));

      }, 5000);
      
    })
      
    </script>
  </body>
</html>
      
