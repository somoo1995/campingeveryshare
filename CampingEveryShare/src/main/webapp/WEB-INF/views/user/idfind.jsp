<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />
<style>
.hstack {
    display: flex;
    align-items: center;
    align-self: stretch;
    justify-content: flex-end;
}
</style>
<script type="text/javascript">
    function checkDuplicate(input, url, displayBlock, emptyMessage, successMessage, failureMessage) {
        var value = input.value;
        var displayBlock = $("#" + displayBlock);

        console.info("checkDuplicate::" + value);

        displayBlock.show();

        if (value.trim() == '') {
            displayBlock.text(emptyMessage);
            console.log(emptyMessage);
            return;
        }

        $.ajax({
            type: "get",
            url: url + value,
            dataType: "text",
            success: function (response) {
                if (response == "true") {
                    console.log(successMessage);
                    displayBlock.text(successMessage);
                } else {
                    console.log(failureMessage);
                    displayBlock.text(failureMessage);
                }
            }
        });
    }
	
	
// 	$(function() {
// 		$("#email").focus();	
// 	})
	 
 // email 중복 체크
    function emailDupleCheck(input) {
        checkDuplicate(
            input,
            "/user/emailCheck/",
            "emailDupleBlock",
            "이메일을 입력해 주세요.",
            "이메일을 찾을 수 없습니다 회원가입을 진행해주세요",
            ""
        );    
    }

    // 이름 체크
    function nameCheck() {
        var userName = $("#userName");
        var nameDupleBlock = $("#nameDupleBlock");
        console.info("nameCheck::" + userName.val().trim());

        if (userName.val().trim() === '') {
            nameDupleBlock.text("이름을 입력해 주세요.");
            console.log("이름을 입력해 주세요.");
            nameDupleBlock.show();
        } else {
            nameDupleBlock.hide();
        }
    }

</script>

<div class="container">
	<div class="pageTitle">
	<h3 id="pageTitle">아이디 찾기</h3>
	<a>아이디는 가입시 입력한 이메일을 통해 찾을 수 있습니다</a>
	<hr>	
	</div>
<div class="col-6 mx-auto my-5">
<form id="idfind" action="./idfind" method="post">

<div class="input-group has-validation">
	<span class="input-group-text" id="basic-addon1">
	   <svg xmlns="http://www.w3.org/2000/svg" width="50" height="40" fill="currentColor" class="bi bi-envelope-at" viewBox="0 0 16 16">
		  <path d="M2 2a2 2 0 0 0-2 2v8.01A2 2 0 0 0 2 14h5.5a.5.5 0 0 0 0-1H2a1 1 0 0 1-.966-.741l5.64-3.471L8 9.583l7-4.2V8.5a.5.5 0 0 0 1 0V4a2 2 0 0 0-2-2H2Zm3.708 6.208L1 11.105V5.383l4.708 2.825ZM1 4.217V4a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v.217l-7 4.2-7-4.2Z"/>
		  <path d="M14.247 14.269c1.01 0 1.587-.857 1.587-2.025v-.21C15.834 10.43 14.64 9 12.52 9h-.035C10.42 9 9 10.36 9 12.432v.214C9 14.82 10.438 16 12.358 16h.044c.594 0 1.018-.074 1.237-.175v-.73c-.245.11-.673.18-1.18.18h-.044c-1.334 0-2.571-.788-2.571-2.655v-.157c0-1.657 1.058-2.724 2.64-2.724h.04c1.535 0 2.484 1.05 2.484 2.326v.118c0 .975-.324 1.39-.639 1.39-.232 0-.41-.148-.41-.42v-2.19h-.906v.569h-.03c-.084-.298-.368-.63-.954-.63-.778 0-1.259.555-1.259 1.4v.528c0 .892.49 1.434 1.26 1.434.471 0 .896-.227 1.014-.643h.043c.118.42.617.648 1.12.648Zm-2.453-1.588v-.227c0-.546.227-.791.573-.791.297 0 .572.192.572.708v.367c0 .573-.253.744-.564.744-.354 0-.581-.215-.581-.8Z"/>
	   </svg>
	 </span>
	<div class="form-floating is-invalid">
		<input type="email" id="email" name="email" class="form-control" onblur="emailDupleCheck(this)">
	    <label for="floatingInputGroup2">이메일*</label>
  	</div>
	<div id="emailDupleBlock" class="invalid-feedback"  style="display:none">
		<p id="emailDupleText"></p>
	</div>
</div>
	
<div class="input-group has-validation">
	<span class="input-group-text" id="basic-addon1">
	<svg xmlns="http://www.w3.org/2000/svg" width="50" height="40" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
		<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"/>
	</svg>
	</span>
	<div class="form-floating is-invalid">
		<input type="text" class="form-control" id="userName" name="userName" onblur="nameCheck()">
	    <label for="floatingInputGroup2">이름을 입력해 주세요</label>
  	</div>
	<div id="nameDupleBlock" class="invalid-feedback"  style="display:none">
		<p id="nameDupleText"></p>
	</div>
</div>

	

	<div class="row mb-3 justify-content-center">
		<button class="btn btn-outline-success" id="idfind">아이디 찾기</button>
	</div>	

	<a>비밀번호를 분실 하셨나요? <a href="./pwfind">비밀번호 찾기</a> </a>	

</form>
</div>

</div><!-- .container -->

<c:import url="../layout/footer.jsp" />