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
<style>

.wrapper {
    margin: 0px auto;
    width: 1200px;
    height:1000px;
    position: relative;
    border:1px solid black;
}
select {
  width: 70px;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
  font-size: 16px;
  color: #333;
  appearance: none; /* Remove default arrow icon on some browsers */
  -webkit-appearance: none; /* Remove default arrow icon on Safari */
  background-image: url('data:image/svg+xml;utf8,<svg fill="#000000" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="M7 10l5 5 5-5z"/><path d="M0 0h24v24H0z" fill="none"/></svg>'); /* Add custom arrow icon */
  background-position: right 10px center;
  background-repeat: no-repeat;
}

/* Change select box border color on focus */
select:focus {
  border-color: #007bff;
}

/* Change select box border color on error */
select[aria-invalid="true"] {
  border-color: #ff0000;
}

/* Customize placeholder text color for select box */
select::placeholder {
  color: #999;
}
.table1{
	width:800px;
	height:600px;
	margin:0px auto;
	text-align:left;
	border-top:3px solid lightgreen;
	border-collapse:collapse;
}
.table1 tr {
	border-bottom:1px solid #c8c8c8;
}
.table1 th {
	background:skyblue;
	text-align:center;
}
.table1 td {
	padding-left:10px;
}
.submit {
	width:800px;
	margin:0px auto;
	text-align:center;
	margin-top:40px;
}
.btn_submit {
	width: 100px;
	padding: 10px;
	background-color: #007bff;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}
.input {
  width: 150px;
  padding: 10px;
  margin-bottom: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
}
.frm_info {
	font-size:15px;
	color:#c8c8c8;
	margin-left:15px;
}

</style>

<script>
$(function(){
    // "수정" 버튼이 클릭되었을 때
    $("#btn_submit").click(function(){
        // 입력된 정보 값을 가져오고, 빈 값 처리와 정규 표현식 적용
        
        // 입력된 정보 값 호출
        let userid = $.trim($("#userid").val());

        let y1 = $("#y1").val();
        let m2 = $("#m2").val();
        let d3 = $("#d3").val();
        let birth = y1 + "-" + m2 + "-" + d3;

        let p1 = $("#p1").val();
        let p2 = $.trim($("#p2").val());
        let p3 = $.trim($("#p3").val());
        let phone = p1 + "-" + p2 + "-" + p3;

        let email = $.trim($("#email").val());

        let addr1 = $.trim($("#addr1").val());
        let addr2 = $.trim($("#addr2").val());

        let mailchk = $("#mailchk").prop("checked") ? "Y" : "N";
        let smschk = $("#smschk").prop("checked") ? "Y" : "N";

        let state = $("#state").val();
        // 데이터에서 공백 제거
        
        p1 = p1.replace(" ","");
        p2 = p2.replace(" ","");
        p3 = p3.replace(" ","");
        email = email.replace(" ","");

        $("#p1").val(p1);
        $("#p2").val(p2);
        $("#p3"). val(p3);
        $("#email").val(email);
        $("#addr2"). val(addr2);

        // 휴대폰 번호가 비어 있는지 확인
        if(phone == "") {
            alert("휴대폰 번호를 입력해주세요.");
            $("#phone").focus();
            return false;
        }
        // 휴대폰 번호 정규 표현식 처리
        let phone_pattern = /^\d{3}-\d{3,4}-\d{4}$/;
        if (!phone_pattern.test(phone)) {
            alert("유효하지 않은 휴대폰 번호입니다.\n다시 입력해주세요.");
            $("#phone").focus();
            return false;
        }

        // 이메일이 비어 있는지 확인
        if(email == "") {
            alert("이메일을 입력해주세요.");
            $("#email").focus();
            return false;
        }
        // 이메일 정규 표현식 처리
        let email_pattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[ 0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
        if (!email_pattern.test(email)) {
            alert("잘못된 이메일 형식입니다.\n다시 입력해주세요.");
            $("#email").focus();
            return false;
        }

        // 주소1이 비어 있는지 확인
        if(addr1 == "") {
            alert("주소를 입력해주세요.");
            $("#addr1").focus();
            return false;
        }

        // 상세 주소가 비어 있는지 확인
        if(addr2 == "") {
            alert("상세 주소를 입력해주세요.");
            $("#addr2").focus();
            return false;
        }
		
     	// 세션아이디가 admin인지 체크
        let s_userid = $("#s_userid").val();
        if (s_userid !== "admin") { 
            return false;
        }
        
        // 회원 등록 정보 입력 값
        let datas = {
            "userid":userid,
            "birth":birth,
            "phone":phone,
            "email":email,
            "addr1":addr1,
            "addr2":addr2,
            "mailchk":mailchk,
            "smschk":smschk,
            "state":state
        };

        // 회원 등록 정보 입력 값 전송
        $.ajax({
            // 전송 방식
            type: "POST",
            // URL 설정
            url: "/libAdminMemberModifySave.do",
            // 데이터 설정
            data: datas,
            // 결과 값 설정
            datatype: "text",
            success: function(data) {
                if(data == "1") {
                    alert("수정이 완료되었습니다.");
                    // 관리자메인 페이지로 이동
                    location = "libAdminMemberList.do";
                } else if(data == "no") {
                	alert("현재 대출중인 책이 있습니다.\n반납 후 탈퇴 가능합니다.");
                } else if(data == "no2") {
                	alert("현재 대실중인 열람실이 있습니다.\n퇴실 후 탈퇴 가능합니다.");
                } else {
                    alert("수정 중 오류가 발생하였습니다.");
                }
            },
            error: function() {
                alert("데이터 전송 실패");
            }
        });
    });
});
</script>


<body>
	<header class="header1">
		<%@include file = "../include/header1.jsp" %>
	</header>
	<header class="header2">
		<%@include file = "../include/header2.jsp" %>
	</header>
	
	<nav class="nav2">
		<%@include file = "../include/nav2.jsp" %>
	</nav>
	
	<section class="section1">
		<div class="sec1">
				
			
				<div class="flex-item">
					<div class="container" style="border:0px solid black; margin-left:180px;" >
				     
				     <!-- 본문 입력 -->
				     
				  <div id="wrapper_title">정보 수정</div>
		        <div class="mbskin">
		    
		            <form id="frm" name="frm">
		            <input type="hidden" id="s_userid" value="${s_userid}" />
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
			                    	<input type="text" name="userid" value="${vo.userid }" id="userid" class="input " minlength="4" maxlength="15" readonly>
			                        <span id="msg_userid"></span>
			                    </td>
			                </tr>
			                <tr>
		                        <th><label for="birth">생년월일</label></th>
		                        <c:set var="dateParts" value="${vo.birth.split('-')}"/>

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
		                        <c:set var="phoneParts" value="${vo.phone.split('-')}"/>

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
		                            <label for="smschk"><input type="checkbox" name="smschk" id="smschk" value="Y" 
		                            <c:if test="${vo.smschk == 'Y' }">checked</c:if> onClick="return false;">SMS를 받겠습니다.</label>
		                        </td>
		                    </tr>
		                    <tr>
		                        <th><label for="email">E-mail</label></th>
		                        <td>
		                            <input type="email" name="email" value="${vo.email }" id="email" class="input" style="width:350px;" size="70" maxlength="100"><br>
		                            <label for="mailchk"><input type="checkbox" name="mailchk" id="mailchk" value="Y"
		                            <c:if test="${vo.mailchk == 'Y' }">checked</c:if> onClick="return false;">정보 메일을 받겠습니다.</label>
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
					        <tr>
					        	<th>탈퇴</th>
					        	<td>
					        		<select id="state" name="state">
					        			<option value="N" <c:if test="${vo.state == 'N' }">selected</c:if> >정상</option>
					        			<option value="Y" <c:if test="${vo.state == 'Y' }">selected</c:if> >탈퇴</option>
					        		</select>
					        	</td>
					        </tr>
			                </tbody>
		                </table>
		            </div>
		
		        <div class="submit">
		            <input type="submit" value="수정하기" id="btn_submit" onclick="return false;" class="btn_submit" accesskey="s">
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