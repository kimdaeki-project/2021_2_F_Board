$(function(){
	//데이터 삭제
	$("#btnDelete").click(function(){
		if(confirm('계정을 삭제 하시겠습니까?')){
			alert('삭제가 완료되었습니다.')
			location.href="delete";			
		}else{					
			return false;
		}
	});
	$("#btnTerms").click(function(){
		location.href="terms";
	});	
	$("#btnUpdate").click(function(){
		location.href="update";
	});			
});

