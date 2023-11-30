<%@page import="java.util.Date"%>
<%@ page import="java.sql.Timestamp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />
<script type="text/javascript">

$(function() {
    // 셀렉트 박스 변경 이벤트 핸들러
    $("#location").change(function() {
        // 선택된 옵션의 값을 가져옴
        var selectedLocation = $(this).val();

        // Ajax 호출
        $.ajax({
            type: "post",
            url: "/market/list",  // 실제 컨트롤러 URL로 변경
            data: {
                location: selectedLocation,
                category: selectedLocation,
                // 여기에 필요한 다른 파라미터 추가 가능
            },
            dataType: "html",
            success: function(res) {
                console.log("AJAX 성공");
                // 성공 시 받은 데이터를 처리
                $("#resultList").html(res);
            },
            error: function() {
                console.log("AJAX 실패");
                // 실패 시 처리
            }
        });
    });

    // 초기 로딩
    loadGroupList();
});

function loadGroupList() {
    // 페이지 로딩 시에도 초기 데이터를 불러올 수 있음
    $("#location").trigger("change");
}

</script>
<style type="text/css">

.row {
    text-align: center;
}

.write-container {
    height: 440px;
    width: 380px;
    margin: 1em auto; 
    text-align: center; 
    border-radius: 15px;
    overflow: hidden;
    border: 1px solid #D3D3D3;
    border-right: 1px solid #D3D3D3;
}

.write-container:hover {
    border-color: #82EB5A;
}

.col-md-4 {
    margin-right: 30px;
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

.no {
   margin-top: 10px;
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
.view {
	font-size: 15px;
}
.write{
	font-size: 15px;
}

.info {
    display: flex; /* Flexbox를 사용하여 내부 요소를 가로로 나열 */
    justify-content: space-between; /* 요소 간에 공간을 균등하게 배치 */
    align-items: center; /* 수직 가운데 정렬 */
   	margin: 15px auto 15px auto;
    
}

.info h6 {
    margin: 0; /* 기본 마진 제거 */
}

.select {
    display: flex; /* Flexbox를 사용하여 내부 요소를 가로로 나열 */
    justify-content: right;
    align-items: center; /* 수직 가운데 정렬 */
   	margin: 15px auto 15px auto;
    
}

label{
	margin : 5px;
}

select {
	width: 100px;
	text-align: center;
}
</style>




<div class="container">


<!-- 작성 공간 -->
<div class="pageTitle">
<h3 id=pageTitle>중고장터 게시판</h3>
<hr>
<div class="select">
<select name="location" id="location">
     <option value="20">전체</option>
     <option value="10">강원</option>
     <option value="9">경기</option>
     <option value="16">경남</option>
     <option value="15">경북</option>
     <option value="5">광주</option>
     <option value="6">대구</option>
     <option value="3">대전</option>
     <option value="4">부산</option>
     <option value="1">서울</option>
     <option value="8">세종</option>
     <option value="7">울산</option>
     <option value="2">인천</option>
     <option value="14">전남</option>
     <option value="13">전북</option>
     <option value="17">제주</option>
     <option value="12">충남</option>
     <option value="11">충북</option>
 </select>
</div>
<hr>

<div style="text-align: right; margin-bottom: 10px;">
<a  href="/market/write?boardCate=3"><button>글쓰기</button></a>
</div>

<div class="resultList" id="resultList"></div>






</div><!-- .container -->
<c:import url="../layout/footer.jsp" />