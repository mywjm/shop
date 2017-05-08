<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>注册Q淘商城</title>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style1.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/regist.css">
	
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/regist.js" charset="UTF-8"></script>
  </head>
  <body>
<div class="header-area">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="user-menu">
                        <ul>
                             <li><a href="${pageContext.request.contextPath}/user_loginPage.action"><i class="glyphicon glyphicon-log-in"></i> &nbsp;&nbsp;登陆</a></li>
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
    </div>
<!-- header -->
<div class="header_bg">
<div class="wrap">
	<div class="header">
		<div class="logo">
			<a href="${pageContext.request.contextPath}/index.action"><img src="${pageContext.request.contextPath}/img/logo.png" alt=""/> </a>
		</div>
		<div class="clear"></div>
	</div>
</div>
</div>
<!-- regist-form -->

<div class="page-container">
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-offset-2 col-sm-10">
		    		 <h1 class="divleft topform">用户注册</h1>
			</div>
			<div class="col-sm-offset-2 col-sm-10">
		    		 	<font color="red" class="divleft topform"><s:actionerror/></font>
		     </div>
		</div>
		<div class="row">
			<div class="regist-content col-sm-8">
					<form class="form-horizontal" action = "${pageContext.request.contextPath}/usert_userRegist.action" method="post" id="formid"  name="form1" onsubmit="return checkUser()">
					  <div class="form-group">
					    <label for="nickname" class="col-sm-2 control-label">昵称</label>
					    <div class="col-sm-4">
					      <input type="text" name="nickname" value="<s:property value="nickname" />" class="form-control" id="nickname" placeholder="昵称" onblur="checkNickname()">
					    </div>
					    <div class="col-sm-4"> 
					    <span id="span1" class="divleft"></span>
					    <font color="red"><s:fielderror fieldName="nickname"></s:fielderror></font>
					    </div>
					    </div>
					    
					  
					   <div class="form-group">
					    <label for="Email" class="col-sm-2 control-label">Email</label>
					    <div class="col-sm-4">
					      <input type="email" name = "email" value="<s:property value="email" />" class="form-control" id="Email" placeholder="Email" onblur="checkEmail()">
					    </div>
					    <div class="col-sm-4"> 
					   	 <span id="span2" class="divleft"></span>
					   	 <font color="red"><s:fielderror fieldName="email"></s:fielderror></font>
					    </div>
					  </div>
					  
					   <div class="form-group">
					    <label for="password" class="col-sm-2 control-label">密码</label>
					    <div class="col-sm-4">
					      <input type="password" name="password" class="form-control" id="password" placeholder="密码" onblur="checkPassword()">
					    </div>
						<div class="col-sm-4"> 
					    <span id="span3" class="divleft"></span>
					    <font color="red"><s:fielderror fieldName="password"></s:fielderror></font>
					    </div>
					  </div>
					  
					   <div class="form-group">
					    <label for="repassword" class="col-sm-2 control-label">确认密码</label>
					    <div class="col-sm-4">
					      <input type="password" class="form-control" id="repassword" placeholder="确认密码" onblur="checkRepassword()">
					    </div>
					    <div class="col-sm-4"> 
					    <span id="span4" class="divleft"></span>
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label for="code" class="col-sm-2 control-label">激活码</label>
					    <div class="col-sm-4">
					      <input type="text" name="code"  class="form-control" id="code" placeholder="激活码">
					    </div>
					    <div class="col-sm-2" id="active"> 
					   <input type="button" value="获取激活码" id="btactive" class=" btn btn-default" onclick="SendEmail()">  
					    </div>
					    <div class="col-sm-2" id="active"> 
						 <span id="span6" class="divleft"> </span>
					    </div>
					  </div>
					  
					   <div class="form-group">
					    <label for="checkcode" class="col-sm-2 control-label">验证码</label>
					    <div class="col-sm-4">
					      <input type="text" name="checkcode"  class="form-control" id="checkcode" placeholder="验证码" onblur="checkCode()">
					    </div>
					    <div class="col-sm-4">
					    	 <a style= 'cursor: pointer'>
					    	<img id="checkImg" class="captchaImage divleft" src="${pageContext.request.contextPath}/checkImg.action" title="点击更换验证码" onclick="change()"/>
					    	</a>
					    	 <span id="span5" class="divleft"></span>
					    </div>
					  </div>
					   
					  <div class="form-group">
					    <div class="col-sm-offset-2 col-sm-10">
					      <button type="submit" name="sub" class="btn btn-default divleft" >注册</button>
					    </div>
					  </div>
					</form>
			</div>
			
			<div class="regist-content col-sm-4">
				
				<div class="table-responsive">
				  <table class="table  ">
				 	<tr> 
				 		<th></th><th>注册即享受</th>
				 		
				 	</tr>
				 	<tr>
				 		<td>活动时间：</td><td>2017年1月1日0时-2017年6月30日24时</td>
				 	</tr>
				 	<tr>
				 		<td>活动对象：</td><td>新注册用户</td>
				 	</tr>
				 	<tr>
				 		<td>活动形式：</td><td>用户注册成功后即可获得22元现金券。</td>
				 	</tr>
				 	<tr><td></td><td></td></tr>
				  </table>
				</div>
				<div>
				<div id="agreement" class="agreement">
					<p>注册协议</p>
					<p>尊敬的用户欢迎您注册成为本网站会员。请用户仔细阅读以下全部内容。
					如用户不同意本服务条款任意内容，请不要注册或使用本网站服务。
					如用户通过本网站注册程序，即表示用户与本网站已达成协议，自愿接受本服务条款的所有内容。
					此后，用户不得以未阅读本服务条款内容作任何形式的抗辩。</p>
				 	<p>一、本站服务条款的确认和接纳<br>本网站涉及的各项服务的所有权和运作权归本网站所有。本网站所提供的服务必须按照其发布的服务条款和操作规则严格执行。本服务条款的效力范围及于本网站的一切产品和服务，用户在享受本网站的任何服务时，应当受本服务条款的约束。</p> 
				 	<p>二、服务简介<br>本网站运用自己的操作系统通过国际互联网络为用户提供各项服务。用户必须:  1. 提供设备，如个人电脑、手机或其他上网设备。 2. 个人上网和支付与此服务有关的费用。</p> <p>三、用户在不得在本网站上发布下列违法信息<br>1. 反对宪法所确定的基本原则的； 2. 危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的； 3. 损害国家荣誉和利益的； 4. 煽动民族仇恨、民族歧视，破坏民族团结的； 5. 破坏国家宗教政策，宣扬邪教和封建迷信的； 6. 散布谣言，扰乱社会秩序，破坏社会稳定的； 7. 散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的； 8. 侮辱或者诽谤他人，侵害他人合法权益的； 9. 含有法律、行政法规禁止的其他内容的。</p> <p>四、有关个人资料<br>用户同意:  1. 提供及时、详尽及准确的个人资料。 2. 同意接收来自本网站的信息。 3. 不断更新注册资料，符合及时、详尽准确的要求。所有原始键入的资料将引用为注册资料。 4. 本网站不公开用户的姓名、地址、电子邮箱和笔名。除以下情况外:  a) 用户授权本站透露这些信息。 b) 相应的法律及程序要求本站提供用户的个人资料。</p> <p>五、服务条款的修改<br>本网站有权在必要时修改服务条款，一旦条款及服务内容产生变动，本网站将会在重要页面上提示修改内容。如果不同意所改动的内容，用户可以主动取消获得的本网站信息服务。如果用户继续享用本网站信息服务，则视为接受服务条款的变动。</p> <p>六、用户隐私制度<br>尊重用户个人隐私是本网站的一项基本政策。所以，本网站一定不会在未经合法用户授权时公开、编辑或透露其注册资料及保存在本网站中的非公开内容，除非有法律许可要求或本网站在诚信的基础上认为透露这些信息在以下四种情况是必要的:  1. 遵守有关法律规定，遵从本网站合法服务程序。 2. 保持维护本网站的商标所有权。 3. 在紧急情况下竭力维护用户个人和社会大众的隐私安全。 4. 符合其他相关的要求。</p> <p>七、用户的帐号、密码和安全性<br>用户一旦注册成功，将获得一个密码和用户名。用户需谨慎合理的保存、使用用户名和密码。如果你不保管好自己的帐号和密码安全，将负全部责任。另外，每个用户都要对其帐户中的所有活动和事件负全责。你可随时根据指示改变你的密码。用户若发现任何非法使用用户帐号或存在安全漏洞的情况，请立即通告本网站。   八、 拒绝提供担保 用户明确同意信息服务的使用由用户个人承担风险。本网站不担保服务不会受中断，对服务的及时性，安全性，出错发生都不作担保，但会在能力范围内，避免出错。</p> <p>九、有限责任<br/>如因不可抗力或其它本站无法控制的原因使本站销售系统崩溃或无法正常使用导致网上交易无法完成或丢失有关的信息、记录等本站会尽可能合理地协助处理善后事宜，并努力使客户免受经济损失，同时会尽量避免这种损害的发生。</p> <p>十、用户信息的储存和限制<br>本站有判定用户的行为是否符合国家法律法规规定及本站服务条款权利，如果用户违背本网站服务条款的规定，本网站有权中断对其提供服务的权利。</p> <p>十一、用户管理<br>用户单独承担发布内容的责任。用户对服务的使用是根据所有适用于本站的国家法律、地方法律和国际法律标准的。用户必须遵循:  1. 使用网络服务不作非法用途。 2. 不干扰或混乱网络服务。 3. 遵守所有使用网络服务的网络协议、规定、程序和惯例。 用户须承诺不传输任何非法的、骚扰性的、中伤他人的、辱骂性的、恐性的、伤害性的、庸俗的，淫秽等信息资料。另外，用户也不能传输何教唆他人构成犯罪行为的资料；不能传输助长国内不利条件和涉及国家安全的资料；不能传输任何不符合当地法规、国家法律和国际法律的资料。未经许可而非法进入其它电脑系统是禁止的。 若用户的行为不符合以上提到的服务条款，本站将作出独立判断立即取消用户服务帐号。用户需对自己在网上的行为承担法律责任。用户若在本站上散布和传播反动、色情或其它违反国家法律的信息，本站的系统记录有可能作为用户违反法律的证据。</p> <p>十二、通告<br>所有发给用户的通告都可通过重要页面的公告或电子邮件或常规的信件传送。服务条款的修改、服务变更、或其它重要事件的通告都会以此形式进行。</p> <p>十三、信息内容的所有权<br>本网站定义的信息内容包括: 文字、软件、声音、相片、录象、图表；在广告中全部内容；本网站为用户提供的其它信息。所有这些内容受版权、商标、标签和其它财产所有权法律的保护。所以，用户只能在本网站和广告商授权下才能使用这些内容，而不能擅自复制、再造这些内容、或创造与内容有关的派生产品。本站所有的文章版权归原文作者和本站共同所有，任何人需要转载本站的文章，必须征得原文作者或本站授权。</p> <p>十四、法律<br>本协议的订立、执行和解释及争议的解决均应适用中华人民共和国的法律。用户和本网站一致同意服从本网站所在地有管辖权的法院管辖。如发生本网站服务条款与中华人民共和国法律相抵触时，则这些条款将完全按法律规定重新解释，而其它条款则依旧保持对用户的约束力。</p>
				</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- footer -->
<div class="footer_bg1">
<div class="wrap">
	<div class="footer">
		<div class="copy">
			<p class="link">Copyright &copy; 2017.Q淘商城 All rights reserved.</p>
		</div>
		<div class="clear"></div>
	</div>
</div>
</div>
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