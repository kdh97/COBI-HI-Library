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
<title>문화행사 상세</title>
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
 $(function() {    
	 $("#button1").click(function(){   // 목록
		 location = "/libEventList.do";
	 });
	 
	 $("#button2").click(function(){   // 수정
		 var unq = $("#unq").val();
		 location = "/libEventModify.do?unq="+unq;	
	 });
	 
	 $("#button3").click(function(){   // 삭제
		 if( confirm("정말삭제하시겠습니까?") ) {
		 var unq = $("#unq").val();
	     var formData = new FormData();
	     formData.append("unq", unq);
	     deleteFile("/libEventDelete.do", formData);
		 }
	 });
 });	 

function deleteFile(url,data) {
		 
	  //var form = new FormData(document.getElementById('frm'));
	  //var form = $("#frm").serialize(); //파일전송가능한 형태로 만들어야함
	  $.ajax({
		 // 전송관련 세팅
		 type : "POST",
		 data :  data,
		 url  :  url,
		 processData: false, // 파일이 전송되는 경우의 설정
  		 contentType: false, // 파일이 전송되는 경우의 설정
		 
		 // 반환관련 세팅 
		 datatype : "text", // json
		 success : function(data) {
			 if(data == "ok") {
				alert("삭제완료!");
				location = "/libEventList.do";
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
        <%@include file="../include/header1.jsp" %>
    </header>
    <header class="header2">
        <%@include file="../include/header2.jsp" %>
    </header>

    <nav class="nav2">
        <%@include file="../include/nav2.jsp" %>
    </nav>

    <section class="section1">
        <div class="sec1">

            <div class="flex-item">
                <div class="container" style="border:0px solid black; margin-left:180px;">
                    <!-- 문화행사 자세히 -->
                    <div id="wrapper_title">문화행사 자세히</div>

                    <div class="content_area">
                        <form name="frm" id="frm" enctype="multipart/form-data">
                            <!-- 파일 전송하지 않으므로 enctype은 필요 없음 -->

                            <!-- 히든 필드: unq 값 전달 -->
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
                                   
                                    <td colspan="2">
                                        
                                            <c:if test="${vo.file1 != null}">
                                                <c:set var="imagePath" value="${pageContext.request.contextPath}/libImage/${vo.file1}" />
                                                <img src="${imagePath}" style="width:500px; height:650px;">
                                                <br>
                                            </c:if>
                                        <div style="min-height:50px; display: flex; align-items: center; justify-content: center;">
                                            ${vo.content }
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>이미지파일</th>
                                    <td><a href="${pageContext.request.contextPath}/libImage/${vo.file1}">${vo.file1}</a></td>
                                </tr>
                                <tr>
                                    <th>첨부파일</th>
                                    <td><a href="${pageContext.request.contextPath}/libImage/${vo.file2}">${vo.file2}</a></td>
                                </tr>
                            </table>
                            <div style="margin-top:20px;">
                                <button type="button" id="button1" class="btn">목록</button>
                                <button type="button" id="button2" class="btn">수정</button>
                                <button type="button" id="button3" class="btn">삭제</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <footer class="footer">
        <%@include file="../include/footer.jsp" %>
    </footer>
    <aside class="new-aside">
        <%@include file="../include/newaside.jsp" %>
    </aside>
</body>
</html>




