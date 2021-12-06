<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- CDN을 사용할 때 악의적인 스크립트 변조를 막기 위해 integrity 옵션 사용. link, script 태그에서 사용-->
    <!-- 요즘 많은 웹사이트에서 CDN을 사용하나, 만약 CDN보안이 뚫리거나 CDN내용을 변조한다면(게시자의 코드수정 포함),

	CDN을 사용하는 모든 웹사이트에 아래 예시와 같은 공격을 할 수 있을겁니다.
	
	(예) CDN의 JS내용을 변조하여 접속한 사이트의 정보를 탈취(XSS방지가 대부분되어있으므로 최신 브라우저에서는 안됨) 또는 악성 스크립트 실행(크립토재킹, 악성사이트로 리다이렉트, 피싱사이트로 리다이렉트 등)
	CDN이 뚫릴일은 희박하지만 보안은 가능성이 0%가 아닌 모든것을 막아야되므로 주의할수록 좋습니다. -->
    
    
    
    <!-- Bootstrap 자체의 기능은 아니지만, Bootstrap 이용의 Web 페이지를 준비할 때 반드시 작성해 두어야 하는 <meta> 태그가 있다.  -->
    <meta charset="utf-8">
    <!-- 모바일 브라우저의 뷰포트 크기조절 태그, 비표준 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">



    <!-- Bootstrap CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    
    <!-- Option 1: Bootstrap Bundle with Popper CDN -->
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  	<!-- jquery CDN -->
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>	
  	