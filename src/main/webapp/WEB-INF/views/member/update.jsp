<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<c:import url="../temp/boot_head.jsp"></c:import>

	<link href="../resources/css/join.css" rel="stylesheet" type="text/css"/>
	<title>회원정보 수정</title>
</head>


<body>
	<!-- 네비게이션 -->
	<c:import url="../temp/boot_nav.jsp"></c:import>

	<!-- main begin -->
	<!-- 컨테이너 -->
	<div class="container py-4">
		<!-- 메인 타이틀 -->
	    <header class="pb-2 mb-4 border-bottom">   
	        <span class="fs-4">회원정보 수정</span>
	    </header>
	    <!-- 서브 타이틀 -->
	    <div class="container py-1 bg-title">
	    	<span class="fs-5">필수 입력 사항</span>
	    </div>    
    	
    	<!-- 본문 -->
    <form action="../member/update" method="post" id="submitJoin">
    	<div class="container">
    		<div class="center">
    			<!-- 필수 입력 사항 -->
    			<!----------------- 아이디 ------------------->
			<!-- 	<div class="mb-3">
					<label class="form-check-label block" for="userid">아이디</label>
					<input class="form-control js-input" type="text" name="mem_userid" id="userid" required="required" placeholder="6~20자 영문,숫자만" maxlength="20" style="width: 300px;">
					<span class="idResult errorMsg"></span>
				</div> -->
				
				<!----------------- 비번1 ------------------->
				<div class="mb-3">						
					<label class="form-check-label" for="userpw">패스워드</label>
					<input class="form-control js-input" type="password" name="mem_userpw" id="userpw" required="required" placeholder="6~20자 영문, 숫자, 특문 혼합" maxlength="20" style="width: 300px;">					
					<span class="pwResult errorMsg"></span>
				</div>
				
				<!----------------- 비번2 ------------------->
				<div class="mb-3">			
					<label class="form-check-label" for="userpw_2">패스워드 확인</label>
					<input class="form-control js-input" type="password" name="mem_userpw_2" id="userpw_2" required="required" placeholder="패스워드 재입력" maxlength="20" style="width: 300px;" disabled="disabled">					
					<span class="pwResult_2 errorMsg"></span>
				</div>
				
				<!----------------- 이름 ------------------->
				<div class="mb-3">
					<label class="form-check-label" for="username">이름</label>
					<input class="form-control js-input" type="text" name="mem_username" id="username" required="required" placeholder="한글만 입력" style="width: 180px;" maxlength="10" value="${vo.mem_username}">	
					<span class="usernameResult errorMsg"></span>
				</div>
				
				<!-----------------닉네임 ------------------->
				<div class="mb-3">
					<label class="form-check-label block" for="nickname">닉네임</label>
					<input class="form-control js-input inline" type="text" name="mem_nickname" id="nickname" required="required" placeholder="한글 모음, 특문 x" style="width: 180px;" value="${vo.mem_nickname}">	
					<span id="count" style="font-size: 12px;">0</span>/<span id="max-count" style="font-size: 12px;">0</span><span style="font-size: 12px;">바이트</span>
					<div><span class="nicknameResult errorMsg"></span></div>
				</div>
				<!----------------- 성별 ------------------->
				<div class="mb-3">
					<label class="form-check-label block">성별</label>
					<input class="form-check-input" type="radio" value="M" name="mem_gender" id="gender1"><label class="label-margin" for="gender1" style="font-size: 14px;">남성</label>
					<input class="form-check-input" type="radio" value="F" name="mem_gender" id="gender2"><label class="label-margin" for="gender2" style="font-size: 14px;">여성</label>
					<input class="form-check-input" type="radio" value="U" name="mem_gender" id="gender3" checked="checked"><label class="label-margin" for="gender3" style="font-size: 14px;">선택안함</label>
				</div>
				
				<!----------------- 이메일 ------------------->
				<div class="mb-3">						
					<label class="form-check-label" for="email">이메일</label><br>
					<input class="form-control js-input" type="text" name="mem_email_1" id="email" required="required" placeholder="이메일 계정 입력" maxlength="30" style="width: 200px; display: inline; margin-bottom: 3px;" value="${vo.mem_email}">
					
						<span class="bold">@</span>
						
					<!-- 상단의 select box에서 '직접입력'을 선택하면 나타날 인풋박스 -->
					<input class="form-control js-input" type="text" id="selectDirect" name="selectDirect" placeholder="도메인 주소" style="width: 150px; display: inline;"/>		
					
					<select class="form-select js-select" name="mem_email_2" id="email_2" style="width: 140px; display: inline;">
						<option value="" selected="selected" hidden="hidden">주소선택</option>
						<option value="naver.com">naver.com</option>
					    <option value="gmail.com">gmail.com</option>
					    <option value="hanmail.net">hanmail.net</option>
					    <option value="hotmail.com">hotmail.com</option>
					    <option value="nate.com">nate.com</option>
						<option value="direct">직접입력</option><!-- 자바스크립트 처리 -->
					</select>
					<div><span class="emailResult errorMsg"></span></div>
					<!-- 이메일 문자를 합쳐서 보낼 히든 태그 -->
					<input class="form-control js-input" type="text" value="" readonly="readonly" name="mem_email" id="emailFinal" maxlength="30" hidden="hidden">
				</div>

				
				<hr class="pilsu-end">
				
				
				
				<!-- 선택 입력 사항 -->
				<div class="container bg-title pb-2 margin-top">
			    	<span class="fs-5">선택 입력 사항</span>
			    </div>   
			    
			    
			    <!----------------- 생년월일 ------------------->
				<div class="mb-3 select-box10">
					<label class="form-check-label block" for="yy">생년월일</label>
					<select name="yy" id="year" title="년" disabled="disabled"></select>
					<select name="mm" id="month" title="월" disabled="disabled"></select>
					<select name="dd" id="day" title="일" disabled="disabled"></select>
					<!-- 생일 히든 태그 submit -->
					<input type="text" id="birth" name="mem_birth" readonly="readonly" value="" hidden="">
					
					<input class="form-check-input" type="radio" id="birth_radio_1" name="birth_radio" value="Y" style="margin-left: 30px;">
					<label class="label-margin" for="birth_radio_1" style="font-size: 14px;">선택</label>
					<input class="form-check-input" type="radio" id="birth_radio_2" name="birth_radio" value="N" checked="checked">
					<label class="label-margin" for="birth_radio_2" style="font-size: 14px;">선택안함</label>
				</div>
				
				<!------------------ 연락처 ---------------------->
				<div class="mb-3">
					<label class="form-check-label block" for="telInput">연락처</label>
					<input
						  type="tel"
						  class="form-control m-input"
						  name="mem_tel"
						  id="telInput"
						  required
						  pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}"
						  maxlength="13"
						  placeholder="예) 010-1234-5678"
						  style="width: 40%;"
					/>				
				</div>
				
				<!------------------ 주소 ---------------------->
				<div class="mb-3">
					<!-- 우편번호 -->
					<label class="form-check-label block" for="zipcode">주소</label>
					<input type="tel" class="form-control bg-white" name="mem_zipcode" id="zipcode" readonly="readonly" maxlength="6" style="width: 100px; display: inline;" placeholder="우편번호">
					<button class="btn btn-secondary" type="button" id="btnApi" style="margin-left: 2px;">찾기</button>
					<!-- 주소1 -->
					<div>
						<input class="form-control bg-white" type="text" name="mem_address_1" id="address_1" style="margin-top: 5px; width: 60%" readonly="readonly" placeholder="">	
					</div>
					<!-- 주소2 -->
					<div>
						<input class="form-control" type="text" name="mem_address_2" id="address_2" style="margin-top: 5px; width: 60%" placeholder="상세주소 입력">	
					</div>
				</div>
				<!-- 약관동의 숨김 -->
				<input type="text" value="${vo_1}" name="tlog_check_1" readonly="readonly" hidden="true">
	    		<input type="text" value="${vo_2}" name="tlog_check_2" readonly="readonly" hidden="true">
	    		<input type="text" value="${vo_3}" name="tlog_check_3" readonly="readonly" hidden="true">
	    		<input type="text" value="${vo_4}" name="tlog_check_4" readonly="readonly" hidden="true">
					
				
    		</div>
			
			
			<hr style="margin-top: 70px;">
			<!-- 회원가입 버튼 -->	
	    	<div style="margin-top: 70px;">
	    		<button type="button" class="btn btn-primary btn-center-large" id="btnJoin" disabled="disabled">회원가입</button>
	    	</div>
	    	
    		<!-- 테스트 버튼 -->
    		<!-- <button type="button" id="btnTest">생년월일 테스트</button> -->
    	</div>
		<!-- 본문 end -->
	</form>
    
    
    </div>
	<!-- main end -->
	
	<!-- footer -->  
	<c:import url="../temp/footer.jsp"></c:import>  
	<script type="text/javascript" src="../resources/js/update.js"></script>
</body>
</html>