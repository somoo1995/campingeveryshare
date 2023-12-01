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

<style type="text/css">
.select {
	text-align: center;
    align-items: center; /* 수직 가운데 정렬 */
   	margin: 15px auto 15px auto;
   	display: flex; /* Flexbox를 사용하여 내부 요소를 가로로 나열 */
}

.money{
    text-align: center;
    width: 55px;
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
<h3 id="pageTitle">캠핑존 공유 글 작성</h3>
<hr>


<div>

<form id="fileForm" action="./write" method="post" enctype="multipart/form-data">



<div class="select">
<div class="moneyselect">
<input type="text" class="money"  readonly="readonly" value="금 액">
|
<label><input type="radio" name="paid" id="paid" value="2" checked="checked">무료</label>
<label><input type="radio" name="paid" id="paid" value="3">유료</label>
</div>

<div class="locationselect">
<input type="text" class="location" readonly="readonly" value="위 치">
|
<select name="location" id="location">
     <option value="10">강원</option>
     <option value="9">경기</option>
     <option value="16">경남</option>
     <option value="15">경북</option>
     <option value="5">광주</option>
     <option value="6">대구</option>
     <option value="3">대전</option>
     <option value="4">부산</option>
     <option value="1">서울</option>
     <option value="8">세종</option>
     <option value="7">울산</option>
     <option value="2">인천</option>
     <option value="14">전남</option>
     <option value="13">전북</option>
     <option value="17">제주</option>
     <option value="12">충남</option>
     <option value="11">충북</option>
 </select>
</div> 
</div>
<hr>
 
<input type="hidden" name="loginId" value="${loginId }" >
<input type="hidden" name="boardCate" value="2" >
<div class="form-group mb-3">
	<label class="form-label">작성자</label>
	<input type="text" class="form-control" name="loginNick" readonly="readonly" value="${loginNick }">
</div>

<div class="form-group mb-3">
	<label class="form-label" for="file">게시글 목록에 보여질 사진을 올려주세요</label>
	<input type="file" class="form-control" name="file" id="file" multiple="multiple">
</div>

<div class="form-group mb-3">
	<label class="form-label" for="title">제목</label>
	<input type="text" class="form-control" name="title" id="title">
</div>

<div class="form-group mb-3">
	<label class="form-label" for="content">본문</label>
	<textarea class="form-control" name="content" id="content"></textarea>
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