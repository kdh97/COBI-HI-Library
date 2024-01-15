<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>암호변경</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>

<script>

$(function(){
	
	$("#button1").click(function(){
		// 공백여부
		let userpass1 	= $.trim($("#userpass1").val()); // 현재
		let userpass2	= $.trim($("#userpass2").val()); // 새로운 암호
		let userpass3 	= $.trim($("#userpass3").val()); // 새로운 암호 확인
		
		userpass1   	= userpass1.replace(" ","");
		userpass2   	= userpass2.replace(" ","");
		userpass3   	= userpass3.replace(" ","");
		
		if(userpass1 == "") {
			alert("현재암호를 입력해주세요.");
			$("#userpass1").focus();
			return false;
		}
		if(userpass2.length < 6 || userpass2.length > 20) {
			alert("새로운 암호는 6~20자 사이로 해주세요.");
			$("#userpass2").focus();
			return false;
		}
		// 비밀번호 정규표현식 처리
		let userpass_pattern = /^.*(?=^.{6,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&]).*$/;
	    if (!userpass_pattern.test(userpass2)) {
	      alert("비밀번호가 양식에 맞지 않습니다.\n영문대소문자, 숫자, 특수문자 중 3종류 이상의 조합으로 6~20자리로 입력해주세요.");
	      $("#userpass2").focus();
	      return false;
	    }
		if(userpass2 != userpass3) {
			alert("변경암호와 암호확인이 일치하지 않습니다.");
			return false;
		}
		
		
		let datas = {"userpass1":userpass1,"userpass2":userpass2};  // json 형식
		
		$.ajax({
			url : "/libPassChangeSub.do",
			type : "POST",
			data : datas,
			
			datatype : "text",
			success : function(data) {
				if(data=="2") {
					alert("현재암호가 일치하지 않습니다.");
					$("#pass1").focus();
				} else if(data == "1") {
					alert("암호가 변경되었습니다. \n다음 로그인 시 적용됩니다.");
					self.close();
				} else {
					alert("변경실패");
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
#wrap {
    width: 430px;
    height: 330px;
    border: 1px solid #c8c8c8;
    margin: 0 auto;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    padding: 20px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    background-color: #fff;
    border-radius: 5px;
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
    width: 94%;
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

    <div id="wrap">
        <div id="pass_area"> 현재암호 <input type="password" class="input-text" name="userpass1" id="userpass1"></div>
        <div id="pass_area"> 변경암호 <input type="password" class="input-text" name="userpass2" id="userpass2"></div>
        <div id="pass_area"> 암호확인 <input type="password" class="input-text" name="userpass3" id="userpass3"></div>
        <div id="button_area">
            <button type="submit" id="button1" onclick="return false;">전송</button>
            <button type="button" onclick="resetFields();">취소</button>
        </div>
    </div>

<script>
	function resetFields() {
		$("#userpass1").val("");
		$("#userpass2").val("");
	    $("#userpass3").val("");
	}
</script>
</body>
</html>