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

    // id 중복 체크
    function idDupleCheck(input) {
        checkDuplicate(
            input,
            "/user/idCheck/",
            "idDupleBlock",
            "아이디를 입력해 주세요.",
            "사용가능한 id 입니다.",
            "사용할 수 없는 아이디입니다. 다른 아이디를 입력해 주세요."
        );
    }

    // email 중복 체크
    function emailDupleCheck(input) {
        checkDuplicate(
            input,
            "/user/emailCheck/",
            "emailDupleBlock",
            "이메일을 입력해 주세요.",
            "사용가능한 email 입니다.",
            "사용할 수 없는 이메일입니다. 다른 이메일을 입력해 주세요."
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

    // 닉네임 중복 체크
    function nickDupleCheck(input) {
        checkDuplicate(
            input,
            "/user/nickCheck/",
            "nickDupleBlock",
            "닉네임을 입력해 주세요.",
            "사용가능한 닉네임 입니다.",
            "사용할 수 없는 닉네임입니다. 다른 닉네임을 입력해 주세요."
        );
    }

    $(document).ready(function () {
        // 회원가입 버튼 클릭 시 실행될 코드
        $("#joinButton").click(function () {
            // phone 인풋의 값이 비어있으면 0을 넣어줌
            if ($("#phone").val().trim() === '') {
                $("#phone").val('0');
            }

            // 비밀번호 값을 가져오는 부분 수정
            var userPw = $("#userPw").val();
            var userPwConfirm = $("#userPwConfirm").val();

            // 비밀번호가 서로 다를 경우
            if (userPw !== userPwConfirm) {
                console.log("동일한 비밀번호가 아님");
                $("#pwDupleBlock").text("동일한 비밀번호가 아님");
                // TODO: ptag 표시
                return;
            }

            console.log("동일한 비밀번호입니다.");
            $("#pwDupleBlock").text("동일한 비밀번호입니다.");
            // TODO: ptag 표시
        });
    });

    function passwordCheck() {
        var userPw = $("#userPw").val();
        var userPwConfirm = $("#userPwConfirm").val();
        var pwDupleBlock = $("#pwDupleBlock");

        pwDupleBlock.show();

        // 비밀번호가 입력되지 않았을 경우
        if (!userPw || !userPwConfirm) {
            console.log("비밀번호를 입력하세요.");
            pwDupleBlock.text("비밀번호를 입력하세요.");
            // TODO: ptag 표시
            return;
        }

        // 비밀번호가 서로 다를 경우
        if (userPw !== userPwConfirm) {
            console.log("동일한 비밀번호가 아님");
            pwDupleBlock.text("동일한 비밀번호가 아님");
            // TODO: ptag 표시
            return;
        }

        console.log("동일한 비밀번호입니다.");
        pwDupleBlock.text("동일한 비밀번호입니다.");
        // TODO: ptag 표시
    }
</script>


  
<form id="joinForm" action="/user/join" method="post">
<div class="container">
	<div class="pageTitle">
	<h3 id="pageTitle">회원가입</h3>
	<hr>	
	</div>
<div class="row g-3 align-items-center">
	<div class="hstack gap-3 col-8">
	    <div class="p-2">
	    <label for="profile" class="col-form-label" width="100" height="100">프로필 사진선택</label>
    	</div>
	    <div class="p-2">
	        <input type="radio" name="profile" value="1" checked="checked">
	        <img src="/resources/img/profile1.png" alt="프로필1" class="profile1" id="profile-img-1" width="100" height="100">
	    </div>
	    <div class="p-2">
	        <input type="radio" name="profile" value="2">
	        <img src="/resources/img/profile2.png" alt="프로필" class="profile2" id="profile-img-2" width="100" height="100">
	    </div>
    </div>

	<div class="hstack gap-3 col-8">
	    <div class="p-2">
	        <input type="radio" name="profile" value="3">
	        <img src="/resources/img/profile3.png" alt="프로필3" class="profile3" id="profile-img-3" width="100" height="100">
	    </div>
	    <div class="p-2">
	        <input type="radio" name="profile" value="4">
	        <img src="/resources/img/profile4.png" alt="프로필4" class="profile4" id="profile-img-4" width="100" height="100">
	    </div>
	    <div class="p-2">
	        <input type="radio" name="profile" value="5">
	        <img src="/resources/img/profile5.png" alt="프로필5" class="profile5" id="profile-img-5" width="100" height="100">
	    </div>
	</div>
	
	<div class="row g-3 align-items-center">
		<label for="userId" class="col-form-label"></label>
	</div>
	<div class="userId">
		<input type="text" id="userId" name="userId" class="form-control" onblur="idDupleCheck(this)" placeholder="아이디*" >
	</div>
	
	<div class="row g-3 align-items-center">
    <div class="col-2">
        <label for="userPw" class="col-form-label"></label>
    </div>
    <div class="inputPassword">
        <input type="password" id="userPw" name="userPw" placeholder="비밀번호*" onblur="passwordCheck()" required>
        <input type="password" id="userPwConfirm" name="userPwConfirm" placeholder="비밀번호 확인*" onblur="passwordCheck()" required>
    </div>
	</div>
	
	<div class="row g-3 align-items-center">
	  <div class="col-2">
	    <label for="email" class="col-form-label"></label>
	  </div>
	  <div class="email">
	    <input type="text" id="email" name="email" class="form-control" onblur="emailDupleCheck(this)"placeholder="이메일* (비밀번호 분실시 확인용 이메일)">
	  </div>
	</div>
	
	<div class="row g-3 align-items-center">
	  <div class="col-2">
	    <label for="userName" class="col-form-label"></label>
	  </div>
	  <div class="userName">
	    <input type="text" id="userName" name="userName" class="form-control" onblur="nameCheck()" placeholder="이름*">
	  </div>
	</div>
	
	
	<div class="row g-3 align-items-center">
	  <div class="col-2">
	    <label for="userNick" class="col-form-label"></label>
	  </div>
	  <div class="userNick">
	    <input type="text" id="userNick" name="userNick" class="form-control" onblur="nickDupleCheck(this)" placeholder="닉네임*">
	  </div>
	</div>
	
	<div id="idDupleBlock" class="form-text"  style="display:none">
		<p id="idDupleText"></p>
	</div>
	<div id="pwDupleBlock" class="form-text"  style="display:none">
    <p id="pwDupleText"></p>
	</div>
	<div id="emailDupleBlock" class="form-text" style="display:none">
  		<p id="emailDupleText"></p>
	</div>
	<div id="nameDupleBlock" class="form-text" style="display:none">
  		<p id="nameDupleText"></p>
	</div>
	<div id="nickDupleBlock" class="form-text" style="display:none">
		<p id="nickDupleText"></p>
	</div>
	
	
	
	
	<div class="row g-3 align-items-center">
	  <div class="col-2">
	    <label for="birth" class="col-form-label"></label>
	  </div>
	  <div class="birth">
	    <input type="date" id="birth" name="birth" class="form-control" placeholder="생년월일 8자리">
	  </div>
	</div>
	
	
	
	<div class="row g-3 align-items-center">
	  <div class="col-2">
	    <label for="address" class="col-form-label"></label>
	  </div>
	  <div class="address">
	    <input type="text" id="address" name="address" class="form-control" placeholder="주소">
	  </div>
	</div>
	
	<div class="row g-3 align-items-center">
	  <div class="col-2">
	    <label for="addressDetail" class="col-form-label"></label>
	  </div>
	  <div class="addressDetail">
	    <input type="text" id="addressDetail" name="addressDetail" class="form-control" placeholder="상세주소">
	  </div>
	</div>
	
	<div class="row g-3 align-items-center">
	  <div class="col-2">
	    <label for="phone" class="col-form-label"></label>
	  </div>
	  <div class="phone">
	    <input type="number" id="phone" name="phone" class="form-control" placeholder="연락처">
	  </div>
	</div>
	
		<div class="row mb-3 justify-content-center">
			<button id="joinButton" type="submit" class="btn btn-outline-success">캠핑 시작하기</button>
		</div>	
		
	</div> <!-- form -->
	</div><!--  container -->
</form>



<c:import url="../layout/footer.jsp" />