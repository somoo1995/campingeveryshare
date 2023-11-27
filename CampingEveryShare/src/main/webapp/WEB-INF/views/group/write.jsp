<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>


<link rel="stylesheet" href="../resources/css/group.css?after">

<!-- <link rel="stylesheet" href="../resources/css/font.css?after"> -->

<script type="text/javascript">
$(() => {
	$("#title").focus()
	
	$(".del").click(e => {
		$(e.target).prev().toggleClass("text-decoration-line-through")
		
		$(e.target).next().prop("checked", ()=>{return !$(e.target).next().prop("checked");})
	})
	
	$("#content").summernote({
		   height: 300,
		   placeholder: '모집 게시글을 작성해주세요.',
		   toolbar: [
		      ['style', ['bold', 'italic', 'underline', 'clear']],
		      ['font', ['fontname']],
		      ['fontsize', ['fontsize']],
		      ['color', ['color']],
		      ['para', ['ul', 'ol', 'paragraph']],
		      ['height', ['height']],
		      ['insert', ['link', 'picture', 'video']],
		      ['table', ['table']],
// 		      ['view', ['fullscreen', 'codeview']],
		   ],
		   fontNames: ['주아체', '도현체', '본명조', '부크크 명조', 'Roboto'],
		   fontNamesIgnoreCheck: ['주아체', '도현체', '본명조', '부크크 명조', 'Roboto'],
		   fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
		   popover: {
			   image: [
			     ['image', ['resizeFull', 'resizeHalf', 'resizeQuarter', 'resizeNone']],
			     ['float', ['floatLeft', 'floatRight', 'floatNone']],
			     ['remove', ['removeMedia']]
			   ],
			   link: [
			     ['link', ['linkDialogShow', 'unlink']]
			   ],
			   table: [
			     ['add', ['addRowDown', 'addRowUp', 'addColLeft', 'addColRight']],
			     ['delete', ['deleteRow', 'deleteCol', 'deleteTable']],
			   ],
			   air: [
			     ['color', ['color']],
			     ['font', ['bold', 'underline', 'clear']],
			     ['para', ['ul', 'paragraph']],
			     ['table', ['table']],
			     ['insert', ['link', 'picture']]
			   ]
			 }
		});

});


</script>

<div class="container">


<!-- 작성 공간 -->
<div class="pageTitle">
<h3>모집 글 작성</h3>
<hr>

<div>

<form id="fileForm" action="./write" method="post" enctype="multipart/form-data">
<input type="text" class="recruitStatus"  readonly="readonly" value=" 모집 현황" style="width: 100px; color: forestgreen;">
|
<label><input type="radio" name="recruitStatus" value="0" checked="checked">모집 중</label>
<label><input type="radio" name="recruitStatus" value="1">모집 완료</label>
</div>

<div class="locationselect">
<input type="text" class="location" readonly="readonly" value="위 치" style="width: 100px; color: forestgreen">
|
<select name="location" id="location">
     <option>선택</option>
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
</div> <!-- .locationselect -->

<hr>
 
<input type="hidden" name="loginId" value="${loginId }" >
<input type="hidden" name="boardCate" value="4" >
<!-- <div class="form-group mb-3"> -->
<!-- 	<label class="form-label">작성자</label> -->
<%-- 	<input type="text" class="form-control" name="loginNick" readonly="readonly" value="${loginNick }"> --%>
<!-- </div> -->

<div class="form-group mb-3">
<!-- 	<label class="form-label" for="title">제목</label> -->
	<input type="text" class="form-control" name="title" id="title">
</div>

<div class="form-group mb-3">
<!-- 	<label class="form-label" for="content">본문</label> -->
	<textarea class="form-control" name="content" id="content"></textarea>
</div>

<div class="form-group mb-3">
	<label class="form-label" for="file" style="font-weight: bold; color: forestgreen;">파일</label>
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