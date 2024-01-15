<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="session_id" value="${sessionScope.SessionUserID }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 목록</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>
<link rel="stylesheet" href="../css/lib.css">

<script>
var session_id = "${session_id}";

    if (session_id == null || session_id.trim() == "") {
        alert("로그인이 필요합니다.");
        window.location.href = "libLoginWrite.do"; // 로그인 페이지로 리다이렉트
    }

</script>

<script>
function fn_page(pageIndex) {
	$("#pageIndex").val(pageIndex);
	document.searchFrm.submit();
	//$("#searchFrm").submit();
}

function fn_previous() {
    var currentPage = parseInt("${vo.pageIndex}");
    var newPage = currentPage - 10;
    if (newPage < 1) {
        newPage = 1;
    }
    fn_page(newPage);
}

function fn_next() {
    var currentPage = parseInt("${vo.pageIndex}");
    var newPage = currentPage + 10;
    var lastPage = parseInt("${vo.lastPage}");
    if (newPage > lastPage) {
        newPage = lastPage;
    }
    fn_page(newPage);
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

  .table1 {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 15px;
  }

  .table1 td, th {
    padding: 10px;
    text-align: center;
    border: 1px solid #ccc;
  }

  .table1 th {
    background-color: #f5f5f5;
  }
  
  .page_number_area {
    text-align: center;
    margin-top: 20px;
  }

  .page_number_area a {
    padding: 5px 10px;
    margin: 0 5px;
    border: 1px solid #ccc;
    border-radius: 3px;
    text-decoration: none;
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
                <%@include file = "../include/aside5.jsp" %>
            </aside>
        
            <div class="flex-item">
                <div class="container" style="border:0px solid black; margin-left:300px;" >

[ 대출 목록 ] 

<table class="table1">

			   <tr>
			       <th width="5%"></th>
			       <th width="10%">표지</th>
			       <th width="*">제목</th>
			       <th width="15%">저자</th>
			       <th width="15%">출판사</th>
			       <th width="15%">ISBN</th>
			       <th width="9%">대출일</th>
			   </tr>
            <c:forEach var="list" items="${list}" varStatus="status">
			    <tr align="center">
			        <td>${status.count }</td>
			        <td><img src="${list.thumbnail}" alt="표지 이미지" style="width: 50px; height: 70px;"></td>
			        <td align="left"><a href="/bookDetail.do?unq=${list.unq}">${list.title}</a></td>
			        <td>${list.authors}</td>
			        <td>${list.publisher}</td>
			        <td>${list.isbn}</td> 
			        <td>${list.rdate}</td>
			    </tr>
			</c:forEach> 
</table><br>

</div>

<div class="container" style="border:0px solid black; margin-left:300px;" >

[ 대출 기록 ] 

<form id="searchFrm" name="searchFrm" method="get" action="/myBookList.do">
       <input type="hidden" name="pageIndex" id="pageIndex" value="1">
</form>        
<table class="table1"> 

			    <tr>
			        <th width="5%"></th>
			        <th width="10%">표지</th>
			        <th width="*">제목</th>
			        <th width="15%">저자</th>
			        <th width="15%">ISBN</th>
			        <th width="9%">대출일</th>
			        <th width="9%">반납일</th>
			    </tr>
			<c:set var="rownumber" value="${vo.recordCountPerPage }"/>
            <c:forEach var="list2" items="${list2}" varStatus="status">
			    <tr align="center">
			        <td>${list2.rn }</td>
			        <td><img src="${list2.thumbnail}" alt="표지 이미지" style="width: 50px; height: 70px;"></td>
			        <td align="left"><a href="/bookDetail.do?unq=${list2.code}">${list2.title}</a></td>
			        <td>${list2.authors}</td>
			        <td>${list2.isbn}</td> 
			        <td>${list2.rdate}</td>
			        <td>${list2.edate}</td>
			    </tr>
			<c:set var="rownumber" value="${rownumber-1 }"/>    
			</c:forEach> 
		</table><br>
			<div class="page_number_area">
			    <a href="javascript:fn_previous()">이전</a>  
			    <c:set var="startPage" value="${firstPage }" />
			    <c:set var="endPage" value="${startPage + 9}" />
			    <c:choose>
			        <c:when test="${endPage > vo.lastPage}">
			            <c:set var="endPage" value="${vo.lastPage}" />
			        </c:when>
			    </c:choose>
			    <c:forEach var="i" begin="${startPage}" end="${endPage}">
			        <a href="javascript:fn_page('${i }')">${i }</a>  
			    </c:forEach>
			    <a href="javascript:fn_next()">다음</a>
			</div>

</div>



                </div>
        </div>
    </section>
    
    <footer class="footer">
            <%@include file = "../include/footer.jsp" %>
    </footer>
    <aside class="new-aside">
        <%@include file="../include/newaside.jsp"%>
    </aside>

</body>
</html>
