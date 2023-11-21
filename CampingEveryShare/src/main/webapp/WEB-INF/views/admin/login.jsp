<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/adminheader.jsp" />

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
            "/admin/idCheck/",
            "idDupleBlock",
            "접속코드를 입력해 주세요.",
            "존재하지 않는 접속코드입니다. 확인 후 진행해주세요",
            ""
        );
    }

	    function passwordCheck() {
        var adminPw = $("#adminPw").val();
        var pwDupleBlock = $("#pwDupleBlock");

        pwDupleBlock.show();

        // 비밀번호가 입력되지 않았을 경우
        if (!adminPw) {
            console.log("비밀번호를 입력하세요.");
            pwDupleBlock.text("비밀번호를 입력하세요.");
            // TODO: ptag 표시
            return;
        }
        pwDupleBlock.text("");
    }
  

    $(document).ready(function () {
    	$("#loginButton").click(function () {
  			var adminCodeValue = $("#adminCode").val().trim();
	        var adminPwValue = $("#adminPw").val().trim();
	        // Check if adminname and password are not empty
	        if (adminCodeValue.length === 0 || adminPwValue.length === 0) {
	            $("#loginFailureMessageText").text("접속코드와 비밀번호를 모두 입력해 주세요.").show();
	            event.preventDefault(); // Prevent form submission
	            console.log("접속코드와 비밀번호를 입력해 주세요.");
// 	            displayBlock.show();
	            return;
	        } 
            $.ajax({
                type: "POST",
                url: "/admin/login",
                data: {
                    "adminCode": adminCodeValue,
                    "adminPw": adminPwValue
                },
                contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                success: function (response) {
                    console.log(response); // 서버 응답 확인
                    if (response) {
                        // $(location).attr('href', '/'); ->  로그인 성공 시, 서버에서 리다이렉션을 처리하므로 삭제
                        console.log("로그인 성공");
                        window.location.href = "/admin/list";
                    } else {
						alert("접속코드 또는 비밀번호가 잘못되었습니다.");                    	
                        window.location.href = "/admin/login";

                        console.log("서버 응답에 문제가 있습니다."); // 서버 응답이 다르게 올 경우
                        $("#loginFailureMessageText").text("접속코드 또는 비밀번호가 잘못되었습니다.").show();
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.error("AJAX 요청 실패: " + textStatus);
                }
            });
    	})
    });
    
    
</script>



<div class="container">
<div id="adminpageTitle" class="adminpageTitle">
<h3 id="adminpageTitle">관리자 로그인</h3>
</div>

<div class="row g-3 align-items-center">

	
<div class="input-group has-validation">
	<span class="input-group-text" id="basic-addon1">
	<svg xmlns="http://www.w3.org/2000/svg" width="50" height="40" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
		<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"/>
	</svg>
	</span>
	<div class="form-floating is-invalid">
		<input type="text" id="adminCode" name="adminCode" class="form-control" onblur="idDupleCheck(this)">
	    <label for="floatingInputGroup2">접속코드*</label>
  	</div>
	<div id="idDupleBlock" class="invalid-feedback"  style="display:none">
		<p id="idDupleText"></p>
	</div>
</div>


<div class="input-group has-validation">
	<span class="border border-success-subtle input-group-text" id="basic-addon1">
	<svg xmlns="http://www.w3.org/2000/svg" width="50" height="40" fill="currentColor" class="bi bi-key" viewBox="0 0 16 16">
  	<path d="M0 8a4 4 0 0 1 7.465-2H14a.5.5 0 0 1 .354.146l1.5 1.5a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0L13 9.207l-.646.647a.5.5 0 0 1-.708 0L11 9.207l-.646.647a.5.5 0 0 1-.708 0L9 9.207l-.646.647A.5.5 0 0 1 8 10h-.535A4 4 0 0 1 0 8zm4-3a3 3 0 1 0 2.712 4.285A.5.5 0 0 1 7.163 9h.63l.853-.854a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708 0l.646.647.793-.793-1-1h-6.63a.5.5 0 0 1-.451-.285A3 3 0 0 0 4 5z"/>
 	<path d="M4 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
	</svg>
	</span>
	<div class="form-floating is-invalid">
	    <input type="password" id="adminPw" name="adminPw" class="border border-success-subtle form-control" aria-describedby="passwordHelpInline" onblur="passwordCheck()" required>
	    <label for="adminPw" class="col-form-label">비밀번호*</label>
  	</div>
  	<div id="pwDupleBlock" class="invalid-feedback"  style="display:none">
    <p id="pwDupleText"></p>
	</div>
</div>


	<div>
		<a href="/admin/loginfail" type="button" class="btn btn-outline-success">접속코드/비밀번호 분실</a>
	</div>
	
	<div class="row mb-3 justify-content-center">
		<button id="loginButton" class="btn btn-outline-success">로그인</button>
	</div>	
	
		
</div>

</div><!-- .container -->

<c:import url="../layout/footer.jsp" />