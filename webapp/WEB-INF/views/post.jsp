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

    <title>Clean Blog - Sample Post</title>

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
    
    <script type="text/javascript">
    	$(document).ready(function(){
    		$("#insert").click(function(){
    			window.location.href="board/writeForm";
    		});
    	});
    	
	    
    </script>
</head>
<body style="margin-top: 0%">


	<c:import url="/WEB-INF/views/import/nav.jsp"/>

    <!-- Page Header -->
    <!-- Set your background image for this header on the line below. -->
    <header class="intro-header" style="background-image: url('assert/img/post-bg.jpg')">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                    <div class="site-heading">
                        <h1>게시판리스트</h1>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- Post Content -->
    <article>
        <div class="container">
        	<div class="col-md-3"></div>
				<div class="col-md-6">
			    	 <table class="table table-list-search">
			                    <thead>
			                        <tr>
			                            <th>번호</th>
			                            <th>제목</th>
			                            <th>글쓴이</th>
			                            <th>조회수</th>
			                            <th>작성일</th>
			                            <th>&nbsp;</th>
			                        </tr>
			                    </thead>
		                    <c:set var="cnt" value="${fn:length(list)}"/>
		                    <c:forEach items="${list }" var = "board" varStatus="status">
			                    <tbody>
			                        <tr>
			                            <td>${cnt-status.index}</td>
			                            <td>
			                            	<a href="${pageContext.request.contextPath}/board/view?no=${board.no}">${board.title }</a>
			                            </td>
			                            <td>${board.member_name }</td>
			                            <td>${board.view_cnt }</td>
			                            <td>${board.reg_date}</td>
			                            <td>
											<c:choose>
												<c:when test="${empty authUser }"></c:when>
												<c:otherwise>			                            	
					                            	<a href="${pageContext.request.contextPath}/board/delete?no=${board.no}">
						                            	<span class="glyphicon glyphicon-list" aria-hidden="true"></span>
					                            	</a>
					                            </c:otherwise>	
			                            	</c:choose>
			                            </td>
			                        </tr>
		                    </c:forEach>    
			                    </tbody>
	                	</table>
					<c:choose>
	            	<c:when test="${empty authUser }">
	            	</c:when>
	            	<c:otherwise>    	
	                	<button id="insert" name="insert" style="float:rigth;width:538px;">글쓰기</button>
	                </c:otherwise>   
					</c:choose>
				</div>
			<div class="col-md-3"></div>           
        </div>
    </article>

	<hr>


	<c:import url="/WEB-INF/views/import/footer.jsp"/>
	<c:import url="/WEB-INF/views/import/modal.jsp"/>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
		
</body>
</html>