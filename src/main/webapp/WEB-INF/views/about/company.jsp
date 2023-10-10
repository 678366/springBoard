<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../../../resources/css/company/company.css">
<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
<title>회사 소개 페이지</title>
</head>
<jsp:include page="../../views/includes/header.jsp"></jsp:include>
<body>
		<h1 class="company_main_text">&nbsp;회사 소개 페이지</h1>
		<div data-aos="fade-in">
		
		</div>
		<div
		  data-aos="fade-up"
		  data-aos-offset="200"
		  data-aos-delay="50"
		  data-aos-duration="1000"
		  data-aos-easing="ease-in-out"
		  data-aos-mirror="true"
		  data-aos-once="false"
		  data-aos-anchor-placement="top-center"
		>
	  </div>
	  <h1 class="company_main_text">&nbsp;Blog 주요 투자사들이</h1>
	  <h1 class="company_main_text">&nbsp;</h1>
	  <img class="company_bg_img" src="../../../resources/img/company/company_page_bg.jpg">
	  <script>
	    AOS.init();
	  </script>
</body>
</html>
<%@ include file="../includes/footer.jsp"%>