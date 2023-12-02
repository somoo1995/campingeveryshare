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
<style type="text/css">
.marketselect {
	text-align: center;
    align-items: center; /* 수직 가운데 정렬 */
   	margin: 15px auto 15px auto;
   	display: flex; /* Flexbox를 사용하여 내부 요소를 가로로 나열 */
 	justify-content: space-between; /* 요소 간에 공간을 균등하게 배치 */
   	
}

.price{
    text-align: center;
    width: 55px;
    border: none;
    font-weight: bold;
   	display: flex; /* Flexbox를 사용하여 내부 요소를 가로로 나열 */

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
<h3 id="pageTitle">중고장터 글 작성</h3>
<hr>

<div>

<form id="fileForm" action="./write" method="post" enctype="multipart/form-data">

<div class="marketselect">

<div class="price">
<input type="text" style="font-size: 15px; font-weight: bold;" class="price"  readonly="readonly" value="금 액">
<input type="number" placeholder="금액을 입력해 주세요." name="price" id="price" max="999999999"/> 원
</div>
|
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

 
<input type="hidden" name="loginId" value="${loginId }" >
<input type="hidden" name="boardCate" value="3" >
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