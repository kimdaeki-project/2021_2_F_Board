$(function(){
	var backControl = function(callbackFunction) {
      //window 내 mouse 위치 여부를 체크하기 위한 변수 
      window.innerDoc = false; 		
      //mouseover Event Listener 
      window.addEventListener('mouseover', function(event) {    
          window.innerDoc = true;
      }); 
      // mouseout Event Listener 
      window.addEventListener('mouseout', function(event) {                
          window.innerDoc = false;
      });
      // 바로 이전 페이지로 이동하는 것을 막기위해 history State 추가 
      history.pushState({page:"first"},  document.title, location.pathname + '#first');
      
      //popstate Event Listener 
      window.addEventListener('popstate', function(event) { 
	  // history State 추가하여 페이지 이동 막음 (뒤로가기 막기)
	  history.pushState({page:"historyChanged"},  document.title, location.pathname + '#changed');	
	
	  // window 영역 밖에서 history가 변경 됐을경우 callbackFunction 실행 ( 뒤로가기 버튼 등 )  
	  // 이전 POST 페이지에 정상적으로 데이터 재전송하여 SUBMIT 등 수행
	  if (!window.innerDoc) { 
	      callbackFunction();
	  } 
       });  
	}
	// window 영역 밖의 핸들링 되지 않은 버튼으로 history 변경 이동했을 경우 실행할 Function
	var callbackFunction = function() {
		// document.referrer 등 체크하여 이전 POST 페이지로 정상 이동 할 수 있도록 데이터 생성 및 추가 및 submit
		// window 내 버튼 등을 통한 이동 외에 페이지 이동 불가 alret 안내 등 처리 
	}
	//스크립트 실행
	backControl(callbackFunction);


  //	1. 회원가입 버튼 활성화 변수
	var pass_1 = 0;	//아이디
	var pass_2 = 0;	//비번
	var pass_3 = 0;	//비번확인
	var pass_4 = 0;	//이름
	var pass_5 = 0;	//닉네임
	var pass_6 = 0;	//이메일
	var pass_7 = 0; //이메일 도메인
	var domain = "";	//이메일 계정과 합칠 문자형 변수
	//공통 인풋상자
	const inputBox = document.querySelector('.js-input');
	const selectBox = document.querySelector('.js-select');
	//회원가입 버튼 활성화 함수
	function activateBtn(){
		console.log("activateBtn pass_1 : "+pass_1);
		console.log("activateBtn pass_2 : "+pass_2);
		console.log("activateBtn pass_3 : "+pass_3);
		console.log("activateBtn pass_4 : "+pass_4);
		console.log("activateBtn pass_5 : "+pass_5);
		console.log("activateBtn pass_6 : "+pass_6);
		console.log("activateBtn pass_7 : "+pass_7);
		
		if(pass_1+pass_2+pass_3+pass_4+pass_5+pass_6+pass_7==7){
			$("#btnJoin").attr("disabled",false);		
		}else{
			$("#btnJoin").attr("disabled",true);
		}
	}
	//회원가입 버튼 키업 이벤트
	inputBox.addEventListener('keyup', activateBtn);
	//selectBox.addEventListener('change', activateBtn);
	
	// 함수들 
	

	
//------------------------------------------------------------	




  	// 2. 생년월일 셀렉트문

	//	2-1. 첫 인덱스에 null값 히든속성 삽입
 	$('#year').prepend('<option value="' + null + '" hidden></option>');
  	$('#month').prepend('<option value="' + null + '" hidden></option>');
  	$('#day').prepend('<option value="' + null + '" hidden></option>'); 


	//	2-2. 년 월 일 데이터 삽입
	var now = new Date(); //데이트 함수
	var year = now.getFullYear(); 
	var mon = (now.getMonth() + 1) > 9 ? ''+(now.getMonth() + 1) : '0'+(now.getMonth() + 1); 
	var day = (now.getDate()) > 9 ? ''+(now.getDate()) : '0'+(now.getDate()); 

	//년도 selectbox만들기 
	for(var i = 1900 ; i <= year ; i++) { 
		$('#year').append('<option value="' + i + '">' + i + '년</option>'); 
	}

	// 월별 selectbox 만들기 
	for(var i=1; i <= 12; i++) { 
		var mm = i > 9 ? i : "0"+i ; //삼항조건연산자
		$('#month').append('<option value="' + mm + '">' + mm + '월</option>'); 
	} 

	// 일별 selectbox 만들기 
	for(var i=1; i <= 31; i++) { 
		var dd = i > 9 ? i : "0"+i ;
		$('#day').append('<option value="' + dd + '">' + dd+ '일</option>'); 
	} 

	
	var mem_birth = null;	//폼 제출시 사용할 변수
	
	//	2-3. 생년월일 활성화 라디오버튼
  	$("input[name='birth_radio']:radio").change(function() {
		 var radioVal = this.value;
		 console.log("생년월일 라디오 밸류 : "+radioVal);
		 if(radioVal=='Y'){
			$("#year").prop("disabled", false);
			$("#year").prop("value", '2000');
			$("#month").prop("disabled", false);
			$("#month").prop("value", '01');
			$("#day").prop("disabled", false);
			$("#day").prop("value", '01');		
			$('#birth').val("2000-01-01");
		}else if(radioVal=='N'){
			$("#year").prop("disabled", true);
			$("#year").prop("value", null);
			$("#month").prop("disabled", true);
			$("#month").prop("value", null);
			$("#day").prop("disabled", true);
			$("#day").prop("value", null);
			$('#birth').val(null);
		}
		
	});


	// 2-4. 셀렉트한 밸류값
/*	$("#year > option[value="+year+"]").attr("selected", "true"); 
	$("#month > option[value="+mon+"]").attr("selected", "true"); 
	$("#day > option[value="+day+"]").attr("selected", "true");*/
	
	
	// 2-5. 페이지 로드시 선택안함(null값, 인덱스0)으로 설정	
	$("#year option:eq(0)").prop("selected", true);
	$("#month option:eq(0)").prop("selected", true);
	$("#day option:eq(0)").prop("selected", true);
	
	
	//테스트
	$("#btnTest").click(function(){
		birthChk();
		console.log(mem_birth);
	});
		
	//셀렉트 변경시 값 수정	
	$("#year").on("change",function(){
		birthChk();
	});	
	$("#month").on("change",function(){
		birthChk();
	});		
	$("#day").on("change",function(){
		birthChk();
	});		
	
	//생일체크 함수, 폼 제출 때 사용
	function birthChk(){
		mem_birth = $('#year').val()+'-'+$('#month').val()+'-'+$('#day').val();
		if(mem_birth=="null-null-null"){
			mem_birth=null;
			$('#birth').val(mem_birth);
		}else{
			mem_birth = $('#year').val()+'-'+$('#month').val()+'-'+$('#day').val();
			$('#birth').val(mem_birth);
		}
	}

//------------------------------------------------------		
		
	//	3. 오토하이픈	
	function autoHypenTel(str) {
	  str = str.replace(/[^0-9]/g, '');	//정규식 input입력 제한
	  var tmp = '';

	  if (str.substring(0, 2) == 02) {
	    // 서울 전화번호일 경우 10자리까지만 나타나고 그 이상의 자리수는 자동삭제
	    if (str.length < 3) {
	      return str;
	    } else if (str.length < 6) {
	      tmp += str.substr(0, 2);
	      tmp += '-';
	      tmp += str.substr(2);
	      return tmp;
	    } else if (str.length < 10) {
	      tmp += str.substr(0, 2);
	      tmp += '-';
	      tmp += str.substr(2, 3);
	      tmp += '-';
	      tmp += str.substr(5);
	      return tmp;
	    } else {
	      tmp += str.substr(0, 2);
	      tmp += '-';
	      tmp += str.substr(2, 4);
	      tmp += '-';
	      tmp += str.substr(6, 4);
	      return tmp;
	    }
	  } else {
	    // 핸드폰 및 다른 지역 전화번호 일 경우
	    if (str.length < 4) {
	      return str;
	    } else if (str.length < 7) {
	      tmp += str.substr(0, 3);
	      tmp += '-';
	      tmp += str.substr(3);
	      return tmp;
	    } else if (str.length < 11) {
	      tmp += str.substr(0, 3);
	      tmp += '-';
	      tmp += str.substr(3, 3);
	      tmp += '-';
	      tmp += str.substr(6);
	      return tmp;
	    } else {
	      tmp += str.substr(0, 3);
	      tmp += '-';
	      tmp += str.substr(3, 4);
	      tmp += '-';
	      tmp += str.substr(7);
	      return tmp;
	    }
	  }
	
	  return str;
	}
	//입력이벤트
	$('#telInput').keyup(function (event) {
	  event = event || window.event;
	  var _val = this.value.trim();
	  this.value = autoHypenTel(_val);
	});	
	
	
//------------------------------------------------

	// 4. 다음 주소 API 자바스크립트
	document.getElementById("btnApi").addEventListener("click", function(){ //주소입력칸을 클릭하면
        var width = 500; //팝업의 너비
		var height = 600; //팝업의 높이
		//인풋 초기화
        $('#zipcode').prop("value",null);
		$('#address_1').prop("value",null);
		$('#address_2').prop("value",null);
        //카카오 지도 발생
        new daum.Postcode({
			width: width, //생성자에 크기 값을 명시적으로 지정해야 합니다.
    		height: height,
            oncomplete: function(data) { //선택시 입력값 세팅
           		document.getElementById("zipcode").value = data.zonecode; // 주소 넣기
                document.getElementById("address_1").value = data.address; // 주소 넣기
                document.querySelector("input[name=mem_address_2]").focus(); //상세입력 포커싱
            }
        }).open({
		    left: (window.screen.width / 3) - (width / 2),
		    top: (window.screen.height / 2) - (height / 2)
		});
    });
	

	
	
	
	
	
//-------------------------------------------------	
	
	
	
	
	//	5. 정규표현식
	
	// 결과 메시지 클래스
	var idResult = document.querySelector('.idResult');
	var pwResult = document.querySelector('.pwResult');
	
	
	//	네임 값
	var idValue = document.querySelector("[name='mem_userid']"); // name 속성값 찾기 
	var pwValue = document.querySelector("[name='mem_userpw']"); // name 속성값 찾기 

	// 아이디 정규식
	var regId = /^[A-Za-z]{1}\w{5,19}$/;
	
	//아이디 체크 pass_1
	idValue.addEventListener("change",function(str){ //change 기능은 입력이 새로 될때마다 자동으로 검사 
		
		idValuenow = idValue.value.trim();	//아이디 네임값 담기		
		var idValid = regId.test(idValuenow); //정규표현식 검사부분 
		console.log(idValuenow);
		
		if(idValuenow.length < 6 || idValuenow.length > 20 ){
			idResult.innerHTML="6~20자 이내로 입력해주세요.";			
			$("#userid").prop('value',null);
			$("#userid").focus();
			pass_1=0;	
		}else if(!idValid){
			idResult.innerHTML="첫 글자는 영문으로 입력해주세요.";			
			$("#userid").prop('value',null);
			$("#userid").focus();
			pass_1=0;		
		}else{
			//아이디 중복검사
			idResult.innerHTML=" ";
			checkId();
			// 중복체크 ajax 
			function checkId(){
		        var mem_userid = $('#userid').val(); //id값이 "id"인 입력란의 값을 저장
		        $.ajax({
		            url:'/member/idCheck', //Controller에서 인식할 주소
		            type:'post', //POST 방식으로 전달
		            data:{mem_userid:mem_userid},
		            //async:false,
		            success:function(cnt){
		                //console.log("ajax 아이디 중복갯수 : "+cnt);
		                if(cnt != 1){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
		                    idResult.innerHTML="<font color=green>"+mem_userid+" 는(은) 사용 가능한 아이디 입니다!</font>";
		                	pass_1=1;
		                	console.log('아이디 체크 pass')
		                } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
		                    idResult.innerHTML=mem_userid+" 는(은) 이미 사용중인 아이디 입니다."
		                	$("#userid").prop('value',null);
							$("#userid").focus();
							pass_1=0;
							console.log('아이디 체크 fail')	
		                }
		            },
		            error:function(){
		                alert("에러입니다");
		            }
		        });
		    };// ajax 종료		
		}	
	});// addEventListner 종료

	//아이디 입력값 제한 replace
	$('#userid').on("blur keyup", function() {
		$(this).val($(this).val().replace(/[\W]/g,''));
		$(this).val($(this).val().replace(/^[0-9]{1}/g,''));
	});
	
	
	
	
//-------------------------------------------------------------	


	//비번 입력 이벤트
	pwValue.addEventListener("change", chkPW);
	
	//비번 체크		pass_2
	function chkPW(){
		 var pw = $("#userpw").val();
		 var num = pw.search(/[0-9]/g);
		 var eng = pw.search(/[a-z]/ig);
		 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		
		 if(pw.length < 6 || pw.length > 20){
			  pwResult.innerHTML="6~20자 이내로 입력해주세요.";
			  pwResult_2.innerHTML="";
			  $("#userpw").prop('value',null);
			  $("#userpw_2").prop('value',null);
			  $("#userpw").focus();
			  pass_2=0;
			  activateBtn();
			  $('#userpw_2').attr("disabled", true);			
			  return false;
		 }else if(pw.search(/\s/) != -1){		
			  pwResult.innerHTML="비밀번호는 공백 없이 입력해주세요.";
			  pwResult_2.innerHTML="";
			  $("#userpw").prop('value',null); 
			  $("#userpw_2").prop('value',null);
			  $("#userpw").focus();	
			  pass_2=0;	
			  activateBtn();
			  $('#userpw_2').attr("disabled", true);
			  return false;
		 }else if(num < 0 || eng < 0 || spe < 0 ){
			  pwResult.innerHTML="영문, 숫자, 특수문자를 혼합하여 입력해주세요.";
			  pwResult_2.innerHTML="";
			  $("#userpw").prop('value',null);
			  $("#userpw_2").prop('value',null);
			  $("#userpw").focus();
			  pass_2=0;
			  activateBtn();
			  $('#userpw_2').attr("disabled", true);		
			  return false;
		 }else {
			pwResult.innerHTML="<font color=green>사용 가능한 비밀번호 입니다!</font>";
			pwResult_2.innerHTML="";
			console.log("통과");
			pass_2=1;
			activateBtn();
			$('#userpw_2').attr("disabled", false);
			$("#userpw_2").prop('value',null);
			$("#userpw_2").focus();
		    return true;
		 }
	}

	//비번 입력값 제한 replace
	$("#userpw").on("blur keyup", function(){
		$(this).val($(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g,''));
		$(this).val($(this).val().replace(/[\s]/g ,''));
		$(this).val($(this).val().replace(/[\\[\]{}()<>]/g ,''));
		$(this).val($(this).val().replace(/[\-=_+.,]/g ,''));
	});
	
	
//-------------------------------------------------------

	//비밀번호 확인 변수
	var pwValue_1 = document.getElementById('userpw');
	var pwValue_2 = document.getElementById('userpw_2');
	//비밀번호 확인 메시지 변수
	var pwResult_2 = document.querySelector('.pwResult_2');
	

	//비번 확인 체크	pass_3
	pwValue_2.addEventListener("change", function(){
		if($(this).val().trim()==$(pwValue_1).val().trim()){
			pwResult_2.innerHTML="<font color=green>비밀번호가 일치합니다.";
			console.log('비번 재입력 pass')
			pass_3=1;
			activateBtn();
		}else{
			pwResult_2.innerHTML="비밀번호가 일치하지 않습니다.";
			console.log('비번 재입력 fail')
			pass_3=0;
			activateBtn();
			$('#userpw_2').focus();
		}	
	});
	
	
	//비번 입력 확인 값 제한 replace
	$("#userpw_2").on("blur keyup", function(){
		$(this).val($(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g,''));
		$(this).val($(this).val().replace(/[\s]/g ,''));
		$(this).val($(this).val().replace(/[\\[\]{}()<>]/g ,''));
		$(this).val($(this).val().replace(/[\-=_+.,]/g ,''));
	});
	
	
	

//--------------------------------------------------	
	//이름 입력 제한
	$("#username").on("blur keyup", function(){
		$(this).val($(this).val().replace(/[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g,''));
		$(this).val($(this).val().replace(/[\s]/g ,''));
	});
	
	//네임 값
	var nameValue = document.querySelector("[name='mem_username']");
	//usernameResult
	var usernameResult = document.querySelector(".usernameResult");
	//이름 정규식		
	var nameChk = /^[가-힣]*$/;	//자음 모음 개별입력 불가
	//이름 체크	pass_4
	nameValue.addEventListener("change", function(){
		//console.log(nameValue.value.trim().length);
		//글자수 체크
		if(nameValue.value.trim().length<2 || nameValue.value.trim().length>10){
			usernameResult.innerHTML="이름은 두 글자 이상 열 글자 이하로 입력해주세요.";
			$('#username').focus();
			pass_4=0;
			activateBtn();
		}else{
			//정규식 체크
			//console.log("이름 정규식 : "+nameChk.test(nameValue.value.trim()));
			if(nameChk.test(nameValue.value.trim())){
				usernameResult.innerHTML="";
				pass_4=1;
				activateBtn();		
			}else{
				usernameResult.innerHTML="완전한 글자로만 입력해주세요.";
				$('#username').focus();
				pass_4=0;
				activateBtn();
			}
		}
	});
	
	
//--------------------------------------------------


	//닉네임 입력 제한	
	$("#nickname").on("blur keyup", function(){
		$(this).val($(this).val().replace(/[^ㄱ-ㅎ가-힣a-zA-Z0-9]+$/,''));
		$(this).val($(this).val().replace(/[\s]/g ,''));
	});
	//닉네임 값
	var nickValue = document.querySelector("[name='mem_nickname']");
	// 결과 메시지 클래스
	var nicknameResult = document.querySelector(".nicknameResult");
	

	//닉네임 바이트 변수
	var countSpan = document.getElementById('count');
	var message = '';	//텍스트를 저장하기 위한 변수
	var MAX_MESSAGE_BYTE = 12;	
	document.getElementById('max-count').innerHTML = MAX_MESSAGE_BYTE.toString();
	
	//키업 이벤트 
	document.getElementById('nickname').addEventListener('keyup', checkByte);
	//메시지를 받아서 byte로 계산해주는 함수
	function count(message) {
	    var totalByte = 0;
	
	    for (var index = 0, length = message.length; index < length; index++) {
	        var currentByte = message.charCodeAt(index); //한글은 charCode값이 128 이상
	        (currentByte > 128) ? totalByte += 2 : totalByte++;	
	    }
	    return totalByte;
	}
	
	//바이트 체크
	function checkByte(event) {
    	const totalByte = count(event.target.value);

	    if (totalByte <= MAX_MESSAGE_BYTE) {
	        countSpan.innerText = totalByte.toString();
	        message = event.target.value;	//입력값 저장
	        //checkNickname();
	    } else {
	        alert(MAX_MESSAGE_BYTE + "바이트까지 입력 가능합니다.");
	        countSpan.innerText = count(message).toString();
	        event.target.value = message;	//이전 입력값 복구
	    }
	}
		
	
	
	//닉네임 체크	pass_5
	nickValue.addEventListener("change", function(){
		//글자수 검증
		if(nickValue.value.trim().length<1){
			nicknameResult.innerHTML="닉네임을 입력해주세요.";
			$("#nickname").prop('value',null);
			$("#nickname").focus();
			pass_5=0;
			activateBtn();
			return false;
			
		}else{	//정규식 검증		
			//var nickValid = nickValue.value.trim();	//닉네임 밸류 변수
			
			var nickChk = /[^a-z|A-Z|0-9|ㄱ-ㅎ|가-힣]/g;			
			var nickValid = nickChk.test(nickValue.value.trim());
			//console.log(nickValid);
			//true일 경우 null세팅 //false일 경우 통과
			if(nickValid){
				nicknameResult.innerHTML="부적절한 문자가 포함되어 있습니다.";
				$("#nickname").prop('value',null);
				$("#nickname").focus();
				pass_5=0;
				activateBtn();
				return false;
			}else{
				checkNickname();				
			}
		}
		
		
		
		// 중복체크 ajax 
			function checkNickname(){
		        let mem_nickname = $('#nickname').val();
		        $.ajax({
		            url:'/member/nicknameCheck', //Controller에서 인식할 주소
		            type:'post', //POST 방식으로 전달
		            data:{mem_nickname:mem_nickname},
		            //async:false,
		            success:function(nickcnt){
		                console.log("닉네임 체크 값 : "+nickcnt);
		                if(nickcnt != 1){ 
		                    nicknameResult.innerHTML="<font color=green>"+mem_nickname+" 는(은) 사용 가능한 닉네임 입니다!</font>";
		                	pass_5=1;
		                	activateBtn();
		                	console.log('닉네임 체크 pass')
		                } else { 
		                    nicknameResult.innerHTML=mem_nickname+" 는(은) 이미 사용중인 닉네임 입니다.";
		                	//$("#nickname").prop('value',null);
							$("#nickname").focus();
							pass_5=0;
							activateBtn();
							console.log('닉네임 체크 fail')	
		                }
		            },
		            error:function(){
		                alert("에러입니다");
		            }
		        });
		    };// ajax 종료	
		
	});// pass_5 종료

//--------------------------------------------------

	// 성별 라디오 체크 확인 이벤트 
	$(':radio[name="mem_gender"]').on("change", function(){		
		if($(':radio[name="mem_gender"]:checked').length<1){
			//console.log($(':radio[name="mem_gender"]:checked').length);
			console.log($(':radio[name="mem_gender"]:checked').val());
		}else{			
			console.log($(':radio[name="mem_gender"]:checked').length);
			console.log($(':radio[name="mem_gender"]:checked').val());
		}
	});
	
//---------------------------------------------------	
	var emailChk = /[\W]/g;	//이메일 정규식
	var emailChk2 = /[^a-zA-Z0-9.-]/g;	//직접입력 이메일 정규식
	
	var emailResult = document.querySelector('.emailResult');
	
	//이메일 입력값 제한 replace
	$('#email').on("blur keyup", function() {
		$(this).val($(this).val().replace(emailChk,''));
	});
	//직접입력 입력값 제한 replace
	$('#selectDirect').on("blur keyup", function() {
		$(this).val($(this).val().replace(emailChk2,''));
	});
	
 	 //	이메일 직접입력 인풋박스 숨기기
	$("#selectDirect").hide();
	$("#email_2").change(function() {
         //직접입력을 누를 때 나타남
		if($("#email_2").val() == "direct") {
			$("#selectDirect").show();
		}  else {
			$("#selectDirect").prop("value",null);
			$("#selectDirect").hide();
		}
	}) 
	
	//이메일 입력 이벤트	pass_6
	$('input[name="mem_email_1"]').on("change", function(){
		var emailValue= $('input[name="mem_email_1"]').val().trim();
		if(emailValue.length<1){
			emailResult.innerHTML="이메일 주소를 입력해주세요.";
			pass_6=0;
			emailPassCheck();
			return false;
		}else{
			console.log("이메일 계정 정규식 검사 : "+emailChk.test(emailValue));
			//정규식 검사 // t:필터링 	f:통과
			if(emailChk.test(emailValue)){
				$('#email').prop("value",null);
				$('#email').focus();
				emailResult.innerHTML="올바르지 못한 형식입니다.";
				pass_6=0;
				emailPassCheck();
				return false;
			}else{
				pass_6=1;
				emailResult.innerHTML="";
				emailPassCheck();
			}
		}
		
	});

//---------------------------------------------	

	
	//도메인 주소 선택 이벤트	pass_7  
	$('select[name="mem_email_2"]').on("change", function(){ 
		var selValue = $("select[name='mem_email_2']").val(); 
		console.log("셀렉트 값이 direct인가? : "+selValue != "direct");
		
		if(selValue != "direct"){//직접입력이 아닌 값들
			pass_7=1;
			console.log("패스7 : " + pass_7);
			//domain = "@"+selValue;
			//console.log(domain);
			emailPassCheck();
		}else{//직접입력인 경우
			emailResult.innerHTML="";
			pass_7=0;
			console.log("패스7 : " + pass_7);
			console.log("직접입력 옵션밸류(direct) : " + selValue);
			emailPassCheck();
		}
	}); 
	
	//직접입력 상자	도메인주소	  pass_7
	//직접입력에서 작성시 이벤트
	$('input[name="selectDirect"]').on("change",function(){
		var directValue = $('input[name="selectDirect"]').val().trim();
		if(directValue.length<1){	//0글자인 경우
			emailResult.innerHTML="도메인 주소를 입력해주세요.";
			pass_7=0;
			emailPassCheck();
			return false;
		}else{
			//문자에서 .을 찾는 함수
			var dot = directValue.indexOf('.');
			var lastDot = directValue.lastIndexOf('.');
			console.log("점 위치 : " + dot);
			console.log("마지막 점 위치 : " + lastDot);
			console.log("다이렉트밸류 길이 : " + directValue.length);
			if(dot==-1){
				emailResult.innerHTML="도메인 주소 형식에 맞지 않습니다! . 을 붙여주세요.";
				pass_7=0;
				emailPassCheck();
				return false;
			}else if(dot==0||directValue.length==lastDot+1){
				emailResult.innerHTML=". 은 맨 앞이나 맨 뒤에 올 수 없습니다.";
				pass_7=0;
				emailPassCheck();
				return false;
			}else{
				emailResult.innerHTML="";
				pass_7=1;
				emailPassCheck();
			}
		}//pass_7 종료

	});

	//이메일 결과 메시지 함수
	function emailPassCheck(){
		if(pass_6==1
		&&pass_7==1
		&&$("select[name='mem_email_2']").val()!="direct"){	//일반선택
			domain = $('#email').val()+"@"+$("select[name='mem_email_2']").val();
			$('#emailFinal').val(domain.trim());
			emailResult.innerHTML="<font color=green>형식에 맞는 이메일주소 입니다.";
		
		}else if(pass_6==1
				&&pass_7==1
				&&$("select[name='mem_email_2']").val()=="direct"){//직접입력
					domain = $('#email').val()+"@"+$('#selectDirect').val();
					$('#emailFinal').val(domain.trim());
					emailResult.innerHTML="<font color=green>형식에 맞는 이메일주소 입니다.";
		}else{
			$('#emailFinal').val(null);
			activateBtn();
		}				
			activateBtn();
	}




//---------------------------------------------------


	// 회원가입 버튼
	$("#btnJoin").click(function(){
		if(confirm('회원가입을 하시겠습니까?')){
			
			$('#submitJoin').submit();			
		}else{
		
			return false;
		}
		
		//선택 입력 사항
	});
	



});