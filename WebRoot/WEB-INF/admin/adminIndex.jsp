<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Q淘商城后台管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8" />

   <link rel="icon" type="image/ico" href="http://tattek.com/minimal/assets/images/favicon.ico" /> 
    <!-- Bootstrap -->
    <link href="assets/css/vendor/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet"> 
    <link rel="stylesheet" href="assets/css/vendor/animate/animate.min.css">
    <link type="text/css" rel="stylesheet" media="all" href="assets/js/vendor/mmenu/css/jquery.mmenu.all.css" />
    <link rel="stylesheet" href="assets/js/vendor/videobackground/css/jquery.videobackground.css">
    <link rel="stylesheet" href="assets/css/vendor/bootstrap-checkbox.css">

    <link rel="stylesheet" href="assets/js/vendor/rickshaw/css/rickshaw.min.css">
    <link rel="stylesheet" href="assets/js/vendor/morris/css/morris.css">
    <link rel="stylesheet" href="assets/js/vendor/tabdrop/css/tabdrop.css">
    <link rel="stylesheet" href="assets/js/vendor/summernote/css/summernote.css">
    <link rel="stylesheet" href="assets/js/vendor/summernote/css/summernote-bs3.css">
    <link rel="stylesheet" href="assets/js/vendor/chosen/css/chosen.min.css">
    <link rel="stylesheet" href="assets/js/vendor/chosen/css/chosen-bootstrap.css">

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
        




       <!-- 左侧和顶端栏 -->
	
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
              
               <li class="dropdown">
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
                    <li>
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
            

            <h2><i class="fa fa-tachometer"></i> 主页
            <span></span></h2>
            

            <div class="breadcrumbs">
              <ol class="breadcrumb">
                <li>Q淘后台</li>
                <li><a href="${pageContext.request.contextPath }/admin_index.action">管理面板</a></li>
                <li class="active">主页</li>
              </ol>
            </div>
 

          </div>
          <!-- /page header -->
          
          




          <!-- content main container -->
          <div class="main">



            <!-- cards -->
            <div class="row cards">
              
              <div class="card-container col-lg-3 col-sm-6 col-sm-12">
                <div class="card card-redbrown hover">
                  <div class="front"> 

                    <div class="media">        
                      <span class="pull-left">
                        <i class="fa fa-users media-object"></i>
                      </span>

                      <div class="media-body">
                        <small>新增用户</small>
                        <h2 class="media-heading animate-number" data-value="3659" data-animation-duration="1500">0</h2>
                      </div>
                    </div> 

                    <div class="progress-list">
                      <div class="details">
                        <div class="title">月度计划%</div>
                      </div>
                      <div class="status pull-right bg-transparent-black-1">
                        <span class="animate-number" data-value="83" data-animation-duration="1500">0</span>%
                      </div>
                      <div class="clearfix"></div>
                      <div class="progress progress-little progress-transparent-black">
                        <div class="progress-bar animate-progress-bar" data-percentage="83%"></div>
                      </div>
                    </div>

                  </div>
                  <div class="back">
                    <a href="#">
                      <i class="fa fa-bar-chart-o fa-4x"></i>
                      <span>查看季度情况</span>
                    </a>  
                  </div>
                </div>
              </div>


              <div class="card-container col-lg-3 col-sm-6 col-sm-12">
                <div class="card card-blue hover">
                  <div class="front">        
                    
                    <div class="media">                  
                      <span class="pull-left">
                        <i class="fa fa-shopping-cart media-object"></i>
                      </span>

                      <div class="media-body">
                        <small>新订单</small>
                        <h2 class="media-heading animate-number" data-value="19214" data-animation-duration="1500">0</h2>
                      </div>
                    </div> 

                    <div class="progress-list">
                      <div class="details">
                        <div class="title">月度计划 %</div>
                      </div>
                      <div class="status pull-right bg-transparent-black-1">
                        <span class="animate-number" data-value="100" data-animation-duration="1500">0</span>%
                      </div>
                      <div class="clearfix"></div>
                      <div class="progress progress-little progress-transparent-black">
                        <div class="progress-bar animate-progress-bar" data-percentage="100%"></div>
                      </div>
                    </div>

                  </div>
                  <div class="back">
                    <a href="#">
                      <i class="fa fa-bar-chart-o fa-4x"></i>
                      <span>查看季度情况</span>
                    </a>
                  </div>
                </div>
              </div>



              <div class="card-container col-lg-3 col-sm-6 col-sm-12">
                <div class="card card-greensea hover">
                  <div class="front">        
                    
                    <div class="media">
                      <span class="pull-left">
                        <i class="fa fa-usd media-object"></i>
                      </span>

                      <div class="media-body">
                        <small>销售情况</small>
                        <h2 class="media-heading animate-number" data-value="169541" data-animation-duration="1500">0</h2>
                      </div>
                    </div>

                    <div class="progress-list">
                      <div class="details">
                        <div class="title">月度计划 %</div>
                      </div>
                      <div class="status pull-right bg-transparent-black-1">
                        <span class="animate-number" data-value="42" data-animation-duration="1500">0</span>%
                      </div>
                      <div class="clearfix"></div>
                      <div class="progress progress-little progress-transparent-black">
                        <div class="progress-bar animate-progress-bar" data-percentage="42%"></div>
                      </div>
                    </div>

                  </div>
                  <div class="back">
                    <a href="#">
                      <i class="fa fa-bar-chart-o fa-4x"></i>
                      <span>查看季度情况</span>
                    </a>
                  </div>
                </div>
              </div>


              <div class="card-container col-lg-3 col-sm-6 col-xs-12">
                <div class="card card-slategray hover">
                  <div class="front"> 

                    <div class="media">                   
                      <span class="pull-left">
                        <i class="fa fa-eye media-object"></i>
                      </span>

                      <div class="media-body">
                        <small>访问量</small>
                        <h2 class="media-heading animate-number" data-value="9634" data-animation-duration="1500">0</h2>
                      </div>
                    </div> 

                    <div class="progress-list">
                      <div class="details">
                        <div class="title">月度计划 %</div>
                      </div>
                      <div class="status pull-right bg-transparent-black-1">
                        <span class="animate-number" data-value="25" data-animation-duration="1500">0</span>%
                      </div>
                      <div class="clearfix"></div>
                      <div class="progress progress-little progress-transparent-black">
                        <div class="progress-bar animate-progress-bar" data-percentage="25%"></div>
                      </div>
                    </div>

                  </div>
                  <div class="back">
                    <a href="#">
                      <i class="fa fa-bar-chart-o fa-4x"></i>
                      <span>查看季度情况</span>
                    </a>
                  </div>
                </div>
              </div>


            </div>
            <!-- /cards -->
            
            


            <!-- row -->
            <div class="row">


              <!-- col 8 -->
              <div class="col-lg-8 col-md-12">




                <!-- tile -->
                <section class="tile transparent">




                  <!-- tile header -->
                  <div class="tile-header color transparent-black textured rounded-top-corners">
                    <h1><strong>年度</strong> 销售表</h1>
                    <div class="controls">
                      <a href="#" class="refresh"><i class="fa fa-refresh"></i></a>
                      <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                  </div>
                  <!-- /tile header -->


                  <!-- tile widget -->
                  <div class="tile-widget color transparent-black textured">
                    <div id="statistics-chart" class="chart statistics" style="height: 250px;"></div>
                  </div>
                  <!-- /tile widget -->


                  <!-- tile body -->
                  <div class="tile-body color transparent-white rounded-bottom-corners">
                    <div class="row">
                      <ul class="inline">
                        
                        <li class="col-md-8 col-sm-12 col-xs-12 text-center">
                          
                          <h4 class="underline text-left"><strong>总体</strong> 情况表</h4>
                          
                          <div class="inner-container inline">
                            <div data-percent="100" data-size="140" class="pie-chart inline" data-scale-color="false" data-track-color="rgba(0,0,0,0)" data-bar-color="#ffffff" data-line-width="5">
                              <div class="text-center">
                                <i class="fa fa-usd fa-5x"></i>
                              </div>
                            </div>
                            <p class="chart-overall text-center medium-thin uppercase"><span class="big-medium animate-number" data-value="6175" data-animation-duration="2500">0</span> 销售情况</p>
                          </div>


                          <div class="inner-container inline">
                            <div data-percent="85" data-size="140" class="pie-chart inline" data-scale-color="false" data-track-color="rgba(0,0,0,0)" data-bar-color="rgba(0,0,0,.4)" data-line-width="5">
                              <div class="text-center">
                                <span><i class="fa fa-eye fa-5x color-transparent-black"></i></span>
                              </div>
                            </div>
                            <p class="chart-overall text-center medium-thin uppercase color-transparent-black"><span class="big-medium animate-number" data-value="8213" data-animation-duration="2500">0</span> 访问情况</p>
                          </div>

                        </li>

                        <li class="col-md-4 col-sm-12 col-xs-12">
                          <h4 class="underline"><strong>访客</strong> 情况表</h4>
                          <ul class="progress-list">
                            <li>
                              <div class="details">
                                <div class="title">美国</div>
                                <div class="description">来自美国的访客</div>
                              </div>
                              <div class="status pull-right">
                                <span class="animate-number" data-value="40" data-animation-duration="1500">0</span>%
                              </div>
                              <div class="clearfix"></div>
                              <div class="progress progress-little">
                                <div class="progress-bar progress-bar-green animate-progress-bar" data-percentage="40%" style="width: 0%;"></div>
                              </div>
                            </li>
                            <li>
                              <div class="details">
                                <div class="title">欧洲</div>
                                <div class="description">来自欧洲的访客</div>
                              </div>
                              <div class="status pull-right">
                                 <span class="animate-number" data-value="38" data-animation-duration="1000">0</span>%
                              </div>
                              <div class="clearfix"></div>
                              <div class="progress progress-little">
                                <div class="progress-bar progress-bar-cyan animate-progress-bar" data-percentage="35%" style="width: 0%;"></div>
                              </div>
                            </li>
                            <li>
                              <div class="details">
                                <div class="title">澳大利亚</div>
                                <div class="description">来自澳大利亚的访客</div>
                              </div>
                              <div class="status pull-right">
                                <span class="animate-number" data-value="12" data-animation-duration="800">0</span>%
                              </div>
                              <div class="clearfix"></div>
                              <div class="progress progress-little">
                                <div class="progress-bar progress-bar-amethyst animate-progress-bar" data-percentage="12%" style="width: 0%;"></div>
                              </div>
                            </li>
                            <li>
                              <div class="details">
                                <div class="title">非洲</div>
                                <div class="description">来自非洲的访客</div>
                              </div>
                              <div class="status pull-right">
                                <span class="animate-number" data-value="7" data-animation-duration="600">0</span>%
                              </div>
                              <div class="clearfix"></div>
                              <div class="progress progress-little">
                                <div class="progress-bar progress-bar-orange animate-progress-bar" data-percentage="7%" style="width: 0%;"></div>
                              </div>
                            </li>
                            <li>
                              <div class="details">
                                <div class="title">其他国家</div>
                              </div>
                              <div class="status pull-right">
                                <span class="animate-number" data-value="6" data-animation-duration="400">0</span>%
                              </div>
                              <div class="clearfix"></div>
                              <div class="progress progress-little">
                                <div class="progress-bar progress-bar-red animate-progress-bar" data-percentage="6%" style="width: 0%;"></div>
                              </div>
                            </li>       
                          </ul>
                        </li>
                      </ul>
                    </div>
                  </div>
                  <!-- /tile body -->



                </section>
                <!-- /tile -->



                <!-- tile -->
                <section class="tile color transparent-black">




                  <!-- tile header -->
                  <div class="tile-header">
                    <h1><strong>销售</strong> 计划</h1>
            <!--         <div class="search">
                      <input type="text" placeholder="Search...">
                    </div> -->
                    <div class="controls">
                      <a href="#" class="refresh"><i class="fa fa-refresh"></i></a>
                      <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                  </div>
                  <!-- /tile header -->


                  <!-- tile body -->
                  <div class="tile-body no-vpadding">
                    <div class="table-responsive">
                      <table class="table table-custom table-sortable nomargin">
                        <thead>
                          <tr>
                            <th class="sortable sort-numeric sort-asc">序号</th>
                            <th class="sortable sort-alpha">商品名</th>
                            <th class="sortable">优先级</th>
                            <th class="sortable sort-amount">状态</th>
                            <th class="text-right">进度表</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td>1</td>
                            <td>卫衣</td>
                            <td class="color-red priority">高</td>
                            <td class="progress-cell">
                              <div class="progress-info">
                                <div class="percent"><span class="animate-number" data-value="50" data-animation-duration="1500">0</span>%</div>
                              </div>
                              <div class="progress progress-little">
                                <div class="progress-bar progress-bar-transparent-white animate-progress-bar" data-percentage="50%"></div>
                              </div>
                            </td>
                            <td class="text-right"><span id="projectbar1">87,84,42,89,70,55,82,68</span></td>
                          </tr>
                          <tr>
                            <td>2</td>
                            <td>牛仔裤</td>
                            <td class="color-green priority">低</td>
                            <td class="progress-cell">
                              <div class="progress-info">
                                <div class="percent"><span class="animate-number" data-value="13" data-animation-duration="1500">0</span>%</div>
                              </div>
                              <div class="progress progress-little">
                                <div class="progress-bar progress-bar-transparent-white animate-progress-bar" data-percentage="13%"></div>
                              </div>
                            </td>
                            <td class="text-right"><span id="projectbar2">87,99,52,93,42,86,51,93</span></td>
                          </tr>
                          <tr>
                            <td>3</td>
                            <td>小米</td>
                            <td class="color-red priority">高</td>
                            <td class="progress-cell">
                              <div class="progress-info">
                                <div class="percent"><span class="animate-number" data-value="76" data-animation-duration="1500">0</span>%</div>
                              </div>
                              <div class="progress progress-little">
                                <div class="progress-bar progress-bar-transparent-white animate-progress-bar" data-percentage="76%"></div>
                              </div>
                            </td>
                            <td class="text-right"><span id="projectbar3">74,88,82,91,69,63,46,63</span></td>
                          </tr>
                          <tr>
                            <td>4</td>
                            <td>华为</td>
                            <td class="color-orange priority">中</td>
                            <td class="progress-cell">
                              <div class="progress-info">
                                <div class="percent"><span class="animate-number" data-value="38" data-animation-duration="1500">0</span>%</div>
                              </div>
                              <div class="progress progress-little">
                                <div class="progress-bar progress-bar-transparent-white animate-progress-bar" data-percentage="38%"></div>
                              </div>
                            </td>
                            <td class="text-right"><span id="projectbar4">52,45,76,74,77,57,65,86</span></td>
                          </tr>
                          <tr>
                            <td>5</td>
                            <td>电脑</td>
                            <td class="color-green priority">低</td>
                            <td class="progress-cell">
                              <div class="progress-info">
                                <div class="percent"><span class="animate-number" data-value="9" data-animation-duration="1500">0</span>%</div>
                              </div>
                              <div class="progress progress-little">
                                <div class="progress-bar progress-bar-transparent-white animate-progress-bar" data-percentage="9%"></div>
                              </div>
                            </td>
                            <td class="text-right"><span id="projectbar5">53,70,47,96,72,49,69,45</span></td>
                          </tr>
                          <tr>
                            <td>6</td>
                            <td>内存</td>
                            <td class="color-orange priority">中</td>
                            <td class="progress-cell">
                              <div class="progress-info">
                                <div class="percent"><span class="animate-number" data-value="29" data-animation-duration="1500">0</span>%</div>
                              </div>
                              <div class="progress progress-little">
                                <div class="progress-bar progress-bar-transparent-white animate-progress-bar" data-percentage="29%"></div>
                              </div>
                            </td>
                            <td class="text-right"><span id="projectbar6">69,80,85,96,67,58,75,82</span></td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </div>
                  <!-- /tile body -->


                  <!-- tile footer -->
                  <div class="tile-footer text-center">
                    <ul class="pagination pagination-sm nomargin pagination-custom">
                      <li class="disabled"><a href="#"><i class="fa fa-angle-double-left"></i></a></li>
                      <li class="active"><a href="#">1</a></li>
                      <li><a href="#">2</a></li>
                      <li><a href="#">3</a></li>
                      <li><a href="#">4</a></li>
                      <li><a href="#">5</a></li>
                      <li><a href="#"><i class="fa fa-angle-double-right"></i></a></li>
                    </ul>
                  </div>
                  <!-- /tile footer -->



                </section>
                <!-- /tile -->


              </div>
              <!-- /col 8 -->



              <!-- col 4 -->
              <div class="col-lg-4 col-md-12 col-sm-12 col-xs-12">
                



                <!-- tile -->
                <section class="tile color transparent-black textured">




                  <!-- tile header -->
                  <div class="tile-header">
                    <h1><strong>服务器</strong> 运行情况</h1>
                    <div class="controls">
                      <a href="#" class="refresh"><i class="fa fa-refresh"></i></a>
                      <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                  </div>
                  <!-- /tile header -->

                  <!-- tile widget -->
                  <div class="tile-widget">

                    <div class="progress-list with-heading">
                      <div class="details">
                        <div class="title"><h2><i class="fa fa-hdd-o"></i> <span class="animate-number" data-value="60" data-animation-duration="1600">0</span> GB</h2></div>
                      </div>
                      <div class="status pull-right bg-transparent-black-1">
                        <span class="animate-number" data-value="42" data-animation-duration="1500">0</span>%
                      </div>
                      <div class="clearfix"></div>
                      <div class="progress progress-little progress-transparent-black" style="margin-bottom: 5px">
                        <div class="progress-bar animate-progress-bar" data-percentage="42%"></div>
                      </div>
                    </div>  
                    <p class="description"><strong>磁盘共60GB</strong> 已使用 <strong class="white-text">24GB</strong> </p>
                  </div>
                  <!-- /tile widget -->


                  <!-- tile body -->
                  <div class="tile-body paddingtop">
                    <div id="serverload-chart"></div>
                  </div>
                  <!-- /tile body -->
                


                </section>
                <!-- /tile -->


                <!-- tile -->
                <section class="tile color transparent-black">



                  <!-- tile header -->
                  <div class="tile-header">
                    <h1><strong>浏览器</strong> 访问情况</h1>
                    <div class="controls">
                      <a href="#" class="refresh"><i class="fa fa-refresh"></i></a>
                      <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                  </div>
                  <!-- /tile header -->

                  <!-- tile body -->
                  <div class="tile-body">
                    <div id="browser-usage" style="height: 230px;" class="morris-chart"></div>
                    <ul class="inline text-center chart-legend">
                      <li><span class="badge badge-outline" style="border-color: #00a3d8"></span> Chrome <small>25%</small>,</li>
                      <li><span class="badge badge-outline" style="border-color: #1693A5"></span> Other <small>25%</small>,</li>
                      <li><span class="badge badge-outline" style="border-color: #2fbbe8"></span> Safari <small>20%</small>,</li>
                      <li><span class="badge badge-outline" style="border-color: #72cae7"></span> Firefox <small>15%</small>,</li>
                      <li><span class="badge badge-outline" style="border-color: #ffc100"></span> Internet Explorer <small>10%</small>,</li>
                      <li><span class="badge badge-outline" style="border-color: #d9544f"></span> Opera <small>5%</small></li>
                    </ul>
                  </div>
                  <!-- /tile body --> 




                </section>
                <!-- /tile -->



                <!-- tile -->
                <section class="tile transparent">




                  <!-- tile header -->
                  <div class="tile-header color redbrown rounded-top-corners text-center">               
                    <button class="btn pull-left btn-black-transparent" type="button"><i class="fa fa-caret-square-o-down"></i></button>
                    <h2><strong>记事本</strong> 列表</h2>
                    <div class="controls">
                      <a href="#" class="refresh"><i class="fa fa-refresh"></i></a>
                      <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                  </div>
                  <!-- /tile header -->

                  <!-- tile body -->
                  <div class="tile-body color transparent-black rounded-bottom-corners">
                    <input type="text" placeholder="添加待做事项..." class="w100p bottommargin">
                    <ul class="nolisttypes" id="todolist">
                      <li>
                        <div class="checkbox check-transparent">
                          <input type="checkbox" value="1" id="todo-01">
                          <label for="todo-01">备份资料</label>
                        </div>
                      </li>
                      <li>
                        <div class="checkbox check-transparent">
                          <input type="checkbox" checked="checked" value="1" id="todo-02">
                          <label for="todo-02" class="done">发 e-mail 回复李明</label>
                        </div>
                      </li>
                      <li>
                        <div class="checkbox check-transparent">
                          <input type="checkbox" value="1" id="todo-03">
                          <label for="todo-03">购买车票</label>
                        </div>
                      </li>
                      <li>
                        <div class="checkbox check-transparent">
                          <input type="checkbox" value="1" id="todo-04">
                          <label for="todo-04">8：00开主题会议</label>
                        </div>
                      </li>
                      <li>
                        <div class="checkbox check-transparent">
                          <input type="checkbox" value="1" id="todo-05">
                          <label for="todo-05">维护服务器</label>
                        </div>
                      </li>
                      <li>
                        <div class="checkbox check-transparent">
                          <input type="checkbox" value="1" id="todo-06">
                          <label for="todo-06">上架新品</label>
                        </div>
                      </li>
                    </ul>
                  </div>
                  <!-- /tile body -->
                


                </section>
                <!-- /tile -->


              </div>
              <!-- /col 4 -->
              
              
            </div>
            <!-- /row -->


            <!-- row -->
            <div class="row">




              <!-- col 6 -->
              <div class="col-md-6">

                
                <!-- tile -->
                <section class="tile transparent recent-activity">




                  <!-- tile header -->
                  <div class="tile-header transparent">               
                    <h1><strong>最近</strong> 事务</h1>
                    <div class="controls">
                      <a href="#" class="refresh"><i class="fa fa-refresh"></i></a>
                      <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                  </div>
                  <!-- /tile header -->


                  
                  <!-- tile widget -->
                  <div class="tile-widget color transparent-black rounded-top-corners nopadding">
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs tabdrop">
                      <li class="active"><a href="#users-tab" data-toggle="tab">用户</a></li>
                      <li><a href="#orders-tab" data-toggle="tab">订单</a></li>
                      <li><a href="#messages-tab" data-toggle="tab">消息</a></li>
                      <li><a href="#tasks-tab" data-toggle="tab">任务</a></li>
                      <li><a href="#comments-tab" data-toggle="tab">评价</a></li>
                    </ul>
                    <!-- / Nav tabs -->
                  </div>
                  <!-- /tile widget -->




                  <!-- tile body -->
                  <div class="tile-body tab-content nopadding rounded-bottom-corners">
                    <!-- Tab panes -->
                    
                    <ul id="users-tab" class="tab-pane fade in active">
                      <li>
                        <img src="assets/images/peter-avatar.jpg" class="w35" alt="">
                        <span class="user font-slab">李 <strong>明</strong></span>
                        <span class="subject">被 <strong>拉黑</strong></span>
                        <span class="time"><i class="fa fa-clock-o"></i> 15 minutes ago</span>
                      </li>
                      <li>
                        <img src="assets/images/arnold-avatar.jpg" class="w35" alt="">
                        <span class="user font-slab">范 <strong>和</strong></span>
                        <span class="subject">恢复 <strong>使用</strong></span>
                        <span class="time"><i class="fa fa-clock-o"></i> 1 hour ago</span>
                      </li>
                      <li>
                        <img src="assets/images/arnold-avatar.jpg" class="w35" alt="">
                        <span class="user font-slab">诸葛 <strong>正我</strong></span>
                        <span class="subject">申请 <strong>解封账号</strong></span>
                        <span class="time"><i class="fa fa-clock-o"></i> 2 hours ago</span>
                      </li>
                      <li>
                        <img src="assets/images/ici-avatar.jpg" class="w35" alt="">
                        <span class="user font-slab">程<strong>晨 </strong></span>
                        <span class="subject">更新 <strong>用户信息</strong></span>
                        <span class="time"><i class="fa fa-clock-o"></i> 4 hours ago</span>
                      </li>
                      <li>
                        <img src="assets/images/arnold-avatar.jpg" class="w35" alt="">
                        <span class="user font-slab">司马 <strong>俊</strong></span>
                        <span class="subject">修改了 <strong>用户密码</strong></span>
                        <span class="time"><i class="fa fa-clock-o"></i> 8 hours ago</span>
                      </li>
                      <li>
                        <img src="assets/images/peter-avatar.jpg" class="w35" alt="">
                        <span class="user font-slab">丁<strong>峰</strong></span>
                        <span class="subject">申请 <strong>解封账号</strong></span>
                        <span class="time"><i class="fa fa-clock-o"></i> 12 hours ago</span>
                      </li>
                      <li>
                        <img src="assets/images/peter-avatar.jpg" class="w35" alt="">
                        <span class="user font-slab">初音 <strong>未来</strong></span>
                        <span class="subject">注册 <strong>账号</strong></span>
                        <span class="time"><i class="fa fa-clock-o"></i> yesterday</span>
                      </li>
                    </ul>

                    <ul id="orders-tab" class="tab-pane fade">
                      <li>
                        <img src="assets/images/arnold-avatar.jpg" class="w35" alt="">
                        <span class="user font-slab">初音 <strong>未来</strong></span>
                        <span class="subject">提交新订单 <strong>订单号OR_00012014</strong></span>
                        <span class="time"><i class="fa fa-clock-o"></i> 15 minutes ago</span>
                      </li>
                      <li>
                        <img src="assets/images/george-avatar.jpg" class="w35" alt="">
                        <span class="user font-slab">邓 <strong>毅</strong></span>
                        <span class="subject">删除订单 <strong>订单号OR_02172013</strong></span>
                        <span class="time"><i class="fa fa-clock-o"></i> 27 minutes ago</span>
                      </li>
                      <li>
                        <img src="assets/images/george-avatar.jpg" class="w35" alt="">
                        <span class="user font-slab">王 <strong>涵</strong></span>
                        <span class="subject">支付订单 <strong>订单号OR_02172013</strong></span>
                        <span class="time"><i class="fa fa-clock-o"></i> 35 minutes ago</span>
                      </li>
                      <li>
                        <img src="assets/images/peter-avatar.jpg" class="w35" alt="">
                        <span class="user font-slab">钟 <strong>会</strong></span>
                        <span class="subject"> 提交订单<strong>订单号OR_02162013</strong></span>
                        <span class="time"><i class="fa fa-clock-o"></i> 2 hours ago</span>
                      </li>
                      <li>
                        <img src="assets/images/peter-avatar.jpg" class="w35" alt="">
                        <span class="user font-slab">刘 <strong>能</strong></span>
                        <span class="subject">支付订单 <strong>订单号OR_02162013</strong></span>
                        <span class="time"><i class="fa fa-clock-o"></i> 3 hours ago</span>
                      </li>
                      <li>
                        <img src="assets/images/ici-avatar.jpg" class="w35" alt="">
                        <span class="user font-slab">邓 <strong>忠</strong></span>
                        <span class="subject">支付订单 <strong>订单号OR_02152013</strong></span>
                        <span class="time"><i class="fa fa-clock-o"></i> 5 hours ago</span>
                      </li>
                      <li>
                        <img src="assets/images/ici-avatar.jpg" class="w35" alt="">
                        <span class="user font-slab">李<strong>胜 </strong></span>
                        <span class="subject">提价订单 <strong>订单号OR_02142013</strong></span>
                        <span class="time"><i class="fa fa-clock-o"></i> 5 hours ago</span>
                      </li>
                    </ul>

                    <ul id="messages-tab" class="tab-pane fade">
                      <li>
                        <img src="assets/images/profile-photo.jpg" class="w35" alt="">
                        <span class="user font-slab"><strong>您</strong></span>
                        <span class="subject">收到一个来自<strong>李明的消息</strong></span>
                        <span class="time"><i class="fa fa-clock-o"></i> 15 minutes ago</span>
                      </li>
                      <li>
                        <img src="assets/images/profile-photo.jpg" class="w35" alt="">
                        <span class="user font-slab"><strong>您</strong></span>
                        <span class="subject">收到一个来自 <strong>kimiy的消息</strong></span>
                        <span class="time"><i class="fa fa-clock-o"></i> 30 minutes ago</span>
                      </li>
                      <li>
                        <img src="assets/images/profile-photo.jpg" class="w35" alt="">
                        <span class="user font-slab"><strong>您</strong></span>
                        <span class="subject">收到一个来自 <strong>陈旺的消息</strong></span>
                        <span class="time"><i class="fa fa-clock-o"></i> 35 minutes ago</span>
                      </li>
                      <li>
                        <img src="assets/images/profile-photo.jpg" class="w35" alt="">
                        <span class="user font-slab"><strong>您</strong></span>
                        <span class="subject">收到一个来自 <strong>范和的消息</strong></span>
                        <span class="time"><i class="fa fa-clock-o"></i> 42 minutes ago</span>
                      </li>
                      <li>
                        <img src="assets/images/profile-photo.jpg" class="w35" alt="">
                        <span class="user font-slab"><strong>您</strong></span>
                        <span class="subject">收到一个来自 <strong>小陈的消息</strong></span>
                        <span class="time"><i class="fa fa-clock-o"></i> 1 hour ago</span>
                      </li>
                      <li>
                        <img src="assets/images/profile-photo.jpg" class="w35" alt="">
                        <span class="user font-slab"><strong>您</strong></span>
                        <span class="subject">收到一个来自<strong>孙林的消息</strong></span>
                        <span class="time"><i class="fa fa-clock-o"></i> 1 hour ago</span>
                      </li>
                      <li>
                        <img src="assets/images/profile-photo.jpg" class="w35" alt="">
                        <span class="user font-slab"><strong>您</strong></span>
                        <span class="subject">收到一个来自 <strong>王安的消息</strong></span>
                        <span class="time"><i class="fa fa-clock-o"></i> 1 hour ago</span>
                      </li>
                    </ul>

                    <ul id="tasks-tab" class="tab-pane fade">
                      <li>
                        <img src="assets/images/profile-photo.jpg" class="w35" alt="">
                        <span class="user font-slab"><strong>您</strong></span>
                        <span class="subject">新订单需要<strong>处理</strong></span>
                        <span class="time"><i class="fa fa-clock-o"></i> 15 minutes ago</span>
                      </li>
                      <li>
                        <img src="assets/images/profile-photo.jpg" class="w35" alt="">
                        <span class="user font-slab"><strong>您</strong></span>
                        <span class="subject">有一个物流 <strong>待确认!</strong></span>
                        <span class="time"><i class="fa fa-clock-o"></i> 59 minutes ago</span>
                      </li>
                      <li>
                        <img src="assets/images/profile-photo.jpg" class="w35" alt="">
                        <span class="user font-slab"><strong>您</strong></span>
                        <span class="subject">有一个订单还没 <strong>发货</strong></span>
                        <span class="time"><i class="fa fa-clock-o"></i> 3 hours ago</span>
                      </li>
                      <li>
                        <img src="assets/images/profile-photo.jpg" class="w35" alt="">
                        <span class="user font-slab"><strong>您</strong></span>
                        <span class="subject">有一个新的退货<strong>申请!</strong></span>
                        <span class="time"><i class="fa fa-clock-o"></i> yesterday</span>
                      </li>
                      <li>
                        <img src="assets/images/profile-photo.jpg" class="w35" alt="">
                        <span class="user font-slab"><strong>您</strong></span>
                        <span class="subject">有一个退货件 <strong>收到</strong></span>
                        <span class="time"><i class="fa fa-clock-o"></i> yesterday</span>
                      </li>
                      <li>
                        <img src="assets/images/profile-photo.jpg" class="w35" alt="">
                        <span class="user font-slab"><strong>您</strong></span>
                        <span class="subject">有一个新的账号申请 <strong>处理</strong></span>
                        <span class="time"><i class="fa fa-clock-o"></i> yesterday</span>
                      </li>
                      <li>
                        <img src="assets/images/profile-photo.jpg" class="w35" alt="">
                        <span class="user font-slab"><strong>您</strong></span>
                        <span class="subject">有一个订单还没 <strong>发货</strong></span>
                        <span class="time"><i class="fa fa-clock-o"></i> yesterday</span>
                      </li>
                    </ul>

                    <ul id="comments-tab" class="tab-pane fade">
                      <li>
                        <img src="assets/images/arnold-avatar.jpg" class="w35" alt="">
                        <span class="user font-slab">初音 <strong>未来</strong></span>
                        <span class="subject">提交评论 <strong>订单号OR_00012014</strong></span>
                        <span class="time"><i class="fa fa-clock-o"></i> 15 minutes ago</span>
                      </li>
                      <li>
                        <img src="assets/images/george-avatar.jpg" class="w35" alt="">
                        <span class="user font-slab">邓 <strong>毅</strong></span>
                        <span class="subject">删除评论 <strong>订单号OR_02172013</strong></span>
                        <span class="time"><i class="fa fa-clock-o"></i> 27 minutes ago</span>
                      </li>
                      <li>
                        <img src="assets/images/george-avatar.jpg" class="w35" alt="">
                        <span class="user font-slab">王 <strong>涵</strong></span>
                        <span class="subject">提交评论 <strong>订单号OR_02172013</strong></span>
                        <span class="time"><i class="fa fa-clock-o"></i> 35 minutes ago</span>
                      </li>
                      <li>
                        <img src="assets/images/peter-avatar.jpg" class="w35" alt="">
                        <span class="user font-slab">钟 <strong>会</strong></span>
                        <span class="subject"> 提交评论<strong>订单号OR_02162013</strong></span>
                        <span class="time"><i class="fa fa-clock-o"></i> 2 hours ago</span>
                      </li>
                      <li>
                        <img src="assets/images/peter-avatar.jpg" class="w35" alt="">
                        <span class="user font-slab">刘 <strong>能</strong></span>
                        <span class="subject">修改评论 <strong>订单号OR_02162013</strong></span>
                        <span class="time"><i class="fa fa-clock-o"></i> 3 hours ago</span>
                      </li>
                      <li>
                        <img src="assets/images/ici-avatar.jpg" class="w35" alt="">
                        <span class="user font-slab">邓 <strong>忠</strong></span>
                        <span class="subject">删除评论 <strong>订单号OR_02152013</strong></span>
                        <span class="time"><i class="fa fa-clock-o"></i> 5 hours ago</span>
                      </li>
                      <li>
                        <img src="assets/images/ici-avatar.jpg" class="w35" alt="">
                        <span class="user font-slab">李<strong>胜 </strong></span>
                        <span class="subject">提交评论<strong>订单号OR_02142013</strong></span>
                        <span class="time"><i class="fa fa-clock-o"></i> 5 hours ago</span>
                      </li>
                    </ul>

                    <!-- / Tab panes -->
                  </div>
                  <!-- /tile body -->
                


                </section>
                <!-- /tile -->


              </div>
              <!-- /col 6 -->




              <!-- col 6 -->
              <div class="col-md-6">



                <!-- tile -->
                <section class="tile transparent">




                  <!-- tile header -->
                  <div class="tile-header transparent">               
                    <h1><strong>快速</strong> 回复</h1>
                    <div class="controls">
                      <a href="#" class="refresh"><i class="fa fa-refresh"></i></a>
                      <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                  </div>
                  <!-- /tile header -->



                  <!-- tile widget -->
                  <div class="tile-widget color transparent-black rounded-top-corners">
                    <form class="form-horizontal" role="form">
                      <div class="form-group">
                        <label for="message-to" class="col-sm-2 control-label font-slab">收件人</label>
                        <div class="col-sm-10">
                          <select data-placeholder="选择收件人..." multiple="" tabindex="3" class="chosen-select form-control chosen-transparent" id="message-to">
                            <option value="http://tattek.com/minimal/ici@gmail.com">ici@gmail.com</option>
                            <option value="http://tattek.com/minimal/johny@126.com">johny@126.com</option>
                            <option value="http://tattek.com/minimal/arnie@163.com">arnie@163.com</option>
                            <option value="http://tattek.com/minimal/pete@qq.com">pete@qq.com</option>
                            <option value="http://tattek.com/minimal/gorge@gmail.com">gorge@gmail.com</option>
                          </select>
                        </div>
                      </div>
                      <div class="form-group no-bottom-margin">
                        <label for="subject" class="col-sm-2 control-label font-slab">主题</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control transparent" id="subject" placeholder="主题...">
                        </div>
                      </div>
                    </form>
                  </div>
                  <!-- /tile widget -->



                  <!-- tile body -->
                  <div class="tile-body nopadding">
                    <div id="quick-message-content"></div>
                  </div>
                  <!-- /tile body -->


                  <!-- tile footer -->
                  <div class="tile-footer rounded-bottom-corners text-right">
                    <a class="submit font-slab" href="#"><strong>发送</strong> 消息 <i class="fa fa-comment"></i></a>
                  </div>
                  <!-- /tile footer -->

              


                </section>
                <!-- /tile -->

              


              </div>
              <!-- /col 6 -->
              



            </div>
            <!-- /row -->  



          </div>
          <!-- /content container -->






        </div>
        <!-- Page content end -->



		<!-- 最右侧好友列表 -->
		<%@include file="below.jsp" %>






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
    <script src="assets/js/vendor/flot/jquery.flot.time.min.js"></script>
    <script src="assets/js/vendor/flot/jquery.flot.selection.min.js"></script>
    <script src="assets/js/vendor/flot/jquery.flot.animator.min.js"></script>
    <script src="assets/js/vendor/flot/jquery.flot.orderBars.js"></script>
    <script src="assets/js/vendor/easypiechart/jquery.easypiechart.min.js"></script>

    <script src="assets/js/vendor/rickshaw/raphael-min.js"></script> 
    <script src="assets/js/vendor/rickshaw/d3.v2.js"></script>
    <script src="assets/js/vendor/rickshaw/rickshaw.min.js"></script>

    <script src="assets/js/vendor/morris/morris.min.js"></script>

    <script src="assets/js/vendor/tabdrop/bootstrap-tabdrop.min.js"></script>

    <script src="assets/js/vendor/summernote/summernote.min.js"></script>

    <script src="assets/js/vendor/chosen/chosen.jquery.min.js"></script>

    <script src="assets/js/minimal.min.js"></script>

    <script>
    $(function(){

      // Initialize card flip
      $('.card.hover').hover(function(){
        $(this).addClass('flip');
      },function(){
        $(this).removeClass('flip');
      });

      // Initialize flot chart
      var d1 =[ [1, 715],
            [2, 985],
            [3, 1525],
            [4, 1254],
            [5, 1861],
            [6, 2621],
            [7, 1987],
            [8, 2136],
            [9, 2364],
            [10, 2851],
            [11, 1546],
            [12, 2541]
      ];
      var d2 =[ [1, 463],
                [2, 578],
                [3, 327],
                [4, 984],
                [5, 1268],
                [6, 1684],
                [7, 1425],
                [8, 1233],
                [9, 1354],
                [10, 1200],
                [11, 1260],
                [12, 1320]
      ];
      var months = ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"];

      // flot chart generate
      var plot = $.plotAnimator($("#statistics-chart"), 
        [
          {
            label: 'Sales', 
            data: d1,    
            lines: {lineWidth:3}, 
            shadowSize:0,
            color: '#ffffff'
          },
          { label: "Visits",
            data: d2, 
            animator: {steps: 99, duration: 500, start:200, direction: "right"},   
            lines: {        
              fill: .15,
              lineWidth: 0
            },
            color:['#ffffff']
          },{
            label: 'Sales',
            data: d1, 
            points: { show: true, fill: true, radius:6,fillColor:"rgba(0,0,0,.5)",lineWidth:2 }, 
            color: '#fff',        
            shadowSize:0
          },
          { label: "Visits",
            data: d2, 
            points: { show: true, fill: true, radius:6,fillColor:"rgba(255,255,255,.2)",lineWidth:2 }, 
            color: '#fff',        
            shadowSize:0
          }
        ],{ 
        
        xaxis: {

          tickLength: 0,
          tickDecimals: 0,
          min:1,
          ticks: [[1,"一月"], [2, "二月"], [3, "三月"], [4, "四月"], [5, "五月"], [6, "六月"], [7, "七月"], [8, "八月"], [9, "九月"], [10, "十月"], [11, "十一月"], [12, "十二月"]],

          font :{
            lineHeight: 24,
            weight: "300",
            color: "#ffffff",
            size: 14
          }
        },
        
        yaxis: {
          ticks: 4,
          tickDecimals: 0,
          tickColor: "rgba(255,255,255,.3)",

          font :{
            lineHeight: 13,
            weight: "300",
            color: "#ffffff"
          }
        },
        
        grid: {
          borderWidth: {
            top: 0,
            right: 0,
            bottom: 1,
            left: 1
          },
          borderColor: 'rgba(255,255,255,.3)',
          margin:0,
          minBorderMargin:0,              
          labelMargin:20,
          hoverable: true,
          clickable: true,
          mouseActiveRadius:6
        },
        
        legend: { show: false}
      });

      $(window).resize(function() {
        // redraw the graph in the correctly sized div
        plot.resize();
        plot.setupGrid();
        plot.draw();
      });

      $('#mmenu').on(
        "opened.mm",
        function()
        {
          // redraw the graph in the correctly sized div
          plot.resize();
          plot.setupGrid();
          plot.draw();
        }
      );

      $('#mmenu').on(
        "closed.mm",
        function()
        {
          // redraw the graph in the correctly sized div
          plot.resize();
          plot.setupGrid();
          plot.draw();
        }
      );

      // tooltips showing
      $("#statistics-chart").bind("plothover", function (event, pos, item) {
        if (item) {
          var x = item.datapoint[0],
              y = item.datapoint[1];

          $("#tooltip").html('<h1 style="color: #418bca">' + months[x - 1] + '</h1>' + '<strong>' + y + '</strong>' + ' ' + item.series.label)
            .css({top: item.pageY-30, left: item.pageX+5})
            .fadeIn(200);
        } else {
          $("#tooltip").hide();
        }
      });

      
      //tooltips options
      $("<div id='tooltip'></div>").css({
        position: "absolute",
        //display: "none",
        padding: "10px 20px",
        "background-color": "#ffffff",
        "z-index":"99999"
      }).appendTo("body");

      //generate actual pie charts
      $('.pie-chart').easyPieChart();


      //server load rickshaw chart
      var graph;

      var seriesData = [ [], []];
      var random = new Rickshaw.Fixtures.RandomData(50);

      for (var i = 0; i < 50; i++) {
        random.addData(seriesData);
      }

      graph = new Rickshaw.Graph( {
        element: document.querySelector("#serverload-chart"),
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

      // Morris donut chart
      Morris.Donut({
        element: 'browser-usage',
        data: [
          {label: "Chrome", value: 30},
          {label: "Safari", value: 25},
          {label: "Firefox", value: 15},
          {label: "Opera", value: 5},
          {label: "Internet Explorer", value: 10},
          {label: "Other", value: 15}
        ],
        colors: ['#00a3d8', '#2fbbe8', '#72cae7', '#d9544f', '#ffc100', '#1693A5']
      });

      $('#browser-usage').find("path[stroke='#ffffff']").attr('stroke', 'rgba(0,0,0,0)');

      //sparkline charts
      $('#projectbar1').sparkline('html', {type: 'bar', barColor: '#22beef', barWidth: 4, height: 20});
      $('#projectbar2').sparkline('html', {type: 'bar', barColor: '#cd97eb', barWidth: 4, height: 20});
      $('#projectbar3').sparkline('html', {type: 'bar', barColor: '#a2d200', barWidth: 4, height: 20});
      $('#projectbar4').sparkline('html', {type: 'bar', barColor: '#ffc100', barWidth: 4, height: 20});
      $('#projectbar5').sparkline('html', {type: 'bar', barColor: '#ff4a43', barWidth: 4, height: 20});
      $('#projectbar6').sparkline('html', {type: 'bar', barColor: '#a2d200', barWidth: 4, height: 20});

      // sortable table
      $('.table.table-sortable th.sortable').click(function() {
        var o = $(this).hasClass('sort-asc') ? 'sort-desc' : 'sort-asc';
        $('th.sortable').removeClass('sort-asc').removeClass('sort-desc');
        $(this).addClass(o);
      });

      //todo's
      $('#todolist li label').click(function() {
        $(this).toggleClass('done');
      });

      // Initialize tabDrop
      $('.tabdrop').tabdrop({text: '<i class="fa fa-th-list"></i>'});

      //load wysiwyg editor
      $('#quick-message-content').summernote({
        toolbar: [
          //['style', ['style']], // no style button
          ['style', ['bold', 'italic', 'underline', 'clear']],
          ['fontsize', ['fontsize']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['height', ['height']],
          //['insert', ['picture', 'link']], // no insert buttons
          //['table', ['table']], // no table button
          //['help', ['help']] //no help button
        ],
        height: 143   //set editable area's height
      });

      //multiselect input
      $(".chosen-select").chosen({disable_search_threshold: 10});
      
    });
      
    </script>
  </body>
</html>
      
