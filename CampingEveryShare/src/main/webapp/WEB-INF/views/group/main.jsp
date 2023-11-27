<%@page import="java.util.Date"%>
<%@ page import="java.sql.Timestamp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<link rel="stylesheet" href="../resources/css/group.css?after">

<div class="container">

<!-- 작성 공간 -->
<div class="pageTitle">
<h3>모집 게시판</h3>
<h6 style="color: #A4A4A4; font-weight: 200; font-size: 20px;">캠핑 모집 게시글을 작성하고 조회할 수 있습니다.</h6>
<hr>
<div style="text-align: right; margin-bottom: 10px;">
<a  href="/group/write?boardCate=4"><button class="btn_write">글쓰기</button></a>
</div>

<c:import url="./list.jsp"></c:import>

</div><!-- .pageTitle -->
</div><!-- .container -->
<c:import url="../layout/pagination.jsp" />
<c:import url="../layout/footer.jsp" />