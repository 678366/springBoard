<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시글 상세조회</title>
</head>
<body>
	<div class="input_wrap form-group">
		<label>게시판 번호</label>
		<input class="form-control" name="bno" readonly="readonly" value='<c:out value="${pageInfo.bno}"/>' >
	</div>
	<div class="input_wrap form-group">
		<label>게시판 제목</label>
		<input class="form-control" name="title" readonly="readonly" value='<c:out value="${pageInfo.title}"/>' >
	</div>
	<div class="input_wrap form-group">
		<label>게시판 내용</label>
		<textarea class="form-control" rows="3" name="content" readonly="readonly"><c:out value="${pageInfo.content}"/></textarea>
	</div>
	<div class="input_wrap form-group">
		<label>게시판 작성자</label>
		<input class="form-control" name="writer" readonly="readonly" value='<c:out value="${pageInfo.writer}"/>' >
	</div>
	<div class="input_wrap form-group">
		<label>게시판 등록일</label>
		<input class="form-control" name="regDate" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.regDate}"/>' >
	</div>
	<div class="input_wrap form-group">
		<label>게시판 수정일</label>
		<input class="form-control" name="updateDate" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.updateDate}"/>' >
	</div>
	
	<div class="btn_wrap">
		<a class="btn btn-default" id="list_btn">목록페이지</a> 
		<a class="btn btn-default" id="modify_btn"">수정</a>
	</div>
	
	<!-- 댓글 기능 -->
	<hr />
	
	<div>
	    <p>
	        <label>댓글 작성자</label> <input type="text">
	    </p>
	    <p>
	        <textarea rows="5" cols="50"></textarea>
	    </p>
	    <p>
	        <button type="button">댓글 작성</button>
	    </p>
	</div>
	
	<ul>
	    <li>첫번째 댓글</li>
	    <li>두번째 댓글</li>
	    <li>세번째 댓글</li>
	</ul>
	

	
	<form id="infoForm" action="/board/modify" method="get">
		<input type="hidden" id="bno" name="bno" value='<c:out value="${pageInfo.bno}"/>'>
		<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
		<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
		<input type="hidden" name="type" value="${cri.type }">
		<input type="hidden" name="keyword" value="${cri.keyword }">
	</form>
<script>
	var form = $("#infoForm");
	
	$("#list_btn").on("click", function(e) {
			form.find("#bno").remove();
			form.attr("action", "/board/list");
			form.submit();
	});
	
	$("#modify_btn").on("click", function(e) {
			form.attr("action", "/board/modify");
			form.submit();
	})
</script>
</body>
</html>
<%@ include file="../includes/footer.jsp"%>