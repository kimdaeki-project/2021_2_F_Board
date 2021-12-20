<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<c:import url="../temp/boot_head.jsp"></c:import>

	<link href="../resources/css/mypage.css" rel="stylesheet" type="text/css"/>
	<title>마이페이지</title>
</head>
<body>
	<!-- 네비게이션 -->
	<c:import url="../temp/boot_nav.jsp"></c:import>

	<!-- main begin -->
	
    	<!-- 본문 -->
    	
		<!-- 마이 페이지 begin -->	
		 <div class="container">
		 	<div style="padding-top: 100px;"></div>
			 <div class="row">
			  	<div class="col-md-3"></div>
			  	<div class="col-md-6">
			  		<div class="p-4 bg-light rounded-4 opacity" style="padding-top: 22px;">
			  			<div class="container">
				  			
				  				<h3 style="text-align: center;">마이페이지</h3>
				  				<hr>
				  				<div style="padding-top: 22px;">
				  					<input type="button" id="btnTerms" class="btn btn-secondary form-control" value="약관동의 수정">
				  				</div>
				  				<div style="padding-top: 5px;">
				  					<input type="button" id="btnUpdate" class="btn btn-secondary form-control" value="회원정보 수정">
				  				</div>
				  				<div style="padding-top: 5px; padding-bottom: 5px">
					  				<input type="button" id="btnDelete" class="btn btn-danger form-control" value="회원탈퇴" style="color: white">
				  				</div>
				  			
			  			</div>
			  		</div>
			  	</div>			  	
		  </div>
	  </div>
	<!-- 로그인 페이지 end -->		
	

	<!-- footer -->  
	<div style="margin-top: 300px;">
	<footer class="py-3 my-5">
	    <ul class="nav justify-content-center border-bottom pb-3 mb-3">
	      <li class="nav-item"><a href="/" class="nav-link px-2 text-muted">메인</a></li>
	      <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">공지사항</a></li>
	      <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">게시판</a></li>
	      <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">FAQ</a></li>
	      <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">이벤트</a></li>
	    </ul>
	    <p class="text-center text-muted">© 2021 KBOARD, Inc</p>
	  </footer>
	</div> 
	<script type="text/javascript" src="../resources/js/mypage.js"></script>
</body>