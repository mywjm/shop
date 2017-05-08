
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
            	<form action="" method="post" id="search">
              	<input type="text" placeholder="Search..."><i class="fa fa-search" onclick="search()"></i> 
          		</form>
            </div>
            <!-- Search end -->

            <!-- Quick Actions -->
            <ul class="nav navbar-nav quick-actions">
              
              <li class="dropdown divided">
                
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
                <div class="profile-photo">
                  <img src="assets/images/profile-photo.jpg" alt="" />
                </div>
                <a class="dropdown-toggle options" data-toggle="dropdown" href="#">
                  <s:property value="#session.existAdminUser.username" /> <i class="fa fa-caret-down"></i>
                </a>
                
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
        