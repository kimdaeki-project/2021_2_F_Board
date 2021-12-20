<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<c:import url="./temp/boot_head.jsp"></c:import>
	<link href="../resources/css/index.css" rel="stylesheet" type="text/css"/>
	<title>KBOARD에 오신 것을 환영합니다!</title>
</head>
<body>
	<!-- navbar -->
	<c:import url="./temp/boot_nav.jsp"></c:import>
	
	
	
	<!-- main begin -->
	<div class="container py-4">

    <div class="p-5 mb-4 bg-light rounded-3 mainJumbo">
   
      <div class="container-fluid py-2 ">
        <h1 class="display-5 fw-bold">환영합니다!!</h1>
        <p class="col-md-9 fs-5">다양한 소통을 중시하는 커뮤니티 사이트 KBOARD 입니다.</p>
      </div>
    </div>
 <c:choose>  
   <c:when test="${not empty member}">
	    <div class="row align-items-md-stretch memo">
	      <div class="col-md-12">
	        <div class="h-100 p-5 text-white bg-dark rounded-3">
	          <h2 style="font-weight: bold;">${sessionScope.nickname} 님</h2>
	          <hr>
			  <p><span>나의 등급 : </span>
			  	<span style="font-weight: bold;">
			  	<c:choose>
                  <c:when test="${sessionScope.auth eq 1}">
                  	 <span>준회원</span>
                  </c:when>
                  <c:when test="${sessionScope.auth eq 2}">
                  	 <span>정회원</span>
                  </c:when>
                  <c:when test="${sessionScope.auth eq 3}">
                  	 <span>우수회원</span>
                  </c:when>
                  <c:when test="${sessionScope.auth eq 4}">
                  	 <span>관리자</span>
                  </c:when>
                  <c:when test="${sessionScope.auth eq 5}">
                  	 <span>마스터</span>
                  </c:when>
                  <c:otherwise>
                  	<span>정보없음</span>
                  </c:otherwise>
                </c:choose>
                </span>			
			  </p>
	          <p>최근접속일 : <span style="font-weight: bold;">${sessionScope.logtime}</span></p>
	          <p>접속횟수 : <span style="font-weight: bold;">${sessionScope.logcount}</span></p>
	         
	        </div>
	      </div>
	    </div>
	</c:when>
	<c:otherwise>
		<div class="row align-items-md-stretch memo">
	      <div class="col-md-12">
	        <div class="h-100 p-5 text-white bg-dark rounded-3">
	          <h2>지금 회원가입하세요!</h2>
	          <hr>
	          <p>게시판에서 재미를 추구하세요!</p>
	          <p>여러분의 다양한 활동이 게시판을 발전시킵니다!</p>
	          <button class="btn btn-outline-light btnJoin" type="button">회원가입하기</button>
	        </div>
	      </div>
	    </div>
	</c:otherwise>
</c:choose>

  </div>
  <!-- main end -->

<!-- footer -->  
<c:import url="./temp/footer.jsp"></c:import>  

<script type="text/javascript" src="../resources/js/index.js"></script>
</body>
</html>