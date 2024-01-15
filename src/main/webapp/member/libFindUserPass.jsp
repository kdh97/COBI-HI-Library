<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>
<link rel="stylesheet" href="../css/lib.css">
<script>
$(function(){
	
	$("#button1").click(function(){
		// 공백여부
		let userid 	 = $.trim($("#userid").val());
		let name 	 = $.trim($("#name").val());
		let email 	 = $.trim($("#email").val());
		
		if(userid == "") {
			alert("아이디를 입력해주세요.");
			$("#userid").focus();
			return false;
		}
		if(name == "") {
			alert("이름을 입력해주세요.");
			$("#name").focus();
			return false;
		}
		if(email == "") {
			alert("이메일을 입력해주세요.");
			$("#email").focus();
			return false;
		}
		
		let datas = {"userid":userid,"name":name,"email":email};
		
		$.ajax({
			url : "/libFindUserPassSub.do", 
			type : "POST",
			data : datas,
			
			datatype : "text",
			success : function(data) {
				if(data=="2") {
					alert("정보가 일치하지 않습니다.");
					$("#userid").focus();
				} else {
					$("#result_text").html("<font color='blue'><b>"+data+"</b></font>");
				}
			},
			error : function() {
				alert("전송실패");
			}
		});
		
	});
});
	
</script>

<style>
.container {
  width: 400px;
  background-color: #fff;
  border: 1px solid #ccc;
  border-radius: 5px;
  padding: 20px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  margin-top:100px;
  margin-left:480px;
}
.input-text {
    width: 100%;
    padding: 10px;
    margin: 5px 0;
    border: 1px solid #ccc;
    border-radius: 3px;
    box-sizing: border-box;
}
#button_area {
    text-align: center;
    margin-top: 15px;
  }

  button {
    padding: 10px 20px;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 3px;
    cursor: pointer;
    margin-right: 10px;
  }

  #result_area {
    padding: 5px;
    background-color: #f5f5f5;
    border: 1px solid #ccc;
    border-radius: 3px;
    text-align: center;
    margin-top: 15px;
  }
</style>

<body>
    <header class="header1">
        <%@include file = "../include/header1.jsp" %>
    </header>
    <header class="header2">
        <%@include file = "../include/header2.jsp" %>
    </header>

    <nav class="nav">
        <%@include file = "../include/nav.jsp" %>
    </nav>

    <section class="section1">
        <div class="sec1">
            <aside class="aside" style="margin-top:-100px;">
                <%@include file = "../include/aside6.jsp" %>
            </aside>

            <div class="flex-item">
                <div class="container">

                    <!-- 본문 입력 -->
                    <div>
                        <input type="text" class="input-text" placeholder="아이디" name="userid" id="userid">
                    </div>
                    <div>
                        <input type="text" class="input-text" placeholder="이름" name="name" id="name">
                    </div>
                    <div>
                        <input type="text" class="input-text" placeholder="이메일" name="email" id="email">
                    </div>
                    <div id="button_area">
                        <button type="submit" id="button1" onclick="return false;">전송</button>
                        <button type="button" onclick="resetFields();">취소</button>
                    </div>
                    <div id="result_area"> 비밀번호 : <span id="result_text"></span></div>
                </div>

                <!-- 본문 입력 -->

            </div>
        </div>
    </section>

    <footer class="footer">
        <%@include file = "../include/footer.jsp" %>
    </footer>
    <aside class="new-aside">
        <%@include file = "../include/newaside.jsp" %>
    </aside>

<script>
	function resetFields() {
		$("#userid").val("");
		$("#name").val("");
	    $("#email").val("");
	}
</script>
</body>
</html>