<%@page import="java.util.Date"%>
<%@ page import="java.sql.Timestamp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<link rel="stylesheet" href="../resources/css/group.css?after">
<script type="text/javascript">

$(function() {
    // 셀렉트 박스 변경 이벤트 핸들러
    $("#location").change(function() {
        // 선택된 옵션의 값을 가져옴
        var selectedLocation = $(this).val();

        // Ajax 호출
        $.ajax({
            type: "post",
            url: "/group/list",  // 실제 컨트롤러 URL로 변경
            data: {
                location: selectedLocation,
//                 category: selectedLocation,
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
<div class="container">

<!-- 작성 공간 -->
<div class="pageTitle">
<h3>모집 게시판</h3>
<h6 style="color: #A4A4A4; font-weight: 200; font-size: 20px;">캠핑 모집 게시글을 작성하고 조회할 수 있습니다.</h6>
<hr>
<!-- <div> -->
<!-- 	<input type="radio" class="recruitStatus" id="payAll" name="recruitStatus" value="2" checked="checked">전체 -->
<!-- 	<input type="radio" class="recruitStatus" id="payNo" name="recruitStatus" value="0"> 모집 중 -->
<!-- 	<input type="radio" class="recruitStatus" id="payYes" name="recruitStatus" value="1" >모집 완료 -->
<!-- </div> -->
<div>

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
<a  href="/group/write?boardCate=4"><button class="btn_write">글쓰기</button></a>
</div>

<div class="resultList" id="resultList"></div>

</div><!-- .pageTitle -->
</div><!-- .container -->

<c:import url="../layout/footer.jsp" />