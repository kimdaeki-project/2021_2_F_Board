<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	




<!-- 네비게이션 begin-->
<nav class="navbar navbar-expand-md navbar-light bg-light py-1 shadow-sm sticky-top" id="topMenu">
	<div class="container">
		    <a class="navbar-brand align-middle" href="../">
			    <h3 class="m-0">
			    	KBoard
			    </h3>
		    </a>
		    <!-- 작은화면일 때 드롭다운 메뉴 -->
		    <button class="navbar-toggler" type="button" 
			    data-bs-toggle="collapse" 
			    data-bs-target="#navbarSupportedContent" 
			    aria-controls="navbarSupportedContent" 
			    aria-expanded="false" 
			    aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
	    <!-- 네비게이션 ul,li begin-->
	    <div class="collapse navbar-collapse" id="navbarSupportedContent">	    
		    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">   
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
		          <a class="nav-link" href="#">관리자게시판</a>
		        </li>	 
		        <li class="nav-item">
		          <a class="nav-link" href="#">로그인</a>
		        </li>	 
		               	        
		    	<!--  <li class="nav-item dropdown">
			          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			            회원메뉴
			          </a> 
			          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
			            <li><a class="dropdown-item" href="#">로그인</a></li>
			            <li><a class="dropdown-item" href="#">회원가입</a></li>
			          </ul>
		        </li> -->
			</ul>
	  	</div>
	  	<!-- 네비게이션 ul,li end -->
	 </div>
</nav>
<!-- 네비게이션 end-->	