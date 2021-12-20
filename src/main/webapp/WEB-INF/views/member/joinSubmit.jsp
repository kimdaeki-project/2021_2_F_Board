<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<c:import url="../temp/boot_head.jsp"></c:import>

	<link href="../resources/css/join.css" rel="stylesheet" type="text/css"/>
	<title>회원가입</title>
</head>
<body>
	<!-- 네비게이션 -->
	<c:import url="../temp/boot_nav.jsp"></c:import>

	<!-- main begin -->
	<!-- 컨테이너 -->
	<div class="container py-4">
		<!-- 메인 타이틀 -->
	    <header class="pb-2 mb-4 border-bottom">   
	        <span class="fs-4">회원가입</span>
	    </header>
    	
    	<!-- 본문 -->
    	<div class="container">
    		<div class="center">
    			<h3 class="completeMsg">가입이 완료 되었습니다!</h3>
    			<h5 class="completeMsg2">로그인하여 자유롭게 활동하세요!</h5>
    			<div class="row">
	    			<img class="dog" alt="dog" src="../resources/images/index/main_pug.jpg">
    			</div>
    			<div class="row" style="margin-top: 10px;">
	    			<button type="button" id="btnMain" class="btn btn-danger btn-center inline" style="width: 100px;">메인으로</button>
    				<button type="button" id="btnLogin" class="btn btn-primary btn-center inline" style="width: 100px;">로그인</button>
    			</div>
    		</div>
    			
    	</div>
		<!-- 본문 end -->
    
    
    </div>
	<!-- main end -->
	
	<!-- footer -->  
	<c:import url="../temp/footer.jsp"></c:import>  
	<script type="text/javascript" src="../resources/js/joinSubmit.js"></script>
</body>
</html>