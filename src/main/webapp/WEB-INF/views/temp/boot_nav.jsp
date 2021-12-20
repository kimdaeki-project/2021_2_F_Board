<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	


<!-- top 네비게이션 top begin-->
<nav class="navbar navbar-expand-md navbar-light bg-light py-1 shadow-sm sticky-top" id="topMenu">
	<div class="container">
		<div class="navbar-header active">
	            <a class="navbar-brand" href="/">
				<img alt="logo" src="/resources/images/logo/logo.png">
				</a>
	        </div>
        
		    <!-- 작은화면일 때 드롭다운 메뉴 -->
		    <button class="navbar-toggler" type="button" 
			    data-bs-toggle="collapse" 
			    data-bs-target="#navbarSupportedContent" 
			    aria-controls="navbarSupportedContent" 
			    aria-expanded="false" 
			    aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		    

	    <!-- 네비게이션 ul,li begin -->
	    <div class="collapse navbar-collapse" id="navbarSupportedContent">	    
		    <ul class="navbar-nav mb-0 mb-lg-0">   
		        <li class="nav-item">
		          <a class="nav-link" href="#">공지사항</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="#">게시판</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="#">FAQ</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="#">이벤트</a>
		        </li>
				<c:if test="${sessionScope.master eq 'Y'}">
			        <li class="nav-item">
			          <a class="nav-link" href="${pageContext.request.contextPath}/member/master" style="color: blue;">관리자게시판</a>
			        </li>
			    </c:if>        
		    </ul>
		    <c:choose>  
        		<c:when test="${not empty member}">
        			<ul class="navbar-nav ms-auto mb-0 mb-lg-0">
	        			<li class="nav-item dropdown">
				          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
				            <span style="color: black; font-weight: bold;">${sessionScope.nickname}</span><span style="margin-left: 3px;">님</span>
				          </a>	
	        				<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
			        			<li><a class="dropdown-item" href="${pageContext.request.contextPath}/member/mypage">마이페이지</a></li>
				           	 	<li><a class="dropdown-item" href="${pageContext.request.contextPath}/member/logout">
				            	<img alt="logout" src="/resources/images/icons/logout2_20px.png">로그아웃</a></li>            
				        	</ul> 
				        </li>
			        </ul>   	
        		</c:when>
        		<c:otherwise>
        			<ul class="navbar-nav ms-auto mb-0 mb-lg-0">  
				        <li class="nav-item">
				       	 <a class="nav-link" href="${pageContext.request.contextPath}/member/login" style="color: gray; font-weight: bold;">
				       	  <img alt="login" src="/resources/images/icons/login_20px.jpg">
				          로그인</a> 
				        </li>
			        </ul>        
        		</c:otherwise>
        	</c:choose>   
	  	</div>
	  	<!-- 네비게이션 top ul,li end -->
	 </div>
</nav>
<!-- 네비게이션 end-->	