<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Navigation -->
    <nav class="navbar navbar-default navbar-custom navbar-fixed-top">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${pageContext.request.contextPath}/index">Study Web</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="${pageContext.request.contextPath}/index">Home</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/about">About</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/post">Board</a>
                    </li>
                    
                    <c:choose>
                    	<c:when test="${empty authUser }">
							<li>
								<a href="#" data-toggle="modal" data-target="#login-modal">Sign in</a>
							</li>
						</c:when>
						<c:otherwise>
						<!-- Split button -->
					<div class="btn-group">
					  <button type="button" class="btn btn-default">${authUser.name }</button>
					  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					    <span class="caret"></span>
					    <span class="sr-only">Toggle Dropdown</span>
					  </button>
						<ul class="dropdown-menu">
							<li>
								<a href="${pageContext.request.contextPath}/logout" style="color: black;">Logout</a>
							</li>
						 </ul>
					</div>
						</c:otherwise>
                    </c:choose>
                    
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>