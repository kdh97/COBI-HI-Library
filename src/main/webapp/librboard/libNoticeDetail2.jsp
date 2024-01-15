<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세</title> <!-- 일반회원화면 -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>
<link rel="stylesheet" href="../css/lib.css">

<script>
 $(function() {    
	 $("#button1").click(function(){   // 목록
		 location = "/libNoticeList2.do";
	 });
	 
	
 });	 

function fn_submit(url) {
		 
	 /**
	  * serialize() : 폼안의 데이터 값들을 한번에 전송가능 상태로 만듬
	  */
	  //var form = new FormData(document.getElementById('frm'));
	  var form = $("#frm").serialize();
	  $.ajax({
		 // 전송관련 세팅
		 type : "POST",
		 data :  form,
		 url  :  url,
		 //processData: false, // 파일이 전송되는 경우의 설정
  		 //contentType: false, // 파일이 전송되는 경우의 설정
		 
		 
		 // 반환관련 세팅 
		 datatype : "text", // json
		 success : function(data) {
			 if(data == "ok") {
				alert("삭제완료!");
				location = "/libNoticeList2.do";
			 } else {
				 alert("삭제실패!");
			 }
		 },
		 error : function() {
			 alert("전송실패");
		 }
	 });
}


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

    <nav class="nav">
        <%@include file = "../include/nav.jsp" %>
    </nav>

    <section class="section1">
        <div class="sec1">
            <aside class="aside">
                <%@include file = "../include/aside3.jsp" %>
            </aside>

            <div class="flex-item">
                <div class="container" style="border:0px solid black; margin-left:300px;">

                    <div id="wrapper_title">게시판 자세히</div>

                    <div class="content_area">
                        <form name="frm" id="frm" enctype="multipart/form-data">

                            <input type="hidden" name="unq" id="unq" value="${vo.unq }">

                            <table class="board1" align="center">
                                <tr>
                                    <th width="20%">제목</th>
                                    <td width="*">${vo.title }</td>
                                </tr>
                                <tr>
                                    <th>이름</th>
                                    <td>${vo.name }</td>
                                </tr>
                                <tr>
                                    <th>공지여부</th>
                                    <td style="text-align:center;"> <!-- emps="Y" emps=null-->
						 				<c:if test="${vo.emps=='Y'}"> 공지글 </c:if>
					 					<c:if test="${vo.emps=='N'}"> 일반글 </c:if>
							 		</td>
                                </tr>
                                <tr>
                                    <th>내용</th>
                                    <td>
                                        <div style="min-height:300px; display: flex; align-items: center; justify-content: center;">${vo.content }</div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>첨부파일1</th>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/libImage/${vo.file1}">${vo.file1}</a>
                                    </td>
                                <tr>
                                    <th>첨부파일2</th>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/libImage/${vo.file2}">${vo.file2}</a>
                                    </td>
                                </tr>
                            </table>
                            <div style="margin-top:20px;">
                                <button type="button" id="button1" class="btn">목록</button>

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




