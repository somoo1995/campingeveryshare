<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        width: 1300px;
        height: 200px;
        background-color: #D8D8D8;
        display: flex;
        justify-content: center; /* 가운데 정렬 */
        align-items: center; /* 세로 중앙 정렬 */
        border: none; /* 테두리 없음 */
    }
    
    .carRegi a {
        text-decoration: none; /* 링크 밑줄 제거 */
        color: black; /* 링크 색상 */
        font-size: 1.5em; /* 폰트 크기 */
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
    
</style>
<script type="text/javascript">
$(document).ready(function(){
    $(".carRegi").on("click", ".registerLink", function(event) {
        event.preventDefault(); // 이 부분이 링크의 기본 동작을 막습니다.
        $.ajax({
            type: "get",
            url: "/car/regi",
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
<div class="carRegi">
<a class="registerLink" href=".주소">
<span>+</span>
<br>
<span>등록하기</span>

</a>
</div>
<div class="regiForm"></div>
