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



	//메인버튼
	$('#btnMain').click(function(){
		location.href="/";
	});
	//로그인버튼
	$('#btnLogin').click(function(){
		location.href="/member/login";
	});
	
	
	
	
});