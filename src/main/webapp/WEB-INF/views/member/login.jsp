<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<c:import url="../temp/boot_head.jsp"></c:import>
		<title>로그인</title>
	</head>
	
	<body>
	<!-- 네비게이션 -->
		<c:import url="../temp/boot_nav.jsp"></c:import>
		
	<!-- 로그인 페이지 begin -->	
		 <div class="container">
		 	<div style="padding-top: 50px;"></div>
			 <div class="row">
			  	<div class="col-md-3"></div>
			  	<div class="col-md-6">
			  		<div class="p-4 bg-light rounded-4" style="padding-top: 22px;">
			  			<div class="container">
				  			<form method="post" action="login.jsp">
				  				<h3 style="text-align: center;">로 그 인</h3>
				  				<hr>
				  				<div class="form-group">
				  					<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="10">
				  				</div>
				  				<div class="form-group" style="padding-top: 3px;">
				  					<input type="password" class="form-control" placeholder="비밀번호" name="userPW" maxlength="10">
				  				</div>
				  				<div style="padding-top: 22px;">
				  					<input type="submit" class="btn btn-primary form-control" value="로그인">
				  				</div>
				  				<div style="padding-top: 5px; padding-bottom: 50px">
					  				<input type="button" class="btn btn-info form-control btnJoin" value="회원가입" style="color: white">
				  				</div>
				  			</form>
			  			</div>
			  		</div>
			  	</div>
			  	<div class="col-md-3"></div>
		  </div>
	  </div>
	<!-- 로그인 페이지 end -->		
		

	<!-- footer -->  
	<c:import url="../temp/footer.jsp"></c:import>  
	
	<script type="text/javascript" src="../resources/js/member.js"></script>
	
	</body>
</html>