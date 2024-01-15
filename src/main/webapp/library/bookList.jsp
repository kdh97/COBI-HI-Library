<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

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
function fn_page(pageIndex) {
    $("#pageIndex").val(pageIndex);
    $("#searchFrm").submit();
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
				<%@include file = "../include/aside2.jsp" %>
			 </aside>
        
            <div class="flex-item">
                <div class="container" style="border:0px solid black; margin-left:300px;" >

[ 도서 목록 ] 

<p>
    Total : ${total }
</p>
<p>
    <form id="searchFrm" method="post" action="/bookList.do">
        <input type="hidden" name="pageIndex" id="pageIndex" value="1">
        <select name="searchCondition">
            <option value="title" 
                <c:if test="${vo.searchCondition=='title' }">selected</c:if> >제목</option>
            <option value="authors"
                <c:if test="${vo.searchCondition=='authors' }">selected</c:if> >저자</option>
            <option value="isbn"
                <c:if test="${vo.searchCondition=='isbn' }">selected</c:if> >ISBN</option>
        </select>
        <input type="text" name="searchKeyword" value="${vo.searchKeyword }">
        <button type="submit">검색</button>
    </form>
</p>
<table border="1" width="800" cellpadding="1">

    <tr>
        <th width="7%">번호</th>
        <th width="10%">표지</th>
        <th width="*">제목</th>
        <th width="15%">저자</th>
        <th width="15%">출판사</th>
        <th width="15%">ISBN</th>
        <th width="7%">조회수</th>
    </tr>
    
    <c:set var="rownumber" value="${vo.recordCountPerPage }"/>
    <c:forEach var="list" items="${resultList}" varStatus="status">
        <c:if test="${list.title.contains(vo.searchKeyword) || list.authors.contains(vo.searchKeyword) || list.isbn.contains(vo.searchKeyword)}">
            <tr align="center">
                <td>${rownumber }</td>
                <td><img src="${list.thumbnail }" alt="표지 이미지" style="width: 50px; height: 70px;"></td>
                <td align="left"><a href="/bookDetail.do?unq=${list.unq }">${list.title }</a></td>
                <td>${list.authors }</td>
                <td>${list.publisher }</td>
                <td>${list.isbn }</td>
                <td>${list.hits }</td>
            </tr>
            <c:set var="rownumber" value="${rownumber-1 }"/>
        </c:if>
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
