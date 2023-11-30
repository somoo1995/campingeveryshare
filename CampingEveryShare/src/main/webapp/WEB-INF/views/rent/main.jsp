<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<style type="text/css">

.list-container {
    height: 470px;
    width: 380px;
    margin: 1em auto; 
    text-align: center; 
    border-radius: 15px;
	overflow: hidden; 
    border: 1px solid #D3D3D3;
    border-right: 1px solid #D3D3D3;
}

.list-container:hover {
	cursor: pointer;
	border-color: #82EB5A;
}

.preview {
	margin: 15px auto 15px auto;
	width: 350px;
	height: 300px;
	display: flex;
	object-fit: cover;
	justify-content: center;
	align-items: center;
	background-size: cover; 
	background-repeat: no-repeat;
	background-position: center center;
}

.info {
    display: flex; /* Flexbox를 사용하여 내부 요소를 가로로 나열 */
    justify-content: space-between; /* 요소 간에 공간을 균등하게 배치 */
    align-items: center; /* 수직 가운데 정렬 */
   	margin: 15px auto 15px auto;
    
}
.title {
    margin-top: 10px;
    color: black;
    font-weight: bold;
    font-size: 25px;
    text-align: left;
    overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
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
</div>


<div class="col-2 mb-3 float-end">
	<div>
		<input type="radio" class="areaCate" id="areaAll" name="areaCate" value="0" checked="checked">전체
		<input type="radio" class="areaCate" id="areaSEL" name="areaCate" value="1">서울
		<input type="radio" class="areaCate" id="areaICN" name="areaCate" value="2">인천
	</div>
	
	
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