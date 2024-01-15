<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>   
<c:set var="session_id" value="${sessionScope.SessionUserID }"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공시사항 수정</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>
<link rel="stylesheet" href="../css/lib.css">

<script>
var session_id = "${sessionScope.SessionUserID}";

if (session_id !== "admin") {
     alert("관리자만 접근할 수 있습니다.");
    window.location.href = "/"; // 접근이 차단되었을 때 이동할 페이지 주소
}
 $(function(){    
	 $("#button1").click(function(){ 
		 
		 if( $("#title").val() == "" ) {
			 alert("제목을 입력해주세요.");
			 $("#title").focus();
			 return false;
		 }
		 
		 /**
		  * serialize() : 폼안의 데이터 값들을 한번에 전송가능 상태로 만듬
		  */
		 // var form = new FormData(document.getElementById('frm'));
		  var form = $("#frm").serialize();
		  $.ajax({
			 // 전송관련 세팅
			 type : "POST",
			 data :  form,
			 url  : "/libNoticeModifySave.do",
			// processData: false, // 파일이 전송되는 경우의 설정
	  		// contentType: false, // 파일이 전송되는 경우의 설정
	  		 
	  		 
			 // 반환관련 세팅 
			 datatype : "text", // json
			 success : function(data) {
				 if(data == "ok") {
					alert("수정완료!");
					location = "/libNoticeList.do";
				 } else {
					 alert("수정실패!");
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
#wrapper_title{
       background-color: #f2f2f2;
        padding: 20px;
        text-align: center;
        font-size: 24px;
        font-weight: bold;
        color: #333;
}
.content_area {
	width:100%;
	text-align:center; 
}
.page_number_area {
	width:100%;
	text-align:center;
	padding-top:20px;
} 
.board1 {
	width:800px;
	border-top:2px solid #474747;
	border-bottom:1px solid #cccccc;
	border-collapse:collapse;
}
.board1 th {
	border-bottom:1px solid #cccccc;
	border-collapse:collapse;
	padding:5px;
	height:30px;
}
.board1 td {
	border-bottom:1px solid #cccccc;
	border-collapse:collapse;
	padding:5px;
	text-align:center;
	height:20px;
}
.input1 { width:98%; }
.textarea1  { width:98%; height:200px; }

.page_number_area {
	width:100%;
	text-align:center;
	padding-top:20px;
} 
.btn {
  width: 80px;
  padding: 10px;
  background-color: #007bff;
  color: #fff;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.btn:hover {
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

    <nav class="nav2">
        <%@include file = "../include/nav2.jsp" %>
    </nav>

    <section class="section1">
        <div class="sec1">

            <div class="flex-item">
                <div class="container" style="border:0px solid black; margin-left:180px;">

                    <div id="wrapper_title">게시물 수정</div>

                    <div class="content_area">
                        <form name="frm" id="frm" enctype="multipart/form-data">

                            <input type="hidden" name="unq" value="${vo.unq }">

                            <table class="board1" align="center">
                                <tr>
                                    <th width="20%">제목</th>
                                    <td width="*">
                                        <input type="text" name="title" id="title" class="input1" value="${vo.title }">
                                    </td>
                                </tr>
                                <tr>
                                    <th>이름</th>
                                    <td><input type="text" name="name" id="name" class="input1" value="${vo.name }"></td>
                                </tr>
                                <tr>
                                    <th>공지여부</th>
                                    <td style="text-align:left;'">
                                        <!-- emps="Y" emps=null-->
                                        <input type="checkbox" name="emps" id="emps" value="Y" <c:if test="${vo.emps=='Y'}">checked</c:if> > 공지
                                    </td>
                                </tr>
                                <tr>
                                    <th>내용</th>
                                    <td>
                                        <textarea name="content" id="content" class="textarea1">${vo.content }</textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <th>파일</th>
                                    <td>
                                        <input type="file" name="file1" id="file1" style="width:50%" class="input1" value="${vo.file1 }"> <br>
                                        <input type="file" name="file2" id="file2" style="width:50%" class="input1" value="${vo.file2 }">
                                    </td>
                                </tr>
                            </table>
                            <div style="margin-top:20px;">
                                <button type="button" id="button1" class="btn">수정</button>
                                <button type="reset" onclick="history.back();" class="btn">취소</button>
                            </div>
                        </form>
                    </div>
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




