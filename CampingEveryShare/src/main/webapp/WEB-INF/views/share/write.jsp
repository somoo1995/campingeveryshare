<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- include summernote css/js -->
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

<div class="container">


<!-- 작성 공간 -->
<div class="pageTitle">
<h3 id="pageTitle">캠핑존 공유 글 작성</h3>
<hr>


<div>

<form id="fileForm" action="./write" method="post" enctype="multipart/form-data">

나와줘 부탁이야!  ${boardCate }<br>

<select name="boardCate" id="boardCate">
     <option value="1">대여</option>
     <option value="2">캠핑존공유</option>
     <option value="3">모집</option>
     <option value="4">중고장터</option>
     <option value="5">공지사항</option>
     <option value="6">고객문의</option>
 </select>

<select name="location" id="location">
     <option value="1">서울</option>
     <option value="2">인천</option>
 </select>
 
<input type="hidden" name="userId" value="${userId }" >
<div class="form-group mb-3">
	<label class="form-label">작성자</label>
	<input type="text" class="form-control" name="userNick" readonly="readonly" value="${userNick }">
</div>

<div class="form-group mb-3">
	<label class="form-label" for="title">제목</label>
	<input type="text" class="form-control" name="title" id="title">
</div>

<div class="form-group mb-3">
	<label class="form-label" for="content">본문</label>
	<textarea class="form-control" name="content" id="content"></textarea>
</div>

<div class="form-group mb-3">
	<label class="form-label" for="file">파일</label>
	<input type="file" class="form-control" name="file" id="file" multiple="multiple">
</div>

<div class="text-center">
	<button class="btn btn-primary" id="btnWrite">작성</button>
	<a href="/share/list"><button type="button" class="btn btn-danger" id="btnCancel">취소</button></a>
</div>

</form>
</div>


</div>




</div><!-- .container -->

<c:import url="../layout/footer.jsp" />