<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="s_userid" value="${sessionScope.SessionUserID }"/>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@200&display=swap" rel="stylesheet">


<script>

function fn_logout() {
	$.ajax({
		type : "POST",
		data : "", //  전송되는 데이터 값은 없다.
		url : "/libLogout.do", 
		
		datatype : "text",
		success 	 : function(data) {
			 if(data == "1") {
					alert("로그아웃 되었습니다.");
					location = "/"; // 메인화면으로 이동
				 }
			 },
			error 		 : 	function() {
				 alert("전송실패");
			 }
	});
}

</script>

<div class="libtop" >
<a href="/">홈으로</a> | 
<c:if test="${s_userid == null }">
	<a href="/libConditions.do">회원가입</a> |
	<a href="/libLoginWrite.do"><b>로그인</b></a>
</c:if>
<c:if test="${s_userid != null && s_userid != 'admin' }">
	<a href="/libMemberDetail.do">내 정보</a> |
	<a href="javascript:fn_logout()"><b>로그아웃</b></a>
</c:if>
<c:if test="${s_userid == 'admin' }">
	<a href="/bookInput.do" style="color: red; font-weight: bold;">관리자모드</a> |
	<a href="javascript:fn_logout()"><b>로그아웃</b></a>
</c:if>
</div> 