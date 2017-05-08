 	function checkNickname(){
		// 获得文件框值:
		var nickname1 = document.getElementById("nickname");
		var nickname = nickname1.value;
		if(nickname == null || nickname==''){
			
			document.getElementById("span1").innerHTML="昵称不能为空!";
			return false;
		}
		var nick = /^([\u4E00-\uFA29]|[\uE7C7-\uE7F3]|[a-zA-Z0-9]|[._]){1,5}$/;
		if(!nick.exec(nickname)) {
			document.getElementById("span1").innerHTML="昵称限1-5个字符";
			
			return false;
		}
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
		xhr.open("GET","${pageContext.request.contextPath}/user_findByName.action?time="+new Date().getTime()+"&nickname="+nickname,true);
		// 4.发送
		xhr.send(null);
	}
 	
 	function checkByEmail(email) {
 		// 1.创建异步交互对象
		var xhr = createXmlHttp();
		// 2.设置监听
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4){
				if(xhr.status == 200){
					document.getElementById("span2").innerHTML = xhr.responseText;
				}
			}
		};
		// 3.打开连接
		xhr.open("GET","${pageContext.request.contextPath}/user_checkEmail.action?time="+new Date().getTime()+"&email="+email,true);
		// 4.发送
		xhr.send(null);
 		
 	}
 	//发送激活码
 	function SendEmail() {
 		var email = document.getElementById("Email").value;
 		if(email == null || email == "") {
 			alert("请先输入邮箱信息");
 			return false;
 		}
 		showtime(30);
 		// 1.创建异步交互对象
		var xhr = createXmlHttp();
		// 2.设置监听
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4){
				if(xhr.status == 200){
					document.getElementById("span6").innerHTML = xhr.responseText;
				}
			}
		};
		// 3.打开连接
		xhr.open("GET","${pageContext.request.contextPath}/user_sendActive.action?time="+new Date().getTime()+"&email="+email,true);
		// 4.发送
		xhr.send(null);
 		
 	}
 	function showtime(t){
 		document.getElementById("btactive").disabled=true;
 		for(i=1;i<=t;i++) {
 			window.setTimeout("update_p(" + i + ","+t+")", i * 1000);
 		}

 	}

 	function update_p(num,t) {
 		if(num == t) {
 			document.getElementById("btactive").value =" 重新发送 ";
 			document.getElementById("btactive").disabled=false;
 		}
 		else {
 			printnr = t-num;
 			document.getElementById("btactive").value = " (" + printnr +")秒后重新发送";
 		}
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
	
	function change(){
		var img1 = document.getElementById("checkImg");
		img1.src="${pageContext.request.contextPath}/checkImg.action?time="+new Date().getTime();
	}
  	//提交表单时验证
  	function checkUser(){
	   var nickname = document.getElementById("nickname").value;
	   var password = document.getElementById("password").value;
	   var email = document.getElementById("Email").value;
	   var code = document.getElementById("code").value;
	   if(nickname == "" || nickname == null  ){
	     alert("昵称不能为空");
	     return false;
	   }
	   if(password == "" || password == null  ){
	    alert("密码不能为空");
	     return false;
	   }
	    if(email == "" || email == null ){
	    alert("email不能为空");
	     return false;
	   }
	    if(code == "" || code == null ){
		    alert("激活码不能为空！");
		     return false;
		   }
	   //对电子邮件的验证
		  var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
		  if(!myreg.test(email))
		  {
		   alert('请输入有效的E_mail');
		  
		    return false;
		  }
	   // 校验确认密码:
		var repassword = document.getElementById("repassword").value;
		if(repassword != password){
			alert("两次密码输入不一致!");
			return false;
		}
	}
	
	//校验
  	function checkPassword() {
	   var password1 = document.getElementById("password");
	   var password = password1.value;
//	   var regStr = "/^([A-Z]|[a-z]|[0-9]|[`~!@#$%^&*()+=|{}':;',\\\\[\\\\].<>/?~！@#￥%……&*（）——+|{}【】‘；：”“’。，、？]){6,20}$/";
	   
	   if(password == "" || password == null  ){
	   	document.getElementById("span3").innerHTML="密码不能为空";
	   
	     return false;
	   }else{
	   	document.getElementById("span3").innerHTML="";
	   }
	   var patrn=/^(\w){6,20}$/;  
	   if (!patrn.exec(password)) {
		   document.getElementById("span3").innerHTML="密码6-20 位，字母、数字、字符";
		 
		   return false;
	   }
  	}
  	function checkRepassword() {
  		// 校验确认密码:
		var repassword1 = document.getElementById("repassword");
		var repassword = repassword1.value;
		var password = document.getElementById("password").value;
		if(repassword != password){
			document.getElementById("span4").innerHTML="两次密码输入不一致!";
			/* alert("两次密码输入不一致!"); */
			return false;
		}else{
			document.getElementById("span4").innerHTML="";
		}
		
  	}
  	function checkEmail() {
  		 var email1 = document.getElementById("Email");
  		 var email = email1.value;
  		if(email == "" || email == null ){
		   document.getElementById("span2").innerHTML="email不能为空";
		  /* alert("email不能为空"); */
		   
		     return false;
		   }else{
		   		document.getElementById("span2").innerHTML="";
		   }
 		
 		//对电子邮件的验证
		  var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
		  if(!myreg.exec(email))
		  {
		  document.getElementById("span2").innerHTML="请输入有效的E_mail";
		 /*  alert("请输入有效的E_mail"); */
		  
		    return false;
		  }else{
		  	document.getElementById("span2").innerHTML="";
		  }
		  this.checkByEmail(email);
  	}
  	//验证码
  	function checkCode() {
  		 var checkcode1 = document.getElementById("checkcode");
  		 var checkcode = checkcode1.value;
  		if(checkcode == "" || checkcode == null ){
		   document.getElementById("span5").innerHTML="&nbsp;&nbsp;请输入验证码";
		   
		     return false;
		   }else{
		   		document.getElementById("span5").innerHTML="";
		   }
  		
  	}
  	