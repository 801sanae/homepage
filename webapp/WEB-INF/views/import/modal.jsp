<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta charset="UTF-8">

    <!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/assert/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/assert/css/clean-blog.min.css" rel="stylesheet">


<script type="text/javascript">
$(document).ready(function(){
	    
		var email=$("#email").val();
		
		if(email==" "){
			$("#email").focus();
		}
	
	    $("#signup").click(function(){
			window.location.href="user/signup";	    	
	    });
	    
	    $("#login").click(function(){
	    	
	    	var email=$("#email").val();
	    	var password=$("#password").val();
	    	alert("로그인되셧습니다.");
	    	
	    	document.loginform.action="user/login";
	    	document.loginform.summit();
	    	
	    });
	    
})
	</script>

 <!-- BEGIN # MODAL LOGIN -->
<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    	<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" align="center">
					<img class="img-circle" id="img_logo" src="${pageContext.request.contextPath}/assert/img/logo.jpg">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
					</button>
				</div>
                
<!-- Begin # Login Form -->
<form id="login-form" name="loginform">
        <div class="modal-body">
			<input id="email" name="email" class="form-control" type="text" placeholder="Username (type ERROR for error effect)" required>
			<input id="password" name="password" class="form-control" type="password" placeholder="Password" required>
    	</div>
  		<div class="modal-footer">
            <div>
                <button id="login" type="submit" class="btn btn-primary btn-lg btn-block">Login</button>
            </div>
			<div>
                <button id="signup" class="btn btn-link">Register</button>
            </div>
  		</div>
</form>
          <!-- End # Login Form -->
