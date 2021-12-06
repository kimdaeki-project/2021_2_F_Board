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
		        <li class="nav-item">
		          <a class="nav-link" href="#">관리자게시판</a>
		        </li>
		    </ul>   
		    <ul class="navbar-nav ms-auto mb-0 mb-lg-0">   	 
		        <li class="nav-item">
		       	 <a class="nav-link" href="/member/login" style="color: gray; font-weight: bold;">
		       	  <img alt="login" src="/resources/images/icons/login_20px.jpg">
		          로그인</a>
		        </li>     	       
			</ul>
	  	</div>
	  	<!-- 네비게이션 top ul,li end -->
	 </div>
</nav>
<!-- 네비게이션 end-->	