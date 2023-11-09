<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<script type="text/javascript">
	$(function() {
		$("#userId").focus();	
	})
	
	window.onload = function() {
			document.getElementByUserId('submit').onclick = function() {
				
				if ( document.pwfind.userId.value.trim() == '' ) {
					alert( 'ID를 입력해주세요' );
					return false;
				}
				if ( document.pwfind.userName.value.trim() == '' ) {
					alert( '이름을 입력해주세요' );
					return false;
				}
				if ( document.pwfind.email.value.trim() == '' ) {
					alert( '메일을 입력해주세요' );
					return false;
				}
				document.pwfind.submit();
			}
		}

</script>

<div class="container">
<h1>비밀번호 찾기</h1>
<a>비밀번호는 가입시 입력한 이메일을 통해 찾을 수 있습니다</a>
<hr>

<div class="col-6 mx-auto my-5">
<form action="./pwfind" method="post" class="container" name="pwfind">

	<div class="row mb-3">
		<label for="userId" class="col-2 col-form-label"></label>
		<div class="col-8">
			<input type="text" class="form-control" id="userId" name="userId" placeholder="아이디를 입력해주세요." required="required">
		</div>
	</div>
	
	<div class="row mb-3">
		<label for="userName" class="col-2 col-form-label"></label>
		<div class="col-8">
			<input type="text" class="form-control" id="userName" name="userName" placeholder="이름을 입력해주세요." required="required">
		</div>
	</div>

	<div class="row mb-3">
		<label for="email" class="col-2 col-form-label"></label>
		<div class="col-8">
			<input type="text" class="form-control" id="email" name="email" placeholder="회원가입시 입력한 메일을 입력해주세요." required="required">
		</div>
	</div>
	
	
	<div class="row mb-3 justify-content-center">
		<button type="submit" id="submit" class="btn btn-outline-success">비밀번호 찾기</button>
	</div>	

</form>
</div>

</div><!-- .container -->

<c:import url="../layout/footer.jsp" />