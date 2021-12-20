$(function(){


//-------------------------------------------------------	  
	//	3. 전체 동의 버튼
	$("#chkBox_all").click(function(){
		$(".checks").prop("checked", $(this).prop("checked"));
		}); 
		
	//	4. 개별로 전부 다 체크할 때 전체 동의 체크 on/off
	//클릭 이벤트
	$(".checks").click(function(){	
		let result=true;	// 변수 초기화
		//반복문 이벤트
		$(".checks").each(function(idx, idxVol){ 
			if(!$(idxVol).prop("checked")){
				result=false;
				$(idxVol).prop("value","N");

				console.log(idx, $(idxVol).prop("checked"));
				
				//break; each문 내에서 사용불가
			}else{
				$(idxVol).prop("value","Y");
			}		
		});
		//모든 약관 동의 체크 박스
		$("#chkBox_all").prop("checked", result);
	});
//-------------------------------------------------------
	//	5. 필수 약관 유효성 검사 및 폼 제출
	//클릭 이벤트
	$("#joinNext").click(function(){		
		let result = true;	// 변수 초기화
		//필수 약관 체크 확인, 반복문 이벤트
		$(".pilsu").each(function(idx, idxVol){
			if(!$(idxVol).prop("checked")){
				result = false;
				$(idxVol).focus();
			}
			console.log(idx, $(idxVol).prop("checked"));
		});
		
		//확인 성공시 폼 제출
		if(result){				
			//밸류 콘솔 확인용
			$(".checks").each(function(idx, idxVol){
				console.log(idx, $(idxVol).prop("value"));			
			});
			if(confirm('약관을 수정 하시겠습니까?')){
			//폼 제출
			var form = $('<form></form>');
			form.attr('action', 'terms');
			form.attr('method', 'post');
			form.appendTo('body');
			form.append($('<input type="hidden" value="'+$("#chkBox_1").val()+'" name="tlog_check_1">'));
			form.append($('<input type="hidden" value="'+$("#chkBox_2").val()+'" name="tlog_check_2">'));
			form.append($('<input type="hidden" value="'+$("#chkBox_3").val()+'" name="tlog_check_3">'));
			form.append($('<input type="hidden" value="'+$("#chkBox_4").val()+'" name="tlog_check_4">'));
			form.submit();
			alert('수정했습니다!')
			}else{					
			return false;
		}
		}else{
			alert("필수 약관에 동의해주세요");
		}
	
	});

//-------------------------------------------------------		
});//자바스크립트 종료