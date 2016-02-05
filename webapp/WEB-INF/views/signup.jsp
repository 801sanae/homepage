<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Sign in to StudyBlog</title>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

<title>Study Blog</title>
    
    <!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/assert/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/assert/css/clean-blog.min.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <link href="${pageContext.request.contextPath}/assert/css/modal.css" rel="stylesheet">
    
    <lind href="${pageContext.request.contextPath}/assert/css/jauery.vlidate.js" rel="stylesheet">
    
    <!-- Custom Theme JavaScript -->
    <script src="${pageContext.request.contextPath}/assert/js/clean-blog.min.js"></script>

    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/assert/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.request.contextPath}/assert/js/bootstrap.min.js"></script>
    
    
    <script type="text/javascript">
		$(document).ready(function(){
			
			var name = $("#name").val();
			var email = $("#email").val();
			var password = $("#password").val();
			
			$("#join").click(function(){
				var name = $("#name").val();
				var email = $("#email").val();
				var password = $("#password").val();
				
				if(name==""){
					$("#name").focus();
					alert("공백을입력할 수 없다.")
					return false;
				}else if(email==""){
					$("#email").focus();
					alert("공백을입력할 수 없다.")
					return false;
				}else if( password==""){
					$("#password").focus();
					alert("공백을입력할 수 없다.")
					return false;
				}else{
					return true;
				}				
			});
			
			$("#name").keyup(function(name){
				var name = $("#name").val();

				if(name.match(/ /gi)){
					alert("공백은 입력불가")
					$("#name").val("");
				}else if(name.match(/<script>/gi)){
					alert("<script>불가")
					$("#name").val("");
				}
				
			});
						
			$("#password").keyup(function(pwd){
				
				var pwd = $("#password").val();
				
		        if(6 > pwd.length || pwd.length > 12){
			          $('#pwdchk').html("<font color=red >6~12자리로 입력</font>");
			          $('#pwdchk').show();
			    }else if(! pwd.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/)){
			          $('#pwdchk').html("<font color=red>\문자, 숫자, 특수문자의 조합</font>");
			          $('#pwdchk').show();
			    }else{
			          $('#pwdchk').html("<font color=green>사용가능 합니다.</font>");
			          $('#pwdchk').show();
			    }
				
			});
			
			$("#email").change(function(){
				$("#emailchk").hide();
				$("#duplicate").show();
			});
			
			$("#duplicate").click(function(){
				
				var email=$("#email").val();
				
				alert(email);
				$.ajax({
					url: "${pageContext.request.contextPath}/user/chkemail",
					type:"get",
					dataType:"json",
					data:"email="+email,
					/* contentType:"application/json", */
					success:function(response){
						console.log(response);
						if(response.result=="fail"){
						console.error(response.message);
						return;
						}

						if(response.data==false){
						alert("이미 사용중인 이메일입니다.");
						$("#email").val("");
						$("#email").focus();
						return;
						}

						$("#emailchk").html("<font color=green>사용가능 합니다.</font>");
						$("#emailchk").show();

						$("#duplicate").hide();

					},
					error:function(jqXHR,status,error){
						console.error(status+":" +error);
					}
				});
			});
			
			
		});
    </script>    
</head>
<body>

	<c:import url="/WEB-INF/views/import/nav.jsp"/>
	
    <header class="intro-header" style="background-image: url('${pageContext.request.contextPath}/assert/img/delete.jpg')">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                    <div class="site-heading">
                        <h1>가입하기</h1>
                    </div>
                </div>
            </div>
        </div>
    </header>	
	
	<!-- content -->
<div class="container">
  	<h1>Study Web Enjoy!</h2>
  	<p>The best way to design, build, and ship software.</p>
				<form id="form_signup" name="form_signup" method="post" action="${pageContext.request.contextPath}/user/join">
				
				<div class="list-group">
				<table style="border: 0px">
					<tr>
						<td>
							<label class="block-label" for="name">이름</label>
						</td>	
					</tr>
					<tr>
						<td>
							<input id="name" name="name" type="text" value="">
						</td>
					</tr>
					<tr>
						<td>
							<label class="block-label" for="email">이메일</label>
						</td>	
					</tr>
					<tr>
						<td>
								<div style="float:left;">
									<input id="email" name="email" type="email" value="" class="input-block-level" placeholder="이메일">
								</div>
								<div style="float:left;">
									<input id="duplicate" type="button" value="id 중복체크">
								</div>
							<div style="float:left;">
								<td>
									<div id="emailchk" style="display:none"></div>
								</td>
							</div>								
						</td>
					</tr>
					<tr>
						<td>
							<label class="block-label">패스워드</label>
						</td>	
					</tr>
					<tr>
							<div style="float:left;">
								<td>
									<input id="password" name="password" type="password" value="" class="input-block-level" placeholder="비밀번호">
								</td>
							</div>
							<div style="float:left;">
								<td>
									<div id="pwdchk" style="display:none"></div>
								</td>
							</div>
					</tr>
					<tr>
						<td>
							<label class="block-label">성별</label>
						</td>	
					</tr>
					<tr>
						<td>
							<label>여</label> <input type="radio" name="gender" value="female" checked="checked">
							<label>남</label> <input type="radio" name="gender" value="male">
						</td>
					</tr>
				</table>
				
					<fieldset>
						<legend>약관동의</legend>
						<input id="agree-prov" type="checkbox" name="agreeProv" value="y" checked="checked">
						<label>서비스 약관에 동의합니다.</label>
					</fieldset>
					
					<input id="join" type="submit" value="가입하기">
					</div>
				</form>

    <hr>
    
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                    <p class="copyright text-muted">Copyright &copy; Your Website 2014</p>
                </div>
            </div>
        </div>
    </footer>
    
	<c:import url="/WEB-INF/views/import/modal.jsp"/>
    
</body>
</html>