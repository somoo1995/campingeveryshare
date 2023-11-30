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
	justify-content: space-around;
	text-align: center;
	
}
.available{
	width: 200px;
	height: 100px;
	background-color: #E6E6E6;
}
.expectation{
	width: 200px;
	height: 100px;
	background-color: #E6E6E6;
}
.total{
	width: 200px;
	height: 100px;
	background-color: #E6E6E6;
}
.cell-wrap{
	width: 1280px;
	height: 1500px;
	background-color: #E6E6E6;
	display: flex;
	flex-direction: column;
}
.link-wrap{
	width: 1280px;
	height: 200px;
	display: flex;
	justify-content: space-around;
}
.proceeds, .withdraw, .charge{
	margin-top: 40px;
	width: 200px;
	height: 100px;
	background-color: white;
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
	width: 1000px;
	height: 120px;
	margin-left: 120px;
	display: flex;
	justify-content: space-around;
	padding-top: 30px;
}
.account{
	background-color: white;
	width: 350px;
	height: 50px;
	text-align: center;
	padding-top: 10px;
	font-weight: 400;
	font-size: 1.3em;
}


.info-left{
	border: 1px solid #D8D8D8;
	width: 100px;
	height:100px;
	text-align: center;
}
.info-left span{
	font-size: 1.4em;
	font-weight: 600;
}
.info-right{
	border: 1px solid #D8D8D8;
	width: 900px;
	height: 100px;
}
.amount{
	color: #5882FA;
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
	margin-left: 450px;
}
.commit{
	display: none;
}
.info-right span{
	font-weight: 600;
	font-size: 1.3em;
}
</style>
<script>
var category;
var sellFlag;
$(document).ready(function() {
    // 선택된 rent_no를 저장할 배열
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
        $(this).css("background-color", "#5882FA");
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
        $(this).css("background-color", "#5882FA");
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
        $(this).css("background-color", "#5882FA");
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
		$(".proceeds").css("background-color","#5882FA");
		$('.commit').show()
	}else if(category === 2){
		$(".withdraw").css("background-color","#5882FA");
	}else if(category === 3){
		$(".charge").css("background-color","#5882FA");
	}
	if(category === 0){
		$('.proceeds').click();
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
수익금 내역
</div>
<div class="withdraw">
출금 내역
</div>
<div class="charge">
호스팅별 수수료 계산서
</div>
</div> <!-- ling-wrap div end -->
<hr>

<div class="cellHistory-wrap">
<c:if test="${paging.category == 1 }">
<c:forEach items="${list }" var="list">
<div class="proceeds-info">
<div class="info-left">
<c:if test="${list.RENT_STATUS == 0}">
<span>진행중</span>
</c:if>
<c:if test="${list.RENT_STATUS == 1}">
<span>이전내역</span>
</c:if>
<c:if test="${list.RENT_STATUS == 2}">
<span>취소됨</span>
</c:if>
</div>
<div class="info-right">
<span>수익금 <span class="amount">${list.PRICE }</span><span>원</span></span><br>
<span>${list.CAR_NUMBER } | 주문 접수일 : ${list.BOOKING_DATE } | 실거래 금액 : ${list.DEDUCT_PRICE }원</span>
<c:if test="${list.INCOME_STATUS == 0 }">
<input type="checkbox" data-no="${list.RENT_NO }" class="rent-checkbox">
</c:if> 
<br>
<c:if test="${list.INCOME_STATUS == 0 }">
<span class="canWith">출금가능</span>
</c:if> 
<c:if test="${list.INCOME_STATUS == 1 }">
<span class="waitingWith">출금 대기중</span>
</c:if> 
<c:if test="${list.INCOME_STATUS == 2 }">
<span class="doneWith">출금 완료</span>
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
<span>${list.CAR_NUMBER } | 출금 신청일 : ${list.POST_DATE } | 출금 금액 : ${list.DEDUCT_AMOUNT }</span>
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
<span>출금계좌 :${indexInfo.account }</span>
</div>
<div class="account-change-button">
<button class="btn btn-primary">출금계좌 신청/변경하기</button>
</div>
<div class="apply-button">
<button class="btn btn-primary commit">출금신청하기</button>
</div>
</div>
</div><!-- cell-wrap div end --><!-- 전체 div end -->
