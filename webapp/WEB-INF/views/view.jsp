<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

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
			$("#cancel").click(function(){
				window.location.href="post";
			});
		});
	</script>    
    
</head>
<body>


	<c:import url="/WEB-INF/views/import/nav.jsp"/>

<!-- Page Header -->
    <!-- Set your background image for this header on the line below. -->
    <header class="intro-header" style="background-image: url('${pageContext.request.contextPath}/assert/img/main.jpg')">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                    <div class="site-heading">
                        <h1>게시글보기</h1>
                    </div>
                </div>
            </div>
        </div>
    </header>

	<div id="container" >
		<div class="col-md-3"></div>
		<div class="col-md-6">
			<h1>글보기${board.no}</h1>
			<table border="1">
				<tr>
					<td>제목</td>
					<td>${board.title}</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>${board.contents}</td>
				</tr>
			</table>
			<a href="${pageContext.request.contextPath}/post">뒤로가기</a>
			
			<c:choose>
				<c:when test="${empty authUser }">
				</c:when>
				<c:otherwise>
					<a href="${pageContext.request.contextPath}/board/updateForm?no=${board.no}">수정하기</a>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="col-md-3"></div>
	</div>	
	
    <c:import url="/WEB-INF/views/import/footer.jsp"/>
    
	<c:import url="/WEB-INF/views/import/modal.jsp"/>	

</body>
</html>