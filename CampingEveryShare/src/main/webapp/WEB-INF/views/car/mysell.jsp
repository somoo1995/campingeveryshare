<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
.mySell{
	display: flex;
	flex-direction: column;
}
.index-wrap{
	display: flex;
	width: 1280px;
	height: 120px;
	margin-top: 50px;
	margin-bottom: 20px;
 	justify-content: center; 
	text-align: center;
	font-size: 12px;
	
}

.available .expectation .total {
	border-radius: 20px;
 	border: 1px solid #1aba00; 
	
}

.available{
	width: 200px;
	height: 100px;
	background-color: #e4ffd9;
	border-radius: 10px;
}
.available span{
	font-weight: 600;
	font-size: 1.5em;
}
.expectation{
	width: 200px;
	height: 100px;
	background-color: #e4ffd9;
	border-radius: 10px;
/* 	margin-left: 10px; */
}
.expectation span{
	font-weight: 600;
	font-size: 1.5em;
}
.total{
	width: 200px;
	height: 100px;
	background-color: #e4ffd9;
	border-radius: 10px;
}
.total span{
	font-weight: 600;
	font-size: 1.5em;
}
.cell-wrap{
	width: 1280px;
	height: 1500px;
	display: flex;
	flex-direction: column;
	border-radius: 20px;
	border: 1px solid #e3e3e3;
}
.link-wrap{
	width: 1280px;
	height: 200px;
	display: flex;
	justify-content: center;
}
.proceeds, .withdraw, .charge{
	margin-top: 40px;
	width: 200px;
	height: 100px;
/*  	border: 1px solid #efefef; */
	background-color: #cecece;
	color: #fff;
	padding-top: 35px;
	text-align: center;
	border-radius: 20px;
}

.proceeds span, .withdraw span, .charge span{
	font-weight: 800;
	font-size: 2em;
}
.proceeds:hover, .withdraw:hover, .charge:hover{
	cursor: pointer;
}
.cellHistory-wrap{
	width: 1000px;
	height: 1050px;
	margin-left: 120px;
	background-color: white;
}
.proceeds-info, .withdraw-info, .charge-info{
	display: flex;
	border: 1px solid #D8D8D8;
	widht: 1000px;
	height: 100px;
	margin-bottom: 3px;
}
.apply-wrap{
/* 	width: 1000px; */
/* 	height: 120px; */
/* 	margin-left: 120px; */
	display: flex;
	justify-content: center;
	padding-top: 30px;
	column-gap: 150px;
}
.account{
	background-color: white;
	width: 350px;
	height: 50px;
 	text-align: center; 
/* 	padding-top: 10px; */
	font-weight: 400;
	font-size: 1.3em;
	display: flex;
    justify-content: center;
    align-items: center;
    color: #1aba00;
	
}


.info-left{
	border: 1px solid #D8D8D8;
	width: 100px;
	height:100px;
	text-align: center;
	width: 300px;
    font-size: 15px;
    color: gray;
    display: flex;
    justify-content: center;
    align-items: center;
}
.info-left span{
	font-size: 1.4em;
	font-weight: 600;
}
.info-right{
	border: 1px solid #D8D8D8;
	width: 900px;
	height: 100px;
	font-size: 15px;
}
.amount{
	color: #1ABA00;
	font-weight: 600;
}
.canWith{
	font-weight: 600;
	color: #5858FA;
}
.waitingWith{
	font-weight: 600;
	color: #FF0040;
}
.doneWith{
	font-weight: 600;
	color: #000000;
}
.info-right input{
	margin-left: 800px;
	width: 100px;
	height: 33px;
	margin-top: -50px;
}
.sellPagination{
	margin-left: 0px;
}
.commit{
	display: none;
}
.info-right span{
	font-weight: 600;
	font-size: 1.3em;
}
.custom-modal {
    position: fixed;
    z-index: 1000;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5); /* 반투명 배경 */
    display: flex;
    align-items: center;
    justify-content: center;
}

.custom-modal-content {
    background-color: #fff;
    margin: 5% auto; /* 모달의 위치를 위로 조정 */
    padding: 30px;
    border-radius: 10px;
    width: 30%;
    box-shadow: 0 5px 15px rgba(0,0,0,0.3);
    position: relative;
}

.modal-body {
    display: flex;
    flex-direction: column;
    margin-top: 20px;
}

.modal-body input,
.modal-body select {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 1em;
}

#applyButton {
    padding: 10px 15px;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 1em;
}

#applyButton:hover {
    background-color: #0056b3;
}

.close-button {
    color: #000;
    position: absolute;
    top: 15px;
    right: 20px;
    font-size: 25px;
    cursor: pointer;
}

.request {
	font-size: 20px;
	background-color: #1aba00;
	border: none;
	border-radius: 10px;
}

</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script>
var category;
var sellFlag;
$(document).ready(function() {
    $(".request").click(function() {
        // 사용자 정의 모달을 표시
        $("#customModal").css("display", "flex");
    });

    // 모달 닫기 버튼 클릭 이벤트
    $(".close-button").click(function() {
        // 모달 숨기기
        $("#customModal").css("display", "none");
    });
    
    $("#applyButton").click(function() {
        // 여기에 신청 로직 추가
        // 예: 계좌번호와 은행 정보 수집 및 처리
        var accountNumber = $("#accountNumber").val();
    	if(accountNumber === ''){
    		alert("계좌를 입력해주세요")
    		return;
    	}
        var bank = $("#bankSelect").val();
        if(bank === '0'){
        	alert("은행을 선택해주세요!")
        	return;
        }
        console.log("계좌번호: " + accountNumber + ", 은행: " + bank);

        $.ajax({
        	type: "post"
        	,url: "/car/regiAccount"
        	,data:{
        		bankAccount: accountNumber,
        		bankName: bank
        	}
        	,success: function(res){
        		console.log("/car/regiAccount AJAX성공")
        		$("#customModal").css("display", "none");
        		alert("출금계좌 신청/변경이 완료되었습니다.");
        		location.href = location.pathname + "?autoClick=btnMySell";
        	},error: function(res){
        		console.log("/car/regiAccount AJAX 실패")
        	}
        })
    });
    
    var selectedRentNos = [];

    // 체크박스 변경 이벤트
    $('.rent-checkbox').change(function() {
        var rentNo = $(this).data('no');

        if($(this).is(':checked')) {
            // 체크박스가 선택된 경우, 배열에 추가
            selectedRentNos.push(rentNo);
        } else {
            // 체크박스 선택 해제된 경우, 배열에서 제거
            var index = selectedRentNos.indexOf(rentNo);
            if (index > -1) {
                selectedRentNos.splice(index, 1);
            }
        }

        // 선택된 rent_no 확인 (테스트용)
        console.log(selectedRentNos);
    });


    $(".proceeds").click(function() {
        console.log("proceeds 클릭됨");
        $(this).css("background-color", "#1ABA00");
        $('.withdraw').css("background-color","white");
        $('.charge').css("background-color","white");
        category = 1;
        
		$.ajax({
			type:"get"
			,url: "/car/mysell"
			,data:{category:category}
			, dataType: "html"
			,success: function(res){
				console.log("AJAX성공")
				$('.mySell').html(res)
			},error: function(){
				console.log("AJAX실패")
			}
		})
    });
    $(".withdraw").click(function() {
        console.log("proceeds 클릭됨");
        $(this).css("background-color", "#1ABA00");
        $('.charge').css("background-color","white")
        $('.proceeds').css("background-color","white")
        category = 2;
        $.ajax({
			type:"get"
			,url: "/car/mysell"
			,data:{category:category}
			,success: function(res){
				console.log("AJAX성공")
				$('.mySell').html(res)
			},error: function(){
				console.log("AJAX실패")
			}
		})
    });
        
    $(".charge").click(function() {
        console.log("proceeds 클릭됨");
        $(this).css("background-color", "#1ABA00");
        $('.withdraw').css("background-color","white")
        $('.proceeds').css("background-color","white")
        category = 3;
        $.ajax({
			type:"get"
			,url: "/car/mysell"
			,data:{category:category}
			,success: function(res){
				console.log("AJAX성공")
				$('.mySell').html(res)
			},error: function(){
				console.log("AJAX실패")
			}
		})
    });
    
    $('.commit').click(function(){
    	console.log("출금신청 버튼 클릭됨");
    	console.log(selectedRentNos);
        $.ajax({
            type: "get",
            url: "/car/commit",
            data: {rentNos: selectedRentNos},
            traditional: true,
            success: function(res){
                console.log("commit AJAX성공");
                console.log(res);
                if(res==="success"){
                	alert("출금 신청이 완료되었습니다.");
                	location.href = location.pathname + "?autoClick=btnMySell";
                }
            },
            error: function(){
                console.log("commit AJAX실패");
            }
        });
    })
    
	category = ${paging.category}
	console.log(category);
	console.log("카테고리 값 확인")
	if(category ===1){
		$(".proceeds").css("background-color","#1ABA00");
		$('.commit').show();
	}else if(category === 2){
		$(".withdraw").css("background-color","#1ABA00");
		$('.commit').hide();
	}else if(category === 3){
		$(".charge").css("background-color","#1ABA00");
		$('.commit').hide();
	}
});

</script>
<div class="index-wrap">
<div class="available">
<span>출금 가능 수익금</span><br>
<span>${indexInfo.avalible } 원</span>
</div>
<div class="expectation">
<span>예상 수익금</span><br>
<span>${indexInfo.expectation } 원</span>
</div>
<div class="total">
<span>총 수익금</span><br>
<span>${indexInfo.total } 원</span>
</div>

</div>

<div class="cell-wrap"> <!-- cell-wrap div --><!-- 전체 div -->
<div class="link-wrap"> <!-- ling-wrap div -->
<div class="proceeds">
<span>수익금 내역</span>
</div>
<div class="withdraw">
<span>출금 내역</span>
</div>
<div class="charge">
<span>호스팅 수수료 계산서</span>
</div>
</div> <!-- ling-wrap div end -->
<hr>

<div class="cellHistory-wrap">
<c:if test="${paging.category == 1 }">
<c:forEach items="${list }" var="list">
<div class="proceeds-info">
<div class="info-left">
<c:if test="${list.RENT_STATUS == 0}">
<span>진행 중</span>
</c:if>
<c:if test="${list.RENT_STATUS == 1}">
<span>이전 내역</span>
</c:if>
<c:if test="${list.RENT_STATUS == 2}">
<span>취소됨</span>
</c:if>
</div>
<div class="info-right">
<span style="margin-left: 10px;">수익금 <span class="amount">${list.PRICE }</span><span>원</span></span><br>
<span style="margin-left: 10px;">${list.CAR_NUMBER } | 주문 접수일 : ${list.BOOKING_DATE } | 실거래 금액 : ${list.DEDUCT_PRICE }원</span>
<c:if test="${list.INCOME_STATUS == 0 }">
<input type="checkbox" data-no="${list.RENT_NO }" class="rent-checkbox">
</c:if> 
<br>
<c:if test="${list.INCOME_STATUS == 0 }">
<span style="margin-left: 10px;" class="canWith">출금 가능</span>
</c:if> 
<c:if test="${list.INCOME_STATUS == 1 }">
<span style="margin-left: 10px;" class="waitingWith">출금 대기중</span>
</c:if> 
<c:if test="${list.INCOME_STATUS == 2 }">
<span style="margin-left: 10px;" class="doneWith">출금 완료</span>
</c:if> 

</div>
</div>
</c:forEach>
</c:if>
<c:if test="${paging.category == 2 }">
<c:forEach items="${list }" var="list">
<div class="withdraw-info">
<div class="info-left">
<c:if test="${list.INCOME_STATUS == 1 }">
<span>출금대기중</span>
</c:if>
<c:if test="${list.INCOME_STATUS == 2 }">
<span>출금 완료</span>
</c:if>
</div>
<div class="info-right">
<span style="margin-left: 10px;">${list.CAR_NUMBER } | 출금 신청일 : ${list.POST_DATE } | 출금 금액 : ${list.DEDUCT_AMOUNT }</span>
</div>
</div>
</c:forEach>
</c:if>
<c:if test="${paging.category == 3 }">
<c:forEach items="${list }" var="list">
<div class="charge-info">
<div class="info-left">
<c:if test="${list.INCOME_STATUS == 1 }">
<span>출금 대기중</span>
</c:if>
<c:if test="${list.INCOME_STATUS == 2 }">
<span>출금 완료</span>
</c:if>
</div>
<div class="info-right">
<span>${list.CAR_NUMBER } | 출금 신청일 : ${list.POST_DATE } | 수익금 : ${list.AMOUNT } | 수수료 : ${list.CHARGE} | 실제 수익금 : ${list.DEDUCT_AMOUNT }</span>
</div>
</div>
</c:forEach>
</c:if>



</div>
<br>
<div class="sellPagination">
<c:import url="../car/sellPagination.jsp" />
</div>


<div class="apply-wrap">
<div class="account">
<span style="font-size: 20px; font-weight: bold;">출금계좌: ${indexInfo.account }</span>
</div>
<div class="account-change-button">
<button style="padding: 10px; border-radius:10px; background-color: #1aba00; color: #fff; font-size: 20px; font-weight: bold;" class="btn request">출금계좌 신청 / 변경하기</button>
</div>
<div class="apply-button">
<button style="padding: 11px; border-radius: 10px; background-color: #1aba00; color: #fff; font-size: 20px; font-weight: bold; border: none;" class="btn commit">출금 신청하기</button>
</div>
</div>

</div><!-- cell-wrap div end --><!-- 전체 div end -->
<div id="customModal" class="custom-modal" style="display:none;">
    <div class="custom-modal-content">
        <span class="close-button">&times;</span>
        <h2>출금계좌 신청/변경</h2>
        <hr>
        <div class="modal-body">
            <input type="text" placeholder="계좌번호" id="accountNumber">
            <select id="bankSelect">
            	<option value="0">----은행명----</option>
			    <option value="KB국민은행">KB국민은행</option>
			    <option value="신한은행">신한은행</option>
			    <option value="우리은행">우리은행</option>
			    <option value="하나은행">하나은행</option>
			    <option value="SC제일은행">SC제일은행</option>
			    <option value="케이뱅크">케이뱅크</option>
			    <option value="카카오뱅크">카카오뱅크</option>
			    <option value="토스뱅크">토스뱅크</option>
			    <option value="한국산업은행">한국산업은행</option>
			    <option value="중소기업은행">중소기업은행</option>
			    <option value="한국수출입은행">한국수출입은행</option>
			    <option value="NH농협은행">NH농협은행</option>
			    <option value="수협은행">수협은행</option>
			    <option value="대구은행">대구은행</option>
			    <option value="부산은행">부산은행</option>
			    <option value="경남은행">경남은행</option>
			    <option value="광주은행">광주은행</option>
			    <option value="전북은행">전북은행</option>
			    <option value="제주은행">제주은행</option>
			</select>
            <button id="applyButton" class="btn btn-primary">신청하기</button>
        </div>
    </div>
</div>



