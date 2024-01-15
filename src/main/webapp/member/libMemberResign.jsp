<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>
<link rel="stylesheet" href="../css/lib.css">
<script>

$(function(){

    $("#button1").click(function(){
    	let userid = "${sessionScope.SessionUserID }";
        let userpass = $.trim($("#userpass").val());
        $.ajax({
            type: "POST", 
            url: "/memberResign.do", 
            data: {"userid": userid, "userpass": userpass}, 

            dataType: "text", 
            success: function(data) {
                if(data == "ok") { 
                	alert("탈퇴 되었습니다.");
                    location = "/"; 
                } else if(data == "no") {
                	alert("현재 대출중인 책이 있습니다.\n반납 후 탈퇴 가능합니다.");
                } else if(data == "no2") {
                	alert("현재 대실중인 열람실이 있습니다.\n퇴실 후 탈퇴 가능합니다.");
                } else {
                    alert("암호를 다시 확인해주세요."); 
                }
            },
            error: function() {
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
    border: 1px solid #c8c8c8;
    border-radius: 5px;
    padding: 20px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    margin-top:130px;
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
            <aside class="aside" style="margin-top:-130px;">
                <%@include file = "../include/aside5.jsp" %>
            </aside>

            <div class="flex-item">
                <div class="container">

                    <!-- 본문 입력 -->
                    <form id="frm" name="frm">
                        <div id="id_area"> 암호입력 <input type="password" class="input-text" name="userpass" id="userpass"></div>
                        <div id="button_area">
                            <button type="submit" id="button1" onclick="return false;">확인</button>
                            <button type="reset">취소</button>
                        </div>
                    </form>
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