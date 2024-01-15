<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="session_id" value="${sessionScope.SessionUserID }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>
<link rel="stylesheet" href="../css/lib.css">

<script>
var session_id = "${session_id}";

    if (session_id == null || session_id.trim() == "") {
        alert("로그인이 필요한 서비스입니다.");
        window.location.href = "libLoginWrite.do"; // 로그인 페이지로 리다이렉트
    }

</script>

<script>
$(function(){
    $("#modify_button").click(function(){
        location = "/libModifyCheck.do";
    });
    
    $("#resign_button").click(function(){
        location = "/libMemberResign.do";
    });
});

function fn_popup() {
	let url = "/libPassChange.do"
	
	var popupX = (document.body.offsetWidth / 2) - (400 / 2);
	var popupY= (window.screen.height / 2) - (500 / 2);

	window.open(url,"암호변경팝업","width=500,height=400,left="+ popupX + ", top="+ popupY);
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
                <%@include file="../include/aside5.jsp" %>
            </aside>

            <div class="container" style="border:0px solid black; margin-left:300px;">
                <!-- 본문 입력 -->
                <div id="wrapper_title">회원 정보</div>
                <form id="frm" name="frm">
                    <input type="hidden" id="id_usable" value="N">
                    <div class="tbl_frm01 tbl_wrap">
                        <table class="table1">
                            <colgroup>
                                <col width="15%">
                                <col width="*">
                            </colgroup>

                            <tr>
                                <th><label for="name">이름</label></th>
                                <td>${vo.name}</td>
                            </tr>
                            <tr>
                                <th><label for="userid">아이디</label></th>
                                <td>${vo.userid}<span id="msg_userid"></span></td>
                            </tr>
                            <tr>
                                <th><label for="birth">생년월일</label></th>
                                <td>
                                    ${vo.birth}
                                </td>
                            </tr>
                            <tr>
                                <th><label for="phone">휴대폰번호</label></th>
                                <td>${vo.phone} </td>
                            </tr>
                            <tr>
                                <th><label for="email">E-mail</label></th>
                                <td>${vo.email} </td>
                            </tr>
                            <tr>
                                <th>주소</th>
                                <td>${vo.addr1 } ${vo.addr2 } </td>
                            </tr>
                            <tr>
                                <th>메일링 서비스</th>
                                <td>
                                    <label for="smschk">
                                        <input type="checkbox" name="smschk" id="smschk" <c:if test="${vo.mailchk == 'Y' }">checked</c:if> onclick="return false;">
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <th>SMS 서비스</th>
                                <td>
                                    <label for="smschk">
                                        <input type="checkbox" name="smschk" id="smschk" <c:if test="${vo.smschk == 'Y' }">checked</c:if> onclick="return false;">
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <th>가입일</th>
                                <td>${vo.rdate}</td>
                            </tr>

                        </table>
                    </div>

                    <div class="">
                        <input type="button" value="내정보 수정" id="modify_button" onclick="return false;" class="btn">
                        <input type="button" value="비밀번호 변경" onclick="fn_popup();" class="btn">
                        <input type="button" value="탈퇴하기" id="resign_button" class="btn">
                    </div>
                </form>
                <!-- 본문 입력 -->
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