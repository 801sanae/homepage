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
    
    <!-- Custom Theme JavaScript -->
    <script src="${pageContext.request.contextPath}/assert/js/clean-blog.min.js"></script>

    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/assert/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.request.contextPath}/assert/js/bootstrap.min.js"></script>
    
</head>
<body>

	<c:import url="/WEB-INF/views/import/nav.jsp"/>

    <!-- Page Header -->
    <!-- Set your background image for this header on the line below. -->
    <header class="intro-header" style="background-image: url('assert/img/main.jpg')">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                    <div class="site-heading">
                        <h1>Study Blog</h1>
                        <hr class="small">
                        <span class="subheading">SpringMVC , HTML5, Bootstrap, Jquery 공부를 이용한 홈페이지 만들기</span>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                <div class="post-preview">
                    <a href="http://getbootstrap.com/">
                        <h2 class="post-title">
                           CSS Framework인 BootStrap과 jQuery HTML5를 이용한 Front end side 적용
                        </h2>
                    </a>
                    <p class="post-meta">Posted by <a href="#">MinYoung Kim</a> on February 1, 2016</p>
                </div>
                
                <div class="post-preview">
                    <a href="http://spring.io/">
                        <h2 class="post-title">
                            Spring @MVC 를 이용한 Back end side 구성
                        </h2>
                        <h3 class="post-subtitle">
                            Maven Build Tool을 이용한 Dependency Liberery 관리
                        </h3>
                    </a>
                    <p class="post-meta">Posted by <a href="#">MinYoung Kim</a> on February 1, 2016</p>
                </div>
                
               <div class="post-preview">
                    <a href="http://blog.mybatis.org/">
                        <h2 class="post-title">
                            Database Framework인 mybatis를 이용한 persistence Layer 관리
                        </h2>
                        <h3 class="post-subtitle">
                            Spring @MVC와 mybatis를 연동
                        </h3>
                    </a>
                    <p class="post-meta">Posted by <a href="#">MinYoung Kim</a> on February 1, 2016</p>
                </div>
            </div>
        </div>
    </div>

    <hr>
    
    <c:import url="/WEB-INF/views/import/footer.jsp"/>
    
	<c:import url="/WEB-INF/views/import/modal.jsp"/>
    
</body>
</html>

