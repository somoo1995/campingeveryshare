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

.title {
	display: flex;
	flex-direction: column;
}

.writer-info {
	display: flex;
	flex-direction: row;
	justify-content: flex-start;
}


</style>

<div class="container">
<h1 style="color:#2ECC71">게시글 상세보기</h1>
<h6 style="color: #A4A4A4">캠핑 관련 게시글을 조회합니다.</h6>
<hr>

<div class="article">
<div class="title">

<div>
<h1>${boardView.TITLE}</h1>
</div><!-- 글 제목 -->

		<div class="writer-info" style="color: #A4A4A4">
		<div style="padding-right: 20px;">프로필 사진 | ${writerView.PROFILE}</div>
		<div style="padding-right: 20px;">닉네임 | ${writerView.USER_NICK}</div>
		<div style="padding-right: 480px;">아이디 | ${writerView.USER_ID}</div>
		<div style="padding-right: 30px;">작성일 | <fmt:parseDate value="${writerView.POST_DATE}" var="date" pattern="yyyy-MM-dd HH:mm"/></div>
		<fmt:formatDate value="${date }" pattern="yyyy-MM-dd HH:mm"/>

		<hr>
		<div>모집 지역 | ${writerView.LOCATION }</div>
		<div>조회수| ${writerView.HIT }</div>
		<div>모집 상태 | ${writerView.RECRUIT_STATUS }</div>
		
		
		</div><!-- 작성자 정보 -->
					
</div><!-- 글 제목 + 유저 정보 -->

<hr>

<div style="padding-top: 20px;">

${writerView.CONTENT }

</div><!-- .content -->
</div><!-- .article -->

<div class="buttons">
<a href="./list"><button class="btn">목록</button></a>
<a href="./edit"><button class="btn">수정</button></a>
<a href="./delete"><button class="btn">삭제</button></a>
</div>


</div><!-- .container -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />