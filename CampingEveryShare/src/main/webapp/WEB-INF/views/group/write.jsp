<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">
h1 {
font-weight: bold;
}

hr {
clear: both; /* 이전 요소들과 무관하게 이어지는 요소를 지정 */

}

.view {
	width: 100%;
	border: solid;
	border-radius: 5px;
 	border-style: hidden;
	box-shadow: 0 0 0 1px #C7C8C9;
}

.content {
	width: 100%;
	border: solid;
	border-radius: 5px;
 	border-style: hidden;
	box-shadow: 0 0 0 1px #C7C8C9;
}

.btn {
     background-color: #2ECC71; 
    color: white;
    border: none;
    cursor: pointer;
    font-weight: bold;
    float: right;
}

.btn:hover {
    background-color: #04883C; /* 마우스 호버 시 배경 색상 변경 */
    color: white;
}

.btn:active {
    background-color: #2ECC71; /* 버튼을 클릭할 때 배경 색상 변경 */
    color: white;
}

.buttons .btn {
	margin-top: 10px;
	margin-right: 10px;
}

.article {
	padding: 30px;
	border: solid;
	border-radius: 5px;
 	border-style: hidden;
	box-shadow: 0 0 0 1px #C7C8C9;	
}

.writer-info {
	display: flex;
	flex-direction: row;
	justify-content: flex-start;
}

</style>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<script type="text/javascript">
$(() => {
	$("#title").focus()
	
	$("#content").summernote({
		height: 300
	})
})

</script>

<div class="container">
<h1 style="color:#2ECC71">모집 게시글 등록</h1>
<h6 style="color: #A4A4A4">캠핑 모집 게시글을 작성합니다.</h6>
<hr>

<div class="article">
<div class="title">

<form action="./write" method="post" enctype="multipart/form-data"><!-- 제출하기 -->

<div>
<h5>상태 및 위치 |</h5>
<label class="status">모집 현황</label>
<select class="status" name="recruitStatus">
<!-- 처음에 글 올릴 때는 모집 중만 보이도록 하는 것도 괜찮을듯 -->
	<option value="1" selected="selected">모집 중</option>
	<option value="2">모집 완료</option>
</select><br>

<label class="location">지역</label>
<select class="location" name="location">
	<option value="1">서울</option>
	<option value="2">인천</option>
</select><br>
</div><!-- 선택 내역 -->
<hr>

<div><!-- 글제목 -->
	<input type="text" name="title" class="title" style="width:1100px; height: 50px; margin-bottom: 20px;">
</div>

</div><!-- 작성자 정보 -->

<div>
	<textarea name="content" id="content"></textarea>
</div><!-- 게시글 안 -->

					
</div><!-- 글 제목 + 유저 정보 -->

<div class="buttons">
<!-- alert [작성 중인 내용이 있습니다. 취소하시겠습니까?] -->
<button class="btn">작성</button>
<a href="./list"><button class="btn">취소</button></a>
</div><!-- .buttons -->

</div><!-- .content -->
</div><!-- .article -->


</form>

</div><!-- .container -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />