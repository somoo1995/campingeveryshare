<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<style>
.button-group {
  display: flex; 
}

.button {
  background-color: #efefef; 
  color: #3A3A3A; 
  text-align: center; 
  padding: 10px 20px; 
  text-decoration: none;
  border: none; 
  cursor: pointer; 
  width: 150px;
  transition: background-color 0.3s;
}

.button:hover {
	background-color: #228b22;
	color: white; 
}

.button.active {
	background-color: #228b22;
	color: white;
}

.rentList {
    height: 500px;
    text-align: center;
    padding: 20px; 
    margin-top: 20px; 
    display: flex; 
    flex-direction: column; 
    justify-content: center; 
}

.rentList span {
    display: block; 
    margin-bottom: 5px; 
}

.rentList strong {
    font-size: 24px; 
    margin-bottom: 10px; 
}

.rentList a {
    background-color: #228b22; 
    color: white; 
    padding: 10px 20px; 
    text-decoration: none; 
    border: none; 
    border-radius: 4px; 
    margin-top: 15px; 
    width: 200px; 
    display: block; 
    margin-left: auto; 
    margin-right: auto; 
    transition: background-color 0.3s; 
}
.rentList a:hover {
    background-color: #157347; 
}

</style>

<script type="text/javascript">

$(function () {
	loadBooking()

	$("#btnCurrent").click(function() {
		$(this).addClass("active")
		$("#btnHistory").removeClass("active")
		$("#btnCancel").removeClass("active")
		loadBooking()
	})
	
	$("#btnHistory").click(function() {
		$(this).addClass("active")
		$("#btnCurrent").removeClass("active")
		$("#btnCancel").removeClass("active")
		loadBooking()
	})
	
	$("#btnCancel").click(function() {
		$(this).addClass("active")
		$("#btnCurrent").removeClass("active")
		$("#btnHistory").removeClass("active")
		loadBooking()
	})
	
})

function loadBooking() {
	
	var dataBooking = $(".button.active").data("booking")
	console.log(dataBooking)
	
    $.ajax({
        type: "post"
        , url: "/booking/main"
        , data: {
        	status: dataBooking
        }
        , dataType: "html"
        , success: function( res ) {
           console.log("AJAX 성공")
          $("#resultList").html(res)
			
        }
        , error: function() {
           console.log("AJAX 실패")

        }
     })
}


</script>

<div class="container">

    <div class="pageTitle">
         <h3 id="pageTitle">내 예약</h3>
         <h6 style="color: #A4A4A4; font-weight: 200; font-size: 20px;">캠핑카 예약 내역을 확인할 수 있습니다</h6>
    </div >
        
    <div class="button-group mt-5">
	    <a class="button active" id="btnCurrent" data-booking="now">진행 중</a>
	    <a class="button" id="btnHistory" data-booking="history">이전 내역</a>
	    <a class="button" id="btnCancel" data-booking="cancel">취소 내역</a>
	</div>
		
	<div class="mt-5 mb-5">
		<div class="resultList" id="resultList"></div>
	</div>

</div><!-- .container -->


<c:import url="../layout/footer.jsp" />
