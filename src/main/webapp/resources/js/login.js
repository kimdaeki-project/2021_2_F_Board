$(function(){
	//결과 메시지 변수
	var resultMsg = document.querySelector('.resultMsg');
	//아이디 입력값 제한 replace
	$('#userid').on("blur keyup", function() {
		$(this).val($(this).val().replace(/[\s]/g,''));
	});
	//비번 입력값 제한 replace
	$('#userpw').on("blur keyup", function() {
		$(this).val($(this).val().replace(/[\s]/g,''));
	});		
	//회원가입 버튼
	 $(".btnJoin").click(function(){
	     location.href="/member/join";	           
	  });
	//메인화면
	 $(".btnMain").click(function(){
	     location.href="/";	           
	  });
	//로그인 버튼
	$("#btnLogin").click(function(){
		resultMsg.innerHTML="";
		// 입력 값 체크
		if($.trim($('#userid').val()) == ''){
			alert("아이디를 입력해 주세요.");
			$('#userid').focus();
			return;
		}else if($.trim($('#userpw').val()) == ''){
			alert("패스워드를 입력해 주세요.");
			$('#userpw').focus();
			return;
		}
		
		login();//ajax 함수 실행
	})
	
	
	
	
	
	
	// 아이디 체크 ajax 
	function login(){
		var jsonObj = {//jsonObj 생성
		        ID : $('#userid').val(),
		        PW : $('#userpw').val(),	
		};
        $.ajax({
            url:'/member/login' //Controller에서 인식할 주소
            ,async:true	// false 일 경우 동기 요청으로 변경
            ,type:'post' //POST 방식으로 전달
            ,contentType: "application/json;charset=UTF-8"
            ,data: JSON.stringify(jsonObj)
            ,dataType: 'json'           
            ,beforeSend:function(jqXHR) {}// 서버 요청 전 호출 되는 함수 return false; 일 경우 요청 중단
	    	,success:function(data) {

         	 }// 요청 완료 시  
            ,error:function(jqXHR) {}// 요청 실패.
		    ,complete:function(data) {
				console.log(data.responseText);
				if(data.responseText == "0"){
					resultMsg.innerHTML="<font color=red><font size=2>아이디 또는 비밀번호를 확인해주세요."
				}
				else if(data.responseText == "1"){
					resultMsg.innerHTML="<font color=green><font size=2>로그인 성공!"
					location.href = "../";
				} else {
					resultMsg.innerHTML="<font color=blue><font size=3>관리자 계정 로그인 성공!"
					location.href = "../";					
				}
            },
        });// ajax 종료	
    };
    
});//자바스크립트 종료