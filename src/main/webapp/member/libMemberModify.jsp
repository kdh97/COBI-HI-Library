<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="s_userid" value="${sessionScope.SessionUserID }"/>
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
	
	// 수정하기 버튼 클릭 시
	$("#btn_submit").click(function(){
		// 정보 입력값 호출,공백처리 및 정규표현식 적용
		
		// 수정입력 정보값 호출
		let userid 			= $.trim($("#userid").val());
		
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
		
		let mailchk = $("#mailchk").prop("checked") ? "Y" : "N";
		let smschk = $("#smschk").prop("checked") ? "Y" : "N";
		// 데이터 공백제거
		
		p1 				= p1.replace(" ","");
		p2 				= p2.replace(" ","");
		p3 				= p3.replace(" ","");
		email 			= email.replace(" ","");
		
		$("#p1").val(p1);
		$("#p2").val(p2);
		$("#p3").val(p3);
		$("#email").val(email);
		$("#addr2").val(addr2);
		
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
		let datas = {"userid":userid,"birth":birth,"phone":phone,"email":email,"addr1":addr1,"addr2":addr2,"mailchk":mailchk,"smschk":smschk};
		
		// 회원가입 정보 입력값 전송
		$.ajax({
			// 전송
			type  : "POST",
			url   	: "/libMemberModifySave.do",
			data 	: datas,
			// 결과값 세팅	
			datatype : "text",
			success 	 : function(data) {
				 if(data == "1") {
						alert("수정 완료");
						location = "/";
					 } else {
						 alert("수정 오류");
					 }
				 },
			error 		 : 	function() {
				 alert("데이터 전송실패");
			 }
		});
	});
	
});

</script>

<style>

.container {
  width: 800px;
  margin: 50px auto;
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
	border-top:3px solid #cd8394;
	border-collapse:collapse;
}
.table1 th,
.table1 td {
  padding: 10px;
  border-bottom: 1px solid #ccc;
  text-align: left;
}

.table1 th {
  background: #f1f1f1;
  color: #333;
  font-weight: bold;
}

.table1 label.checkbox-label {
  display: inline-block;
  margin-top: 5px;
}

.table1 label.checkbox-label input[type="checkbox"] {
  margin-right: 5px;
}

.btn {
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
                <%@include file = "../include/aside5.jsp" %>
            </aside>


            <div class="flex-item">
                <div class="container" style="margin-left:300px;">
                    <!-- 본문 입력 -->

                    <div id="wrapper_title">정보 수정</div>
                    <div class="mbskin">

                        <form id="frm" name="frm">
                            <input type="hidden" id="id_usable" value="N">
                            <div class="tbl_frm01 tbl_wrap">
                                <table class="table1">
                                    <caption>회원정보수정</caption>
                                    <colgroup>
                                        <col width="15%">
                                        <col width="*">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th><label for="name">이름</label></th>
                                            <td>
                                                <input type="text" id="name" name="name" value="${vo.name }" class="input " size="10" readonly>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="userid">아이디</label></th>
                                            <td>
                                                <input type="text" name="userid" value="${s_userid }" id="userid" class="input " minlength="4" maxlength="15" readonly>
                                                <span id="msg_userid"></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="birth">생년월일</label></th>
                                            <c:set var="dateParts" value="${vo.birth.split('-')}" />

                                            <c:set var="y1" value="${dateParts[0]}" /> <!-- Year -->
                                            <c:set var="m1" value="${dateParts[1]}" /> <!-- Month -->
                                            <c:set var="d1" value="${dateParts[2]}" /> <!-- Day -->
                                            <td>
                                                <select id="y1" name="y1">
                                                    <c:forEach var="i" begin="1950" end="2023">
                                                        <option value="${i }" <c:if test="${i == y1 }">selected</c:if>>${i }</option>
                                                    </c:forEach>
                                                </select>
                                                <span>년</span>
                                                <select id="m2" name="m2">
                                                    <c:forEach var="i" begin="1" end="12">
                                                        <option value="${i }" <c:if test="${i == m1 }">selected</c:if>>${i }</option>
                                                    </c:forEach>
                                                </select>
                                                <span>월</span>
                                                <select id="d3" name="d3">
                                                    <c:forEach var="i" begin="1" end="31">
                                                        <option value="${i }" <c:if test="${i == d1 }">selected</c:if>>${i }</option>
                                                    </c:forEach>
                                                </select>
                                                <span>일</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="phone">휴대폰번호</label></th>
                                            <c:set var="phoneParts" value="${vo.phone.split('-')}" />

                                            <c:set var="p1" value="${phoneParts[0]}" />
                                            <c:set var="p2" value="${phoneParts[1]}" />
                                            <c:set var="p3" value="${phoneParts[2]}" />
                                            <td>
                                                <select id="p1" name="p1">
                                                    <option value="">선택</option>

                                                    <option value="010" <c:if test="${p1 == '010'}">selected</c:if>>010</option>

                                                    <option value="011" <c:if test="${p1 == '011'}">selected</c:if>>011</option>

                                                    <option value="016" <c:if test="${p1 == '016'}">selected</c:if>>016</option>

                                                    <option value="017" <c:if test="${p1 == '017'}">selected</c:if>>017</option>

                                                    <option value="018" <c:if test="${p1 == '018'}">selected</c:if>>018</option>

                                                    <option value="019" <c:if test="${p1 == '019'}">selected</c:if>>019</option>
                                                </select>
                                                <span>-</span>
                                                <input type="text" id="p2" name="p2" minlength="3" maxlength="4" class="input" style="width: 70px;" value="${p2 }">
                                                <span>-</span>
                                                <input type="text" id="p3" name="p3" minlength="3" maxlength="4" class="input" style="width: 70px;" value="${p3 }">
                                                <label for="smschk"><input type="checkbox" name="smschk" id="smschk" value="Y" <c:if test="${vo.smschk == 'Y' }">checked</c:if>>SMS를 받겠습니다.</label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><label for="email">E-mail</label></th>
                                            <td>
                                                <input type="email" name="email" value="${vo.email }" id="email" class="input" style="width:350px;" size="70" maxlength="100"><br>
                                                <label for="mailchk"><input type="checkbox" name="mailchk" id="mailchk" value="Y" <c:if test="${vo.mailchk == 'Y' }">checked</c:if>>정보 메일을 받겠습니다.</label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>주소</th>
                                            <td><input type="text" id="addr1" name="addr1" class="input" value="${vo.addr1 }" style="width:350px;" readonly /></td>
                                        </tr>
                                        <tr>
                                            <th>상세 주소</th>
                                            <td><input type="text" id="addr2" name="addr2" class="input" value="${vo.addr2 }" style="width:350px;" /></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <div class="submit">
                                <input type="submit" value="수정하기" id="btn_submit" onclick="return false;" class="btn" accesskey="s">
                            </div>
                        </form>

                    </div>
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