<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title> Test</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		function deleteA(){
			alert("您还没登陆，无法操作！");
		
		}
		function check() {
			var cname = document.getElementById("cname").value;
			
			if(cname == null || cname == "") {
				alert("菜单名不允许为空！");
				return false;
			}
			
		}
	
	</script>
  </head>
  
  <body>
    
  	<div>
 		<form id="form1" class="form-horizontal" enctype="multipart/form-data" action="${pageContext.request.contextPath }/Product_upload.action" method="post" >
 			<input type="hidden" name="pid" value="<s:property value = "p.pid" />" /> 
 			<div class="form-group">
		    <label for="picture" class="col-sm-2 control-label">商品图片</label>
		    <div class="col-sm-10">
		      <input type="file" name="picture"  class="form-control" id="picture" placeholder="picture" />
		     <a target="_blank" href="${pageContext.request.contextPath }/<s:property value="p.image" />"><img style="width:100px; height:100px;" alt="<s:property value="p.pname" />" src="${pageContext.request.contextPath }/<s:property value="p.image" />"></a>
		    </div>
		  </div>
		 
		   <s:if test="#session.existAdminUser != null">
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
		      <button type="submit" class="btn btn-default">修改图片</button>
		    </div>
		  </div>
		  </s:if>
		  <s:else>
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
		      <a onclick="deleteA()" class="btn btn-default">修改图片</a>
		    </div>
		  </div>
		  </s:else>
 		</form>
 		</div>
    
  </body>
</html>
