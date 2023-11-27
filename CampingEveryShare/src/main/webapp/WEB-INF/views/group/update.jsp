<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<c:import url="../layout/header.jsp" />

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<link rel="stylesheet" href="../resources/css/group.css?after">

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
<h3 id="pageTitle" style="color: forestgreen;">글 수정</h3>
<hr>
</div>
<div class="col-10 mx-auto">
<form action="./update" method="post" enctype="multipart/form-data">
<input type="text" class="recruitStatus"  readonly="readonly" value=" 모집 현황 " style="width: 100px; color: forestgreen; margin-left: -110px;">
|
<label><input type="radio" name="paid" id="paid" value="0" <c:if test="${group.recruitStatus eq 0}">checked="checked"</c:if>>모집중</label>
<label><input type="radio" name="paid" id="paid" value="1" <c:if test="${group.recruitStatus eq 1}">checked="checked"</c:if>>모집 완료</label>
</div>

<div class="locationselect">
<input type="text" class="location" readonly="readonly" value="위 치" style="width: 98px; color: forestgreen;">
|
<select name="location" id="location">
    <option>선택</option>
    <option value="10" <c:if test="${board.location eq 10}">selected</c:if>>강원</option>
    <option value="9" <c:if test="${board.location eq 9}">selected</c:if>>경기</option>
    <option value="16" <c:if test="${board.location eq 16}">selected</c:if>>경남</option>
    <option value="15" <c:if test="${board.location eq 15}">selected</c:if>>경북</option>
    <option value="5" <c:if test="${board.location eq 5}">selected</c:if>>광주</option>
    <option value="6" <c:if test="${board.location eq 6}">selected</c:if>>대구</option>
    <option value="3" <c:if test="${board.location eq 3}">selected</c:if>>대전</option>
    <option value="4" <c:if test="${board.location eq 4}">selected</c:if>>부산</option>
    <option value="1" <c:if test="${board.location eq 1}">selected</c:if>>서울</option>
    <option value="8" <c:if test="${board.location eq 8}">selected</c:if>>세종</option>
    <option value="7" <c:if test="${board.location eq 7}">selected</c:if>>울산</option>
    <option value="2" <c:if test="${board.location eq 2}">selected</c:if>>인천</option>
    <option value="14" <c:if test="${board.location eq 14}">selected</c:if>>전남</option>
    <option value="13" <c:if test="${board.location eq 13}">selected</c:if>>전북</option>
    <option value="17" <c:if test="${board.location eq 17}">selected</c:if>>제주</option>
    <option value="12" <c:if test="${board.location eq 12}">selected</c:if>>충남</option>
    <option value="11" <c:if test="${board.location eq 11}">selected</c:if>>충북</option>
 </select>
</div> 

<hr>
 
<input type="hidden" name="boardNo" value="${board.boardNo }" readonly="readonly">

<!-- <div class="form-group mb-3"> -->
<!-- 	<label class="form-label" for="writer" style="font-weight: bold; color: forestgreen">작성자</label> -->
<%-- 	<input type="text" class="form-control" readonly="readonly" value="${loginNick }"> --%>
<!-- </div> -->

<div class="form-group mb-3">
<!-- 	<label class="form-label" for="title" style="font-weight: bold; color: forestgreen">제목</label> -->
	<input type="text" class="form-control" name="title" id="title" value="${board.title }">
</div>

<div class="form-group mb-3">
<!-- 	<label class="form-label" for="content" style="font-weight: bold; color: forestgreen">본문</label> -->
	<textarea class="form-control" name="content" id="content">${board.content }</textarea>
</div>

<%-- 새로운 첨부파일 --%>
<div id="newFile">

<div class="form-group mb-3">
	<label class="form-label" for="file" style="font-weight: bold; color: forestgreen">첨부파일</label>
	<input type="file" class="form-control" name="file" id="file" multiple="multiple">
</div>

</div>

<%-- 기존 첨부파일 --%>

<div id="originFile">
	<label class="form-label" for="file" style="font-weight: bold; color: forestgreen">첨부파일 목록</label>
<c:forEach var="boardfile" items="${boardfile }">
	<div>
		<a href="./download?fileNo=${boardfile.fileNo }">${boardfile.originName }</a>
		<span class="del fw-bold fs-7 text-danger">삭제</span>
		
		<input type="checkbox" class="d-none" name="delFileNo" value="${boardfile.fileNo }">
	</div>
</c:forEach>
</div>


<div class="text-center">
	<button class="btn_edit" id="btnUpdate">수정</button>
	<a href="./view?boardNo=${board.boardNo }"><button type="button" class="btn_cancel" id="btnCancel">취소</button></a>
</div>

</form>
</div>



</div><!-- .container -->

<c:import url="../layout/footer.jsp" />