<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<style>
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
    .carRegi {
        width: 1100px;
        height: 150px;
        background-color: #819FF7;
        display: flex;
        justify-content: center; /* 가운데 정렬 */
        align-items: center; /* 세로 중앙 정렬 */
        border: none; /* 테두리 없음 */
    }
    
    .carRegi a {
        text-decoration: none; /* 링크 밑줄 제거 */
        color: black; /* 링크 색상 */
        font-size: 1.2em; /* 폰트 크기 */
        display: flex;
        flex-direction: column; /* 요소들을 수직으로 배치 */
        align-items: center; /* 아이콘과 텍스트 수직 중앙 정렬 */
        justify-content: center; /* 수직 중앙 정렬 */
        width: 100%; /* 전체 너비 차지 */
        height: 100%; /* 전체 높이 차지 */
    }
    
    .carRegi a span {
        display: block; /* 각 span을 블록 요소로 만들어 줄바꿈 */
        text-align: center; /* 텍스트 가운데 정렬 */
    }
    
    .carRegi a span:first-child {
        font-size: 4em; /* 첫 번째 span (즉, + 기호)의 폰트 크기 */
        line-height: 0.3; /* 줄 간격 조정 */
    }
    
    .carRegi a span:last-child {
        font-size: 3em; /* 두 번째 span (즉, 등록하기 텍스트)의 폰트 크기 */
    }
    
    .car-Wrap{
    	border: 1px solid #ccc;
    	width: 1100px;
    	height: 270px;
    	display: flex;
    	background-color: #E6E6E6;
    	margin-bottom: 20px;
    }
    .carImg img{
    	width: 300px;
    	height: 270px;
    	border: 1px solid #ccc;
    	padding: 5px;
    	background-color: white;
    }
    .carSum{
    	display: flex;
    	flex-direction: column;
    	width: 800px;
    }
    .carPrice hr{
   	  border: none; /* 기존의 테두리를 제거합니다. */
	  height: 1px; /* 선의 두께를 지정합니다. */
	  background-color: #ff0000; /* 원하는 색상으로 배경색을 지정합니다. */
	  margin-top: 20px; /* 상단 여백을 추가합니다. */
	  margin-bottom: 20px; /* 하단 여백을 추가합니다. */
    }
    
    .carStatus{
    	display: inline-block;
    }
    
    .carNo{
    	display: flex;
    	justify-content: space-between;
    }
    
    .carDone{
    	display: flex;
    	justify-content: space-between;
    }
    .carList button{
        background-color: #007bff; /* 파란색 배경 */
        color: white; /* 텍스트 색상 */
        border: none; /* 테두리 제거 */
        padding: 10px 20px; /* 상하 10px, 좌우 20px의 패딩 */
        margin: 5px; /* 주위 여백 */
        border-radius: 5px; /* 모서리 둥글게 */
        cursor: pointer; /* 마우스 오버 시 커서 변경 */
        font-size: 16px; /* 폰트 크기 */
        transition: background-color 0.3s; /* 배경 색상 변경 시 애니메이션 */
    }
    
    .carStatus button{
    	margin-right: 20px;
    }
    
    .carList{
    	margin-bottom: 20px;
    }
    .carStatus button{
    	cursor: default;
    }
    
</style>
<script type="text/javascript">
$(document).ready(function(){
    $(".carRegi").on("click", ".registerLink", function(event) {
        event.preventDefault(); // 이 부분이 링크의 기본 동작을 막습니다.
        $.ajax({
            type: "get",
            url: "./regi",
            dataType: "html",
            success: function(res){
                console.log("AJAX성공")
                $(".carRegi").hide();
                $(".regiForm").html(res);
            },
            error: function(){
                console.log("AJAX실패")
            }
        });
    });
    
    $('.carManage button:contains("편집")').click(function(){
    	console.log("편집 버튼 클릭됨")
    	console.log("car_no : ", $(this).data("carNo"));
    	var carNumber = $(this).data("carNo")
    	$.ajax({
    		type: "get",
    		url: "/car/regi?carNumber="+carNumber,
    		dataType: "html",
   			success: function(res){
   				$(".carRegi").hide();
   				$(".regiForm").html(res);
    		},error: function(){
    			console.log("AJAX실패");
    		}
    	})
    })
       $('.carManage').on('click', 'button:contains("판매중단")', function(){
    	console.log("판매중단 버튼 클릭됨")
    	console.log("car_no : ", $(this).data("carNo"));
    	var carNo = $(this).data("carNo");
    	var $thisButton = $(this);
    	$.ajax({
    		type: "post",
    		url: "/car/stop",
			data:{carNumber : carNo},
   			success: function(res){
   				console.log("car/delete AJAX성공")
   				$thisButton.text("판매재개")
   				var $button = $('.carStatus button[data-car-no="' + carNo + '"]');
				if ($button.length) {
				    $button.text('판매보류');
				}
   				
    		},error: function(){
    			console.log("AJAX실패");
    		}
    	})
    	
    })

         $('.carManage').on('click', 'button:contains("판매재개")', function(){
    	console.log("판매재개 클릭됨")
    	console.log("car_no : ", $(this).data("carNo"));
    	var carNo = $(this).data("carNo");
    	var $thisButton = $(this);
    	$.ajax({
    		type: "post",
    		url: "/car/resume",
			data:{carNumber : carNo},
   			success: function(res){
   				console.log("car/delete AJAX성공")
   				$thisButton.text("판매중단")
				var $button = $('.carStatus button[data-car-no="' + carNo + '"]');
				if ($button.length) {
				    $button.text('판매중');
				}
   				
    		},error: function(){
    			console.log("AJAX실패");
    		}
    	})
    })
    
        $('.carManage button:contains("삭제")').click(function(){
    	console.log("삭제 버튼 클릭됨")
    	console.log("car_no : ", $(this).data("carNo"));
    	var carNo = $(this).data("carNo");
    	$.ajax({
    		type: "post",
    		url: "/car/delete",
			data:{carNumber : carNo},
   			success: function(res){
   				console.log("car/delete AJAX성공")
   				var $div = $('div[data-car-no="' + carNo + '"]');
   				$div.hide()
    		},error: function(){
    			console.log("AJAX실패");
    		}
    	})
    })
    
});
</script>
<div class="status-container">
    <div class="status-card">
        <img src="/resources/img/ongoing.png" alt="진행중" />
        <div class="text-container">
            <p>10</p>
            <label>진행중</label>
        </div>
    </div>
    <div class="status-card">
        <img src="/resources/img/ongoing.png" alt="완료" />
        <div class="text-container">
            <p>1</p>
            <label>완료</label>
        </div>
    </div>
    <div class="status-card">
        <img src="/resources/img/ongoing.png" alt="취소" />
        <div class="text-container">
            <p>10</p>
            <label>취소</label>
        </div>
    </div>
</div>
<hr>
<div class="carList">
  <c:forEach items="${carNoList}" var="list">
    <div class="car-Wrap" data-car-no = "${list.CAR_NUMBER }">
      <div class="carImg">
        <img src="${pageContext.request.contextPath}/upload/${list.STORED_NAME}" alt="Uploaded Image"/>
      </div>
      <div class="carSum">
        <div class="carNo">
          <h2>${list.CAR_NUMBER}</h2>
          <div class="carStatus">
          	<c:choose>
          	<c:when test="${list.CAR_STATUS == 0}">
          	<button data-car-no="${list.CAR_NUMBER}">저장됨</button>
          	</c:when>
          	<c:when test="${list.CAR_STATUS == 1}">
          	<button data-car-no="${list.CAR_NUMBER}">승인대기</button>
          	</c:when>
          	<c:when test="${list.CAR_STATUS == 2}">
            <button data-car-no="${list.CAR_NUMBER}">판매중</button>
          	</c:when>
          	<c:otherwise>
          	<button data-car-no="${list.CAR_NUMBER}">판매보류</button>
          	</c:otherwise>
          	</c:choose>
          </div>
        </div>
        <div class="carTitle">
          <h3>${list.CAR_NAME}</h3>
        </div>
        <div class="carPrice">
          <h3>1박당 : ${list.PRICE}</h3> <!-- PRIECE를 PRICE로 수정 -->
          <hr>
        </div>
        <div class="carDone">
        	<c:if test="${list.RENT_COUNT eq 0 }">
        	<h5>호스팅완료 : 0건</h5>
        	</c:if>
        	
        	<c:if test="${list.RENT_COUNT != 0 }">
          		<h5>호스팅완료 : ${list.RENT_COUNT}건</h5>
        	</c:if>
          <div class="carManage">
            <button data-car-no="${list.CAR_NUMBER}">편집</button>
            <c:if test="${list.CAR_STATUS eq 2 }">
            <button data-car-no="${list.CAR_NUMBER}">판매중단</button>
            </c:if>
            <c:if test="${list.CAR_STATUS eq 3 }">
            <button data-car-no="${list.CAR_NUMBER}">판매재개</button>
            </c:if>
            <button data-car-no="${list.CAR_NUMBER}">삭제</button>
          </div>
        </div>
      </div>
    </div>
  </c:forEach>
</div>
<div class="carRegi">
<a class="registerLink" href=".주소">
<span>+</span>
<br>
<span>등록하기</span>

</a>
</div>
<div class="regiForm"></div>
