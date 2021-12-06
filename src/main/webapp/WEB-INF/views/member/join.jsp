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
	<div class="container py-4">
	    <header class="pb-2 mb-4 border-bottom">   
	        <span class="fs-4">회원가입</span>
	    </header>
	    <div class="container py-1">
	    	<span class="fs-5">약관동의</span>
	    </div>
	    
    	<br>
    	
    	<div class="container">
    		<div class="center">
	    		<span class="fs-6 terms_title">1. 이용약관 동의</span>
	    		<div class="form-floating">
				  <textarea class="textBox_term" id="" readonly="readonly">${content_0}
				</textarea>
				</div>
    		</div>
    		<div>
	    		<span class="fs-6 terms_title">2. 개인정보 수집 및 이용 동의</span>
	    		<div class="form-floating">
				  <textarea class="textBox_term" id="" readonly="readonly">${content_1}
				</textarea>
				</div>
    		</div>
    		<div>
	    		<span class="fs-6 terms_title">3. SMS 수신 동의</span>
	    		<div class="form-floating">
				  <textarea class="textBox_term" id="" readonly="readonly">${content_2}
				</textarea>
				</div>
    		</div>
    		<div>
	    		<span class="fs-6 terms_title">4. 이메일 수신 동의</span>
	    		<div class="form-floating">
				  <textarea class="textBox_term" id="" readonly="readonly">${content_3}
				</textarea>
				</div>
    		</div>
    		
    		
    	</div>

    
    
    </div>
	<!-- main end -->
	
	<!-- footer -->  
	<c:import url="../temp/footer.jsp"></c:import>  
	<script type="text/javascript" src="../resources/js/member.js"></script>
</body>
</html>