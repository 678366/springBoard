<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Main_Header</title>

<!-- CSS -->
	<link rel="stylesheet" href="../resources/css/main-header.css">
	<link rel="stylesheet" href="../resources/css/reset.css">
	<link rel="stylesheet" href="../resources/css/board/get.css">
	<link rel="stylesheet" href="../resources/css/board/list.css">

<!-- SCRIPT -->
	<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
</head>
<body>

<header class="header_wrap">
    	<div class="header_container">
	    	<a href="/">
	    		<h3 class="header_logo" title="회사 로고">Blog</h3>
	    	</a>
	    	<div class="h_navbar_wrap">
	    		<div class="h_navbar_menu">
	    			<div class="h_menu"><a href="/">홈</a></div>
	    			<div class="h_menu"><a href="/about/company">회사소개</a></div>
	    			<div class="h_menu"><a href="/about/inquire">문의하기</a></div>
	    			<div class="h_menu"><a href="/board/list">게시판</a></div>
					<!-- 로그인 하지 않은 상태 -->
	    			<c:if test="${member eq null}">
						<div class="main_login h_menu"><a href="/member/login">로그인</a></div>
		    			<span class="h_menu"><a href="/member/join">회원가입</a></span>
					</c:if>
					
					<!-- 로그인 한 상태 -->
					<c:if test="${member ne null}">
						<div class="login_success h_menu">
							<span>${member.mId}님</span>
						</div>
					</c:if>
	    		</div>
	    	</div>
    	</div>
  	
</header>

</body>
</html>