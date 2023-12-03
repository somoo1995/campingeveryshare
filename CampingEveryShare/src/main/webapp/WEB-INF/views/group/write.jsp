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


<link rel="stylesheet" href="../resources/css/group.css">

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
		   placeholder: '게시글을 작성해주세요. ',
		   toolbar: [
// 		      ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
		      ['font', ['fontname']],
		      ['fontsize', ['fontsize']],
		      ['color', ['forecolor', 'backcolor']],
// 		      ['para', ['ul', 'ol', 'paragraph']],
		      ['para', [ 'ol', 'paragraph']],
		      ['height', ['height']],
// 		      ['insert', ['link', 'picture', 'video']]
		      ['insert', ['link', 'picture']]
// 		      ['table', ['table']],
// 		      ['view', ['fullscreen', 'codeview']],
		   ],
// 		   fontNames: ['Source Han Sans KR Light', 'Source Han Sans KR Normal', 'Source Han Sans KR Regular', 'Source Han Sans KR Heavy', 'Source Han Serif K Light', 'Source Han Serif K Regular', 'Source Han Serif K SemiBold', 'Source Han Serif K Heavy'],
// 		   fontNamesIgnoreCheck: ['Source Han Sans KR Light', 'Source Han Sans KR Normal', 'Source Han Sans KR Regular', 'Source Han Sans KR Bold', 'Source Han Sans KR Heavy', 'Source Han Serif K Light', 'Source Han Serif K Regular', 'Source Han Serif K SemiBold', 'source-han-serif-korean', 'Source Han Serif K Heavy'],
		   fontNames: ['sans-serif', 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', 'Merriweather'],
//   		fontNamesIgnoreCheck: ['Merriweather'],
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
// 			   table: [
// 			     ['add', ['addRowDown', 'addRowUp', 'addColLeft', 'addColRight']],
// 			     ['delete', ['deleteRow', 'deleteCol', 'deleteTable']],
// 			   ],
			   air: [
			     ['color', ['color']],
// 			     ['font', ['bold', 'underline', 'clear']],
			     ['para', ['ul', 'paragraph']],
// 			     ['table', ['table']],
			     ['insert', ['link', 'picture']]
			   ]
			 }
		});

});

function checkCharacterCount(input) {
    var titleValue = input.value;

    // 최대 글자 수 체크
    if (titleValue.length > 20) {
        // 20자를 초과하면 입력을 제한
        input.value = titleValue.substring(0, 20);
        
        // 메시지 표시
        var displayBlock = document.getElementById('titleDupleBlock');
        displayBlock.style.display = 'block';
        displayBlock.textContent = "제목은 최대 20글자까지 가능합니다.";
    } else {
        // 입력이 제한되지 않으면 메시지 숨김
        var displayBlock = document.getElementById('titleDupleBlock');
        displayBlock.style.display = 'none';
    }
}



</script>

<div class="container">

<!-- 작성 공간! -->
<div class="pageTitle">
<h3>모집 글 작성</h3>
<hr>

<div>
<form id="fileForm" action="./write" method="post" enctype="multipart/form-data">
<input type="text" class="recruitStatus" maxlength="20" readonly="readonly" value=" 모집 현황" style="width: 100px; color: forestgreen;">
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
    <input type="text" class="form-control" name="title" id="title" 
    oninput="checkCharacterCount(this)" placeholder="최대 20글자">
    <div id="titleDupleBlock" style="color: red;"></div>
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