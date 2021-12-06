<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<c:import url="./temp/boot_head.jsp"></c:import>
	<title>KBOARD에 오신 것을 환영합니다!</title>
</head>
<body>
	<!-- navbar -->
	<c:import url="./temp/boot_nav.jsp"></c:import>
	
	
	
	<!-- main begin -->
	<div class="container py-4">

    <div class="p-5 mb-4 bg-light rounded-3">
   
      <div class="container-fluid py-2">
        <h1 class="display-5 fw-bold">환영합니다!!</h1>
        <p class="col-md-9 fs-5">다양한 소통을 중시하는 커뮤니티 사이트 KBOARD 입니다.</p>
      </div>
    </div>

    <div class="row align-items-md-stretch">
      <div class="col-md-12">
        <div class="h-100 p-5 text-white bg-dark rounded-3">
          <h2>지금 회원가입하고 1,000 포인트를 받으세요!</h2>
          <hr>
          <p>게시물을 작성하면 포인트를 드립니다.</p>
          <p>포인트를 사용하여 경험치를 획득할 수 있습니다.</p>
          <p>레벨이 오를수록 다양한 혜택이 주어집니다!</p>
          <button class="btn btn-outline-light btnJoin" type="button">회원가입하기</button>
        </div>
      </div>
    </div>


  </div>
  <!-- main end -->

<!-- footer -->  
<c:import url="./temp/footer.jsp"></c:import>  

<script type="text/javascript" src="../resources/js/member.js"></script>
</body>
</html>