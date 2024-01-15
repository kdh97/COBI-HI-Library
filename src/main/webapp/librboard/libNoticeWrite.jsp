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
<title>공지사항 등록</title>
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
		 if( $("#content").val() == "" ) {
			 alert("내용을 입력해주세요.");
			 $("#content").focus();
			 return false;
		 }
		  
		 var empsValue = $("#emps").prop("checked") ? "Y" : "N";
	        
	        var form = new FormData(document.getElementById('frm'));
	        //var form = $("#frm").serialize();
	        
	        // 데이터 추가
	        form.append("emps", empsValue);
		 
		  //var form = new FormData(document.getElementById('frm'));
		  //var form = $("#frm").serialize();
		  
		  $.ajax({
			 // 전송관련 세팅
			 type : "POST",
			 data :  form,
			 url  : "/libNoticeWriteSave.do",
			 processData: false, // 파일이 전송되는 경우의 설정
	  		 contentType: false, // 파일이 전송되는 경우의 설정
			 
			 // 반환관련 세팅 
			 datatype : "text", // json
			 success : function(data) {
				 if(data == "ok") {
					alert("저장완료!");
					location = "/libNoticeList.do";
				 } else {
					 alert("저장실패!");
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
  width: 60px;
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


                    <div id="wrapper_title">게시물 등록</div>

                    <div class="content_area">
                        <form name="frm" id="frm" enctype="multipart/form-data">
                            <table class="board1" align="center">
                                <tr>
                                    <th width="20%">제목</th>
                                    <td width="*"><input type="text" name="title" id="title" class="input1"></td>
                                </tr>
                                <tr>
                                    <th>이름</th>
                                    <td><input type="text" name="name" id="name" class="input1" value="관리자"></td>
                                </tr>
                                <tr>
                                    <th>공지여부</th>
                                    <td style="text-align:left;">
                                        <!-- emps="Y"// emps='N'-->
                                        <input type="checkbox" name="emps" id="emps" value="Y"> 공지
                                    </td>
                                </tr>
                                <tr>
                                    <th>내용</th>
                                    <td> <textarea name="content" id="content" class="textarea1"></textarea></td>
                                </tr>
                                <tr>
                                    <th>파일</th>
                                    <td>
                                        <input type="file" name="file1" id="file1" style="width:50%"> <br>
                                        <input type="file" name="file2" id="file2" style="width:50%">
                                    </td>
                                </tr>
                            </table>
                            <div style="margin-top:20px;">
                                <button type="button" id="button1" onclick="return false;" class="btn">저장</button>
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





