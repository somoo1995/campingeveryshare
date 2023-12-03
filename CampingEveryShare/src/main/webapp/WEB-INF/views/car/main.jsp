<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />
<style>
.button-group {
  display: flex; /* 버튼을 한 줄로 나란히 배열 */
}

.button:a {
	text-decoration: none;
}

.button {
  background-color: #b8b8b8; /* 버튼 배경색 */
  color: white; /* 글자색 */
  text-align: center; /* 글자 가운데 정렬 */
  padding: 10px 20px; /* 상하 10px, 좌우 20px의 패딩 */
  text-decoration: none; /* 텍스트 밑줄 제거 */
  border: none; /* 테두리 없음 */
  cursor: pointer; /* 마우스 오버 시 커서 변경 */
  width: 150px;
  border-top-left-radius: 10px;
   border-top-right-radius: 10px;
   font-size: 20px;
    font-weight: bold;
}
.button.active {
  background-color: #1ABA00; /* 활성화된 버튼의 배경색 변경 */
  border-top-left-radius: 10px;
  border-top-right-radius: 10px
}
    .status-container {
        display: flex;
        justify-content: space-around; /* 요소들 사이에 공간을 균등하게 배분 */
        margin-top: 20px; /* 원하는 마진 설정 */
    }

   .status-card {
        border: 1px solid #ddd; /* 테두리 */
        border-radius: 10px; /* 테두리 둥글게 */
        padding: 20px;
        display: flex; /* Flexbox 사용 */
        flex-direction: row; /* 요소들을 수평으로 배치 */
        align-items: center; /* 세로 중앙 정렬 */
        box-shadow: 0 2px 5px rgba(0,0,0,0.2); /* 그림자 효과 */
        width: 300px; /* 카드의 너비 */
    }

    .status-card img {
        width: 50%; /* 이미지가 카드의 절반을 차지하도록 설정 */
        height: auto; /* 이미지 비율 유지 */
    }

    .text-container {
        display: flex; /* Flexbox 사용 */
        flex-direction: column; /* 요소들을 수직으로 배치 */
        justify-content: center; /* 수직 중앙 정렬 */
        flex: 1; /* 나머지 공간을 차지하도록 설정 */
        text-align: left; /* 텍스트를 왼쪽으로 정렬 */
        padding-left: 10px; /* 이미지와의 간격 */
    }

    .status-card p {
        margin: 0;
        font-size: 3.5em; /* 텍스트 크기 */
        font-weight: bold;
        text-algin: center;
        margin-left: 30px;
    }

    .status-card label {
        font-size: 1.2em;
        color: #555;
        text-align: center;
    }
</style>
<script>
$(document).ready(function () {


	$("#btnMyHistory").click(function() {
		$(this).addClass("active")
		$("#btnMyCar").removeClass("active")
		$("#btnMySell").removeClass("active")
		$(".myHistory").show();
		$(".myCar").hide()
		$(".mySell").hide()
		$.ajax({
			type:"get"
			,url: "/car/history"
			,dataType: "html"
			,success: function(res){
				console.log("AJAX성공")
				$(".myHistory").html(res)
			},error: function(){
				console.log("AJAX실패")
			}
		})
		
	})
	
	$("#btnMyCar").click(function() {
		$(this).addClass("active")
		$("#btnMyHistory").removeClass("active")
		$("#btnMySell").removeClass("active")
		$(".myCar").show();
		$(".myHistory").hide()
		$(".mySell").hide()
		
		$.ajax({
			type:"get"
			,url: "/car/mycar"
			,dataType: "html"
			,success: function(res){
				console.log("AJAX성공")
				$(".myCar").html(res)
			},error: function(){
				console.log("AJAX실패")
			}
		})
	})
	
	$("#btnMySell").click(function() {
		$(this).addClass("active")
		$("#btnMyHistory").removeClass("active")
		$("#btnMyCar").removeClass("active")
		$(".mySell").show();
		$(".myCar").hide()
		$(".myHistory").hide()
		$.ajax({
			type:"get"
			,url: "/car/mysell"
			,dataType: "html"
			,success: function(res){
				console.log("AJAX성공")
				$(".mySell").html(res)
			},error: function(){
				console.log("AJAX실패")
			}
		})
		
	})
	$("#btnMyCar").click();
    var params = new URLSearchParams(window.location.search);
    if (params.get('autoClick') === 'btnMyCar') {
        // 특정 요소에 대한 클릭 이벤트를 트리거
        $('#btnMyCar').click();
    }else if(params.get('autoClick') === 'btnMySell'){
    	$("#btnMySell").click();
    }
	
	
})
</script>
<div class="container">


<!-- 작성 공간 -->
<div class="pageTitle">
<h3 id="pageTitle">내 캠핑카</h3>
</div>
	<div class="status-container">
    <div class="status-card">
        <img src="/resources/img/ongoing.png" alt="진행중" />
        <div class="text-container">
            <p>${index.ongoing }</p>
            <label>진행 중</label>
        </div>
    </div>
    <div class="status-card">
        <img src="/resources/img/ongoing.png" alt="완료" />
        <div class="text-container">
            <p>${index.done }</p>
            <label>완료</label>
        </div>
    </div>
    <div class="status-card">
        <img src="/resources/img/ongoing.png" alt="취소" />
        <div class="text-container">
            <p>${index.cancel }</p>
            <label>취소</label>
        </div>
    </div>
</div>

    <div class="button-group mt-5">
	    <a class="button active" id="btnMyHistory" >판매 내역</a>
	    <a class="button" id="btnMyCar" >내 캠핑카</a>
	    <a class="button" id="btnMySell" >수익 관리</a>
	</div>
	
	<div class="myHistory"></div>
	
	<div class="myCar"></div>
	
	<div class="mySell"></div>

</div><!-- .container -->

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<c:import url="../layout/footer.jsp" />