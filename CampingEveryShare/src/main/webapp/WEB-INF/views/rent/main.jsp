<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<style type="text/css">

.pageTitle h6 {
	color: #A4A4A4; 
	font-weight: 200; 
	font-size: 20px;
}

.locationSelect {
	text-align: end;
	margin-right: 15px;
}

input[type="radio"]:checked {
    background-color: #228b22;
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
    background-color: #2ECC71; 
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
    background-color: #45a049; 
}

</style>

<script type="text/javascript">
$(function () {
	
	var areaCate = $('input[name=areaCate]:checked').val()
	loadList(areaCate)
	
	console.log(areaCate)
	
	$("#areaAll").change(function() {
		
		if($(this).is(":checked")){
			$(".selectSEL").hide()
			$(".selectICN").hide()
			areaCate = $('input[name=areaCate]:checked').val()
			console.log("areaCate : " + areaCate)
			loadList(areaCate)
		}
	})
	
	$("#areaSEL").change(function() {
		
		if($(this).is(":checked")){
			$(".selectSEL").show()
			$(".selectICN").hide()
			areaCate = $('input[name=areaCate]:checked').val()
			console.log("areaCate : " + areaCate)
			loadList(areaCate)
			
		}
	})
	
	$("#areaICN").change(function() {
		
		if($(this).is(":checked")){
			$(".selectICN").show()
			$(".selectSEL").hide()
			areaCate = $('input[name=areaCate]:checked').val()
			console.log("areaCate : " + areaCate)
			loadList(areaCate)
			
		}
	})

})

function loadList(areaCate) {
	
	$.ajax({
		type: "post"
		, url: "/rent/list"
		, data: {
			location: areaCate
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


<!-- 작성 공간 -->
<div class="pageTitle">
<h3 id="pageTitle">캠핑카 대여</h3>
<h6>캠핑카를 찾아 여행을 떠나보세요!</h6>
</div>


<div class="col-2 mb-3 float-end locationSelect">
		<input type="radio" class="areaCate" id="areaAll" name="areaCate" value="0" checked="checked">전체
		<input type="radio" class="areaCate" id="areaSEL" name="areaCate" value="1">서울
		<input type="radio" class="areaCate" id="areaICN" name="areaCate" value="2">인천
</div>

<div class="clearfix"></div>

<c:if test="${not empty hasData and hasData  }">
	<div id="resultList"></div>
</c:if>

<c:if test="${empty hasData or not hasData }">
	<div class="rentList">
		<strong>등록된 캠핑카가 없습니다!</strong><br>
		<span>캠핑카를 등록하시겠어요?</span><br>
		<a href="/car/main" class="exploreButton">살펴보기</a>
	</div>

</c:if>

</div><!-- .container end -->


<c:import url="../layout/footer.jsp" />