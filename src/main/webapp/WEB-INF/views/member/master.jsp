<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<c:import url="../temp/boot_head.jsp"></c:import>

	<link href="../resources/css/join.css" rel="stylesheet" type="text/css"/>
	<title>관리자 페이지</title>
</head>


<body>
	<!-- 네비게이션 -->
	<c:import url="../temp/boot_nav.jsp"></c:import>

	<!-- main begin -->
	<!-- 컨테이너 -->
	<div class="container py-4">
		<!-- 메인 타이틀 -->
	    <header class="pb-2 mb-4 border-bottom">   
	        <span class="fs-4">관리자 페이지</span>
	    </header>
	</div>   
    	<!-- 본문 -->
	            <div class="" style="width:1600px; margin-left: 50px;">   
                       <!-- 회원정보 begin -->
                       <c:choose>
					    <c:when test="${list eq null}">
						회원정보 없음					        
					    </c:when>
					    
					    <c:otherwise>		    
						    <div class="row">  							        
		                            <table class="table" >
									  <thead>
									    <tr align="center">
									      <th scope="col" width="55px;">번호</th>
									      <th scope="col" width="150px;">아이디</th>
									      <th scope="col" width="130px;">닉네임</th>
									      <th scope="col" width="230px;">이메일</th>	
									      <th scope="col" width="80px;">상태</th>
									      <th scope="col" width="80px;">인증</th>
									      <th scope="col" width="150px;">접근레벨</th>	      
									      <th scope="col" width="200px;">가입일</th>
									      <th scope="col" width="200px;">최근접속일</th>
									      <th scope="col" width="200px;">비번변경일</th>    
									      <th scope="col">접속횟수</th>
									    </tr>
									  </thead>
									  
									  <tbody>
									  	<c:forEach var="row" items="${list}" varStatus="i">
							                <tr align="center">
							                    <td style="vertical-align: middle;">${row.mem_idx}</td>
							                    <td style="vertical-align: middle;">${row.mem_userid}</td>
							                    <td style="vertical-align: middle;">${row.mem_nickname}</td>
							                    <td style="vertical-align: middle;">${row.mem_email}</td>
							                    <td style="vertical-align: middle;">
								                    <c:choose>
									                    <c:when test="${row.mem_status eq 'Y'}">
									                    	 <span>회원</span>
									                    </c:when>
									                    <c:when test="${row.mem_status eq 'N'}">
									                    	 <span>탈퇴</span>
									                    </c:when>
									                    <c:otherwise>
									                    	<span>접근거부</span>
									                    </c:otherwise>
								                    </c:choose>			                  
							                    </td>
							                    
							                    <td style="vertical-align: middle;">
								                    <c:choose>
									                    <c:when test="${row.mem_cert eq 'Y'}">
									                    	 <span>인증</span>
									                    </c:when>
									                    <c:otherwise>
									                    	<span>미인증</span>
									                    </c:otherwise>
								                    </c:choose>			                  
							                    </td>
							                    
							                    <td style="vertical-align: middle;">
								                    <c:choose>
									                    <c:when test="${row.mem_auth eq 1}">
									                    	 <span>준회원</span>
									                    </c:when>
									                    <c:when test="${row.mem_auth eq 2}">
									                    	 <span>정회원</span>
									                    </c:when>
									                    <c:when test="${row.mem_auth eq 3}">
									                    	 <span>우수회원</span>
									                    </c:when>
									                    <c:when test="${row.mem_auth eq 4}">
									                    	 <span>관리자</span>
									                    </c:when>
									                    <c:when test="${row.mem_auth eq 5}">
									                    	 <span>마스터</span>
									                    </c:when>
									                    <c:otherwise>
									                    	<span>정보없음</span>
									                    </c:otherwise>
								                    </c:choose>			                  
							                    </td>							                   
							                    <td style="vertical-align: middle;">${row.mem_regtime}</td>
							           			<td style="vertical-align: middle;">${row.mem_logtime}</td>
							           			<td style="vertical-align: middle;">${row.mem_pwtime}</td>
							                    <td style="vertical-align: middle;"><fmt:formatNumber value="${row.mem_logcount}" pattern="#,###,###" /></td>
							                   
				
							                </tr>
							            </c:forEach>
							 
									  </tbody>
									</table>
	                        </div>						       
					    </c:otherwise>
					</c:choose> 
	            </div>

   
	<!-- main end -->
	
	<!-- footer -->  
	<c:import url="../temp/footer.jsp"></c:import>  
	<script type="text/javascript" src="../resources/js/master.js"></script>
</body>