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
    
    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/assert/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.request.contextPath}/assert/js/bootstrap.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="${pageContext.request.contextPath}/assert/js/clean-blog.min.js"></script>

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
	
	<script type="text/javascript">
		$(document).ready(function(){
			var title=$("#title").val()
			var contents=$("#contents").val()
			
			$("#title").keyup(function(name){
				var title = $("#title").val();

				if(title.match(/ /gi)){
					alert("공백은 입력불가")
					$("#title").val("");
				}else if(title.match(/<script>/gi)){
					alert("<script>불가")
					$("#title").val("");
				}
				
			});
			
			$("#contents").keyup(function(name){
				var contents=$("#contents").val()

				if(contents.match(/<script>/gi)){
					alert("<script>불가")
					$("#contents").val("");
				}
				
			});
			
			$("#btn").click(function(){
				var title=$("#title").val()
				var contents=$("#contents").val()
				
				if(title==""){
					$("#title").focus();
					alert("공백을입력할 수 없다.")
					return false;
				}else if(contents==""){
					$("#contents").focus();
					alert("공백을입력할 수 없다.")
					return false;
				}else{
					return true;
				}				
			});
			
		});
	</script>

</head>
<body>

<c:import url="/WEB-INF/views/import/nav.jsp"/>

    <header class="intro-header" style="background-image: url('${pageContext.request.contextPath}/assert/img/post-bg.jpg')">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                    <div class="site-heading">
                        <h1>글쓰기</h1>
                    </div>
                </div>
            </div>
        </div>
    </header>
	
	<div class="col-md-3"></div>
	
	<div class="col-md-6">
		<form method="post" action="${pageContext.request.contextPath}/board/insert">
			<table>
					<tr>
						<td>제목</td>
						<td>
							<input type="text" id="title" name="title" value="">
						</td>
					</tr>
					<tr>
						<td>내용</td>
						<td>
							<textarea id="contents" name="contents"></textarea>
						</td>
					</tr>						
			</table>
				<a href="${pageContext.request.contextPath}/post"><b>취소</b></a>
				<input id="btn" name="btn" type="submit" value="등록" class="btn-primary">
				
		</form>
		
		<hr>
	</div>
	<div class="col-md-3"></div>

	<hr>

    <c:import url="/WEB-INF/views/import/footer.jsp"/>
    
	<c:import url="/WEB-INF/views/import/modal.jsp"/>

	
</body>
</html>