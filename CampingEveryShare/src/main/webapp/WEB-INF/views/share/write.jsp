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
<h3 id="pageTitle">글 작성</h3>
<hr>


<div>

<form id="fileForm" action="./write" method="post" enctype="multipart/form-data">

<input type="hidden" name="writerId" value="${id }" >

<div class="form-group mb-3">
	<label class="form-label">작성자</label>
	<input type="text" class="form-control" readonly="readonly" value="${nick }">
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