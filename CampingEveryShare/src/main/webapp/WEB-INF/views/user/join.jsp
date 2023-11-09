<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<script type="text/javascript">
	function idDupleCheck(input) {
		var userId = input.value;
		var idDupleBlock = $("#idDupleBlock");
		
		console.info("idDupleCheck::" + userId);
		
		idDupleBlock.show();      
		
	    if (userId.trim() == '') {
	    	idDupleBlock.text("아이디를 입력해 주세요.");
	    	console.log("아이디를 입력해 주세요.");
	        return;
	    }
	
	    $.ajax({
	        type: "get",
	        url: "/user/idCheck/" + userId,
	        dataType: "text",
	        success: function(response) {
	            if (response == "true") {
	//             	console.log("사용가능한 id 입니다.");
	            	idDupleBlock.text("사용가능한 id 입니다.");
	            } else {
	//             	console.log("사용할 수 없는 아이디입니다. 다른 아이디를 입력해 주세요.");
	            	idDupleBlock.text("사용할 수 없는 아이디입니다. 다른 아이디를 입력해 주세요.");
	            }
	        }
	        
	    });
	}
	
	function passwordCheck () {
		var password1 = $("#password1");
		var password2 = $("#password2");
		var pwDupleBlock = $("#pwDupleBlock");
		
		pwDupleBlock.show();            	
		if (password1.val() != password2.val()) {
			console.log("동일한 비밀번호가 아님") 
			pwDupleBlock.text("동일한 비밀번호가 아님")
			//TODO: ptag표시
			return;
		}
		
		console.log("동일한 비밀번호입니다.")
		pwDupleBlock.text("동일한 비밀번호입니다.")
		//TODO:ptag표시
	}
	
	 function emailDupleCheck(input) {
	        var email = input.value;
	        var emailDupleBlock = $("#emailDupleBlock");
	        console.info("emailDupleCheck::" + email);
	        emailDupleBlock.show();
	        if (email.trim() == '') {
	            emailDupleBlock.text("이메일을 입력해 주세요.");
	            console.log("이메일을 입력해 주세요.");
	            return;
	        }
	        $.ajax({
	            type: "get",
	            url: "/user/emailCheck/" + email,
	            dataType: "text",
	            success: function(response) {
	                if (response == "true") {
	                    console.log("사용가능한 email 입니다.");
	                    emailDupleBlock.text("사용가능한 email 입니다.");
	                } else {
	                    console.log("사용할 수 없는 이메일입니다. 다른 이메일을 입력해 주세요.");
	                    emailDupleBlock.text("사용할 수 없는 이메일입니다. 다른 이메일을 입력해 주세요.");
	                }
	            }
	        });
	    }
	
	 function nameCheck() {
	        var userName = $("#userName");
	        var nameDupleBlock = $("#nameDupleBlock");
	        console.info("nameCheck::" + userName.val());
	        nameDupleBlock.show();
	        if (userName.val().trim() === '') {
	        	nameDupleBlock.text("이름을 입력해 주세요.");
	            console.log("이름을 입력해 주세요.");
	            return;
	        }
	    }
	 
	 function nickDupleCheck(input) {
	        var userNick = input.value;
	        var nickDupleBlock = $("#nickDupleBlock");
	        console.info("nickDupleCheck::" + userNick);
	        nickDupleBlock.show();
	        if (userNick.trim() == '') {
	            nickDupleBlock.text("닉네임을 입력해 주세요.");
	            console.log("닉네임을 입력해 주세요.");
	            return;
	        }
	        $.ajax({
	            type: "get",
	            url: "/user/nickCheck/" + userNick,
	            dataType: "text",
	            success: function(response) {
	                if (response == "true") {
	                    console.log("사용가능한 닉네임 입니다.");
	                    nickDupleBlock.text("사용가능한 닉네임 입니다.");
	                } else {
	                    console.log("사용할 수 없는 닉네임입니다. 다른 닉네임을 입력해 주세요.");
	                    nickDupleBlock.text("사용할 수 없는 닉네임입니다. 다른 닉네임을 입력해 주세요.");
	                }
	            }
	        });
	    }
	
</script>

  
<form action="/user/join" method="post">
	<div class="container">
	
	<div class="row g-3 align-items-center">
        <div class="col-2">
            <label for="profile" class="col-form-label">프로필 사진</label>
        </div>
        <div class="col-10">
            <!-- 갤러리 미리보기 -->
            <div class="profilegallery">
                <img src="path/to/profile1.jpg" alt="프로필1" class="profile-preview" onclick="selectProfile(1)">
                <img src="path/to/profile2.jpg" alt="프로필2" class="profile-preview" onclick="selectProfile(2)">
                <img src="path/to/profile3.jpg" alt="프로필3" class="profile-preview" onclick="selectProfile(3)">
                <img src="path/to/profile4.jpg" alt="프로필4" class="profile-preview" onclick="selectProfile(4)">
                <img src="path/to/profile5.jpg" alt="프로필5" class="profile-preview" onclick="selectProfile(5)">
            </div>
            <!-- 선택한 프로필을 저장할 hidden input -->
            <input type="hidden" id="selectedProfile" name="selectedProfile" value="">
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
	  <div class="inputPassword6">
	    <input type="password" id="password1" name="userPw" class="form-control" aria-describedby="passwordHelpInline" placeholder="비밀번호*">
	    <input type="password" id="password2" name="userPw" class="form-control" aria-describedby="passwordHelpInline"  onblur="passwordCheck()" placeholder="비밀번호 확인*">
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
	<div id="emailDupleBlock" class="form-text"  style="display:none">
		<p id="emailDupleText"></p>
	</div>
	<div id="nameDupleBlock" class="form-text"  style="display:none">
		<p id="nameDupleText"></p>
	</div>
	<div id="nickDupleBlock" class="form-text"  style="display:none">
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
			<button type="submit" class="btn btn-outline-success">캠핑 시작하기</button>
		</div>	
	
	</div><!--  container -->
</form>



<c:import url="../layout/footer.jsp" />