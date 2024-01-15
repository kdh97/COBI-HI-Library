<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title> 
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../include/address.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>
<link rel="stylesheet" href="../css/lib.css">

<script>

$(function(){
	// 입력한 아이디값에 대한 체크
	$("#userid").keyup(function(){
		
		let userid = $("#userid").val();
		let msg = "";
		let result = 0;
		if(userid.length >= 4 && userid.length <= 15) {
			result = fn_userid(userid);
		}
		$("#id_usable").val("N")
		if(result == 0) {
			msg = "<font color='red'>아이디는 4~15 자리 사이로 입력해주세요.</font>";
		} else if(result == 1) {
			msg = "<font color='green'>사용가능한 아이디입니다.</font>";
			$("#id_usable").val("Y")
		} else if(result == 2) {
			msg = "<font color='red'>이미 사용중인 아이디입니다.</font>";
		} else if(result == 3) {
			msg = "<font color='red'>형식에 맞지않는 아이디입니다.</font>";
		}
		$("#msg_userid").html(msg);
	});
	
	// 회원가입 버튼 클릭 시
	$("#btn_submit").click(function(){
		// 정보 입력값 호출,공백처리 및 정규표현식 적용
		
		// 회원가입 정보값 호출
		let userid 		= $.trim($("#userid").val());
		let userpass    = $.trim($("#userpass").val());
		let userpass2   = $("#userpass2").val();
		let name 	    = $.trim($("#name").val());
		let id_usable   = $.trim($("#id_usable").val());
		
		let y1 			= $("#y1").val();
		let m2 			= $("#m2").val();
		let d3 			= $("#d3").val();
		let birth 		= y1+"-"+m2+"-"+d3;
		
		let p1 			= $("#p1").val();
		let p2 			= $.trim($("#p2").val());
		let p3 			= $.trim($("#p3").val());
		let phone		= p1+"-"+p2+"-"+p3;
		
		let email 		= $.trim($("#email").val());
		
		let addr1 		= $.trim($("#addr1").val());
		let addr2 		= $.trim($("#addr2").val());
		
		// 체크유무에 따른 데이터 베이스 저장 값 설정
		let mailchk = $("#mailchk").prop("checked") ? "Y" : "N";
		let smschk = $("#smschk").prop("checked") ? "Y" : "N";
		
		// 데이터 공백제거
		userid 			= userid.replace(" ","");
		userpass   		= userpass.replace(" ","");
		name  			= name.replace(" ","");
		p1 				= p1.replace(" ","");
		p2 				= p2.replace(" ","");
		p3 				= p3.replace(" ","");
		email 			= email.replace(" ","");
		
		$("#userid").val(userid);
		$("#userpass").val(userpass);
		$("#name").val(name);
		$("#p1").val(p1);
		$("#p2").val(p2);
		$("#p3").val(p3);
		$("#email").val(email);
		
		if(name == "") {
			alert("이름을 입력해주세요.");
			$("#name").focus();
			return false;
		}
		// 이름 정규표현식 처리
		let name_pattern = /^[a-zA-Z가-힣]*$/;
	    if (!name_pattern.test(name)) {
	      alert("이름을 다시 입력해주세요.");
	      $("#name").focus();
	      return false;
	    }
	    
	    if(userid.length < 4 || userid.length > 12) {
			alert("아이디는 4~12자리 사이로 입력해주세요.");
			$("#userid").focus();
			return false;
		}
	    
		if(id_usable == "N") {
			alert("아이디를 다시 확인해주세요.");
			$("#id_usable").focus();
			return false;
		}
		
		if(userpass.length < 6 || userpass.length > 20) {
			alert("암호는 6~20자리 사이로 입력해주세요.");
			$("#userpass").focus();
			return false;
		}
		if(userpass != userpass2) {
			alert("암호가 일치하지 않습니다.");
			$("#userpass2").focus();
			return false;
		}
		// 비밀번호 정규표현식 처리
		let userpass_pattern = /^.*(?=^.{6,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&]).*$/;
	    if (!userpass_pattern.test(userpass)) {
	      alert("비밀번호가 양식에 맞지 않습니다.\n영문대소문자, 숫자, 특수문자 중 3종류 이상의 조합으로 6~20자리로 입력해주세요.");
	      $("#userpass").focus();
	      return false;
	    }
	    
	    if(phone == "") {
			alert("휴대폰번호를 입력해주세요.");
			$("#phone").focus();
			return false;
		}
	    // 휴대폰번호 정규표현식 처리
		let phone_pattern = /^\d{3}-\d{3,4}-\d{4}$/;
	    if (!phone_pattern.test(phone)) {
	      alert("올바른 휴대폰번호가 아닙니다.\n다시 입력해주세요.");
	      $("#phone").focus();
	      return false;
	    }
	    
	    if(email == "") {
			alert("이메일을 입력해주세요.");
			$("#email").focus();
			return false;
		}
	    // 이메일 정규표현식 처리
	    let email_pattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
	    if (!email_pattern.test(email)) {
	      alert("올바른 이메일 형식이 아닙니다.\n다시 입력해주세요.");
	      $("#email").focus();
	      return false;
	    }
	    
	    if(addr1 == "") {
			alert("주소를 입력해주세요.");
			$("#addr1").focus();
			return false;
		}
	    
	    if(addr2 == "") {
			alert("상세주소를 입력해주세요.");
			$("#addr2").focus();
			return false;
		}
		
		// 회원가입 정보 입력값
		let datas = {"userid":userid,"userpass":userpass,"name":name,"birth":birth,"phone":phone,"email":email,"addr1":addr1,"addr2":addr2,"mailchk":mailchk,"smschk":smschk};
		
		// 회원가입 정보 입력값 전송
		$.ajax({
			// 전송
			type  : "POST",
			url   	: "/libJoinSave.do",
			data 	: datas,
			// 결과값 세팅	
			datatype : "text",
			success 	 : function(data) {
				 if(data == "1") {
						alert("회원가입 완료");
						location = "/libLoginWrite.do";
					 } else if(data == "2") {
						 alert("이미 사용중인 아이디입니다.");
					 } else {
						 alert("가입 오류");
					 }
				 },
			error 		 : 	function() {
				 alert("데이터 전송실패");
			 }
		});
	});
	
});
// 입력한 아이디 중복체크 
function fn_userid(userid) {
	let result="";
	$.ajax({
		// 전송
		type  : "POST",
		url   	: "/libUserIdCheck.do",
		data 	: "userid="+userid,
		async : false,
		// 결과값 세팅	
		datatype : "text",
		success 	 : function(data) {
				result = data;
			 },
		error 	: function() {
			alert("오류");
			 return "2";
		 }
	});
	return result; 
}
</script>

<style>

.container {
  width: 800px;
  margin-left:300px;
  background-color: #fff;
  border: 1px solid #ccc;
  border-radius: 5px;
  padding: 20px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

select {
  width: 70px;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
  font-size: 16px;
  color: #333;
  appearance: none;
  -webkit-appearance: none;
  background-position: right 10px center;
}

select:focus {
  border-color: #007bff;
}

select[aria-invalid="true"] {
  border-color: #ff0000;
}

select::placeholder {
  color: #999;
}

.table1{
	width:100%;
	margin:0px auto;
	border-collapse: collapse;
	text-align:left;
	border-top:3px solid lightgreen;
	border-collapse:collapse;
}
.table1 th,
.table1 td {
  padding: 10px;
  border-bottom: 1px solid #ccc;
  text-align: left;
}

.table1 th {
  background: #007bff;
  color: white;
  font-weight: bold;
}

.table1 label.checkbox-label {
  display: inline-block;
  margin-top: 5px;
}

.table1 label.checkbox-label input[type="checkbox"] {
  margin-right: 5px;
}

.btn_submit {
  display: inline-block;
  background-color: #007bff;
  color: white;
  border: none;
  padding: 10px 20px;
  font-size: 1em;
  cursor: pointer;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s ease;
  margin-top:20px;
}

.btn_submit:hover {
  background-color: #0056b3;
}

.frm_info {
  font-size: 0.9em;
  color: #999;
  margin-top: 5px;
}
.input {
  width: 150px;
  padding: 10px;
  margin-bottom: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
}
</style>

<body>
    <header class="header1">
        <%@include file="../include/header1.jsp" %>
    </header>
    <header class="header2">
        <%@include file="../include/header2.jsp" %>
    </header>

    <nav class="nav">
        <%@include file="../include/nav.jsp" %>
    </nav>

    <section class="section1">
        <div class="sec1">
            <aside class="aside">
                <%@include file="../include/aside6.jsp" %>
            </aside>

            <div class="flex-item">
                <div class="container" style="border:0px solid black; margin-left:300px;">
                    <!-- 본문 입력 -->
                    <div style="margin-bottom: 50px; font-size: 1.8em; font-weight: bold;">
                        회원가입
                    </div>
                    <div>
                        <form id="frm" name="frm">
                            <input type="hidden" id="id_usable" value="N">
                            <div>
                                <table class="table1">
                                    <caption style="text-align:left; font-size: 1.2em;">※회원정보입력</caption>
                                    <colgroup>
                                        <col width="15%">
                                        <col width="*">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th><label for="name">이름</label></th>
                                            <td>
                                                <input type="text" id="name" name="name" value="" class="input" size="10">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="userid">아이디</label></th>
                                            <td>
                                                <input type="text" name="userid" value="" id="userid" class="input " minlength="4" maxlength="12">
                                                <span class="frm_info"> ※ 영어/숫자 4~12자</span><br>
                                                <span id="msg_userid"></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="userpass">비밀번호</label></th>
                                            <td>
                                                <input type="password" name="userpass" id="userpass" class="input" maxlength="20">
                                                <span class="frm_info"> ※ 영문대소문자, 숫자, 특수문자 중 3종류 이상으로 조합 6~20자리</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="userpass2">비밀번호 확인</label></th>
                                            <td>
                                                <input type="password" name="userpass2" id="userpass2" class="input" maxlength="20">
                                                <span class="frm_info"> ※ 비밀번호 확인을 위해 다시 한번 입력하세요</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="birth">생년월일</label></th>
                                            <td>
                                                <select id="y1" name="y1">
                                                    <c:forEach var="i" begin="1950" end="2023">
                                                        <option value="${i }" <c:if test="${i == 2000 }">selected</c:if>>${i }</option>
                                                    </c:forEach>
                                                </select>
                                                <span>년</span>
                                                <select id="m2" name="m2">
                                                    <c:forEach var="i" begin="1" end="12">
                                                        <option value="${i }">${i }</option>
                                                    </c:forEach>
                                                </select>
                                                <span>월</span>
                                                <select id="d3" name="d3">
                                                    <c:forEach var="i" begin="1" end="31">
                                                        <option value="${i }">${i }</option>
                                                    </c:forEach>
                                                </select>
                                                <span>일</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="phone">휴대폰번호</label></th>
                                            <td>
                                                <div>
                                                    ※ 휴대폰번호는 비밀번호 분실, 서비스 관련 메시지 전달 시 사용하므로 정확하게 입력하세요.<br>
                                                    ※ SMS수신에 체크하지 않을 경우 자료대출이나 반납, 도서예약 등의 서비스가 제한됩니다.<br>
                                                </div>
                                                <select id="p1" name="p1">
                                                    <option value="">선택</option>

                                                    <option value="010">010</option>

                                                    <option value="011">011</option>

                                                    <option value="016">016</option>

                                                    <option value="017">017</option>

                                                    <option value="018">018</option>

                                                    <option value="019">019</option>
                                                </select>
                                                <span>-</span>
                                                <input type="text" id="p2" name="p2" maxlength="4" class="input" style="width: 70px;">
                                                <span>-</span>
                                                <input type="text" id="p3" name="p3" maxlength="4" class="input" style="width: 70px;">
                                                <label for="smschk"><input type="checkbox" name="smschk" id="smschk" value="Y" checked>SMS를 받겠습니다.</label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="email">E-mail</label></th>
                                            <td>
                                                <div>※ 비밀번호 분실, 서비스 관련 메시지 전달 시 사용하므로 정확하게 입력하세요.</div>
                                                <input type="email" name="email" value="" id="email" class="input" style="width:350px;" size="70" maxlength="100"><br>
                                                <label for="mailchk"><input type="checkbox" name="mailchk" id="mailchk" value="Y" checked>정보 메일을 받겠습니다.</label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>주소</th>
                                            <td><input type="text" id="addr1" name="addr1" class="input" style="width:350px;" readonly /></td>
                                        </tr>
                                        <tr>
                                            <th>상세 주소</th>
                                            <td><input type="text" id="addr2" name="addr2" class="input" style="width:350px;" /></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <div class="submit">
                                <input type="submit" value="회원가입" id="btn_submit" onclick="return false;" class="btn_submit" accesskey="s">
                            </div>
                        </form>
                    </div>
                    <!-- 본문 입력 -->
                </div>
            </div>
        </div>
    </section>

    <footer class="footer">
        <%@include file="../include/footer.jsp" %>
    </footer>
    <aside class="new-aside">
        <%@include file = "../include/newaside.jsp" %>
    </aside>
</body>
</html>