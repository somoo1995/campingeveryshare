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
.button {
  background-color: gray; /* 버튼 배경색 */
  color: white; /* 글자색 */
  text-align: center; /* 글자 가운데 정렬 */
  padding: 10px 20px; /* 상하 10px, 좌우 20px의 패딩 */
  text-decoration: none; /* 텍스트 밑줄 제거 */
  border: none; /* 테두리 없음 */
  cursor: pointer; /* 마우스 오버 시 커서 변경 */
  width: 150px;
}
.button.active {
  background-color: #2ECC71; /* 활성화된 버튼의 배경색 변경 */
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
	$("#btnMyHistory").click();
    var params = new URLSearchParams(window.location.search);
    if (params.get('autoClick') === 'btnMyCar') {
        // 특정 요소에 대한 클릭 이벤트를 트리거
        $('#btnMyCar').click();
    }
	
	
})
</script>
<div class="container">


<!-- 작성 공간 -->
<div class="pageTitle">
<h3 id="pageTitle">내 캠핑카</h3>
<hr>
</div>

    <div class="button-group mt-5">
	    <a class="button active" id="btnMyHistory" >판매내역</a>
	    <a class="button" id="btnMyCar" >내 캠핑카</a>
	    <a class="button" id="btnMySell" >수익관리</a>
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