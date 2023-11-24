고객문의 게시판
게시판 별 썸네일 압축
검색결과 모집 창 리스트 형식으로 띄워야함


<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<c:import url="../layout/header.jsp" />

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<script type="text/javascript">
$(() => {
	$("#title").focus()
	
	$(".del").click(e => {
		$(e.target).prev().toggleClass("text-decoration-line-through")
		
		$(e.target).next().prop("checked", ()=>{return !$(e.target).next().prop("checked");})
	})
	
	$("#content").summernote({
		height: 300
	})
})
</script>
<style type="text/css">
.select {
	text-align: center;
    align-items: center; /* 수직 가운데 정렬 */
   	margin: 15px auto 15px auto;
   	display: flex; /* Flexbox를 사용하여 내부 요소를 가로로 나열 */
}

.recruitStatus{
    text-align: center;
    width: 80px;
    border: none;
    font-weight: bold;
}
.location{
    text-align: center;
    width: 55px;
    border: none;
    font-weight: bold;
}

label{
	margin : 5px;
}

select {
	width: 100px;
	text-align: center;
	margin-left: 10px;
}

.selectmoney{
	text-align: center;
}
</style>
<div class="container">


<!-- 작성 공간 -->
<div class="pageTitle">
<h3 id="pageTitle">글 수정</h3>
<hr>
</div>
<div class="col-10 mx-auto">
<form action="./update" method="post" enctype="multipart/form-data">

 
<input type="hidden" name="boardNo" value="${board.boardNo }" >
<input type="hidden" name="location" value="0" >
<input type="hidden" name="boardCate" value="6" >
<input type="hidden" name="loginId" value="${loginId }" >

<div class="form-group mb-3">
	<label class="form-label">작성자</label>
	<input type="text" class="form-control" readonly="readonly" value="${loginNick }">
</div>

<div class="form-group mb-3">
	<label class="form-label" for="title">제목</label>
	<input type="text" class="form-control" name="title" id="title" value="${board.title }">
</div>

<div id="originFile">
	<label class="form-label" for="file">첨부파일</label>
<c:forEach var="boardfile" items="${boardfile }">
	<div>
		<a href="./download?fileNo=${boardfile.fileNo }">${boardfile.originName }</a>
		<span class="del fw-bold fs-7 text-danger">삭제</span>
		
		<input type="checkbox" class="d-none" name="delFileNo" value="${boardfile.fileNo }">
	</div>
</c:forEach>
</div>

<div class="form-group mb-3">
	<label class="form-label" for="content">본문</label>
	<textarea class="form-control" name="content" id="content">${board.content }</textarea>
</div>

<%-- 새로운 첨부파일 --%>
<div id="newFile">

<div class="form-group mb-3">
	<label class="form-label" for="file">첨부파일</label>
	<input type="file" class="form-control" name="file" id="file" multiple="multiple">
</div>

</div>

<%-- 기존 첨부파일 --%>


<div class="text-center">
	<button class="btn btn-primary" id="btnUpdate">수정</button>
	<a href="./view?boardNo=${board.boardNo }"><button type="button" class="btn btn-danger" id="btnCancel">취소</button></a>
</div>

</form>
</div>



</div><!-- .container -->

<c:import url="../layout/footer.jsp" />