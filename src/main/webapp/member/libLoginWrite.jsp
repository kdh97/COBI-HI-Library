<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>
<link rel="stylesheet" href="../css/lib.css">

<script>
var alertMessage = "${param.alertMessage}";
if (alertMessage && alertMessage.trim() !== "") {
alert(decodeURIComponent(alertMessage));
location.href = "libLoginWrite.do";
}

$(function(){ 
	
	$("#button1").click(function(){
		let userid   = $("#userid").val();
		let userpass = $("#userpass").val();
		
		if(userid == "" || userpass == "") {
			alert("아이디 또는 암호를 확인해주세요.");
			return false;
		}
		
		var datas = {"userid":userid,"userpass":userpass}; // json 형식으로 작성
		$.ajax({
			type : "POST",
			data : datas,
			url : "/loginSession.do",
			
			datatype : "text",
			success 	 : function(data) {
				 	 if(data == "1") {
						alert("이미 탈퇴한 회원입니다.");
					 } else if(data == "2") {
						 alert("존재하지 않는 아이디 입니다.");
					 } else if(data != "" && data != "1" && data != "2") {
						alert(data+"님 환영합니다. \n로그인 되었습니다.");
						location = "/"; // 메인화면으로 이동
					 } else {
						 alert("아이디 또는 암호가 일치하지 않습니다.");
					 }
				 },
   			error 		 : 	function() {
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
  margin-left:480px; 
  margin-top:50px;
}
.logintable {
  width: 100%;
  border-collapse: collapse;
  margin-top: 20px;
}

.logintable th,
.logintable td {
  padding: 10px;
  border-top: 1px solid #ccc;
  text-align: left;
}

.logintable tr:first-child th,
.logintable tr:first-child td {
  border-top: none; /* Remove top border for the first row */
}

.logintable th {
  width: 30%;
}

.logintable td input[type="text"],
.logintable td input[type="password"] {
  width: 100%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
  box-sizing: border-box;
}

.btn_login {
  width: 100%;
  padding: 10px;
  background-color: #007bff;
  color: #fff;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.btn_login:hover {
  background-color: #0056b3;
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
            <aside class="aside" style="margin-top:-50px;">
                <%@include file = "../include/aside6.jsp" %>
            </aside>

            <div class="flex-item">
                <div class="container">
                    <!-- 본문 입력 -->
                    <section style="margin: 0 0 20px; padding: 20px 0;">
                        <div>
                            <form style="margin: 0; padding: 0; border: 0;" name="frm">
                                <table class="logintable">
                                    <tr>
                                        <th>회원아이디</th>
                                        <td><input type="text" autofocus id="userid" maxLength="20" name="userid"></td>
                                    </tr>
                                    <tr>
                                        <th>비밀번호</th>
                                        <td><input type="password" id="userpass" maxLength="50" name="userpass"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"><input class="btn_login" type="submit" value="로그인" id="button1" onclick="return false;"></td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                    </section>
                    <!-- 본문 입력 -->
                </div>
            </div>
        </div>
    </section>

    <footer class="footer">
        <%@include file = "../include/footer.jsp" %>
    </footer>
    <aside class="new-aside">
        <%@include file = "../include/newaside.jsp" %>
    </aside>

</body>
</html>