<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>GuestBook</title>

    <!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/assert/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/assert/css/clean-blog.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='http://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <link href="${pageContext.request.contextPath}/assert/css/modal.css" rel="stylesheet">
	
	<!-- jQuery -->
    <script src="${pageContext.request.contextPath}/assert/js/jquery.js"></script>

	<script type="text/javascript">
		$(document).ready(function(){
			var name=$("#name").val();
			var content=$("#content").val();
			
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
			
			$("#content").keyup(function(content){
				var content=$("#content").val()

				if(content.match(/<script>/gi)){
					alert("<script>불가")
					$("#content").val("");
				}
				
			});		
		});
	</script>
	
</head>
<body>

   	<c:import url="/WEB-INF/views/import/nav.jsp"/>

    <!-- Page Header -->
    <!-- Set your background image for this header on the line below. -->
    <header class="intro-header" style="background-image: url('assert/img/itsme.jpg')">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                    <div class="page-heading">
                        <h1>About Me</h1>
                        <hr class="small">
                        <span class="subheading">This is who am I.</span>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                <div id="content">
					<div id="guestbook">
						<form action="${pageContext.request.contextPath}/guestbook/insert" method="post">
							<table>
								<tr>
									<td>이름</td>
									<td><input type="text" id="name" name="name" value="${sessionScope.authUser.name}" ></td>
									<td>비밀번호</td>
									<td><input type="password" name="password"></td>
								</tr>
								<tr>
									<td colspan=4><textarea name="content" id="content"></textarea></td>
								</tr>
								<tr>
									<td colspan=4 align=right><input type="submit" VALUE=" 확인 "></td>
								</tr>
							</table>
						</form>
		
						<c:set var="count" value="${fn:length(list)}" />
						<c:forEach items="${list }" var="vo" varStatus="status">
							<br>
							<table width=510 border=1>
								<tr>
									<td>${count-status.index }</td>
									<td>${vo.name}</td>
									<td>${vo.reg_date}</td>
									<td><a href="${pageContext.request.contextPath}/guestbook/form?no=${vo.no}">삭제</a></td>
								</tr>
								<tr>
									<!-- <td colspan=4><!%=vo.getMessage().replaceAll("\n", "<br/>") %></td> -->
									<td colspan=4>${fn:replace(vo.message, newLine, "<br />")}</td>
								</tr>
							</table>
						</c:forEach>
		
					</div>
		</div>
            </div>
        </div>
    </div>

    <hr>

	<c:import url="/WEB-INF/views/import/footer.jsp"/>
	
	<c:import url="/WEB-INF/views/import/modal.jsp"/>

 <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.request.contextPath}/assert/js/bootstrap.min.js"></script>
    
</body>
</html>