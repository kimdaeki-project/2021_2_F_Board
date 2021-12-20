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
	    <!-- 서브 타이틀 -->
	    <div class="container py-1 bg-title">
	    	<span class="fs-5">약관동의</span>
	    </div>    
    	
    	<!-- 본문 form -->
    	<div class="container">
    		<div class="center">
	    		<span class="fs-6 terms_title">1. 이용약관 동의 (필수)</span>
	    		<div class="form-floating">
				  <textarea class="textBox_term" id="" readonly="readonly">${content_0}
				</textarea>
				</div>
				<div class="row">
					<span class="span-right">						
						<input class="chk form-check-input checks pilsu" type="checkbox" name="tlog_check_1" value="Y" id="chkBox_1">
						<label class="form-check-label" for="chkBox_1">(필수) 위 약관에 동의합니다.</label>
					</span>
				</div>
    		</div>
    		<div>
	    		<span class="fs-6 terms_title">2. 개인정보 수집 및 이용 동의 (필수)</span>
	    		<div class="form-floating">
				  <textarea class="textBox_term" id="" readonly="readonly">${content_1}
				</textarea>
				</div>
				<div class="row">
					<span class="span-right">
						<input class="chk form-check-input checks pilsu" type="checkbox" name="tlog_check_2" value="Y" id="chkBox_2">
						<label class="form-check-label" for="chkBox_2">(필수) 위 약관에 동의합니다.</label>
					</span>
				</div>
    		</div>
    		<div>
	    		<span class="fs-6 terms_title">3. SMS 수신 동의 (선택)</span>
	    		<div class="form-floating">
				  <textarea class="textBox_term" id="" readonly="readonly">${content_2}
				</textarea>
				</div>
				<div class="row">
					<span class="span-right">
						<input class="chk form-check-input checks" type="checkbox" name="tlog_check_3" value="Y" id="chkBox_3">
						<label class="form-check-label" for="chkBox_3">(선택) 위 약관에 동의합니다.</label>
					</span>
				</div>
    		</div>
    		<div>
	    		<span class="fs-6 terms_title">4. 이메일 수신 동의 (선택)</span>
	    		<div class="form-floating">
				  <textarea class="textBox_term" id="" readonly="readonly">${content_3}
				</textarea>
				</div>
				<div class="row">
					<span class="span-right">
						<input class="chk form-check-input checks" type="checkbox" name="tlog_check_4" value="Y" id="chkBox_4">
						<label class="form-check-label" for="chkBox_4">(선택) 위 약관에 동의합니다.</label>
					</span>
				</div>
				<hr>
				<!-- 전부 동의하기 버튼 -->
    			<div class="row">
	    			<span class="span-right span-bold">
						<input class="chk form-check-input" type="checkbox"  id="chkBox_all">
						<label class="form-check-label" for="chkBox_all">(필수, 선택) 모든 약관에 동의합니다.</label>
					</span>
    			</div>
    		</div>
    		
    	
    	<div>
		    <button type="button" class="btn btn-primary btn-center" id="joinNext">확인</button>
    	</div>
    		
    	</div>
		<!-- 본문 end -->
    
    
    </div>
	<!-- main end -->
	
	<!-- footer -->  
	<c:import url="../temp/footer.jsp"></c:import>  
	<script type="text/javascript" src="../resources/js/joinCheck.js"></script>
</body>
</html>