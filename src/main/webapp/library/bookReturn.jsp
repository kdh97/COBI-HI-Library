<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 반납</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>
<link rel="stylesheet" href="../css/lib.css">

<script>

function fn_page(pageIndex) {
    $("#pageIndex").val(pageIndex);
    document.searchFrm.submit();
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
$(function() {

    $(".return-button").click(function() {
        let confirmResult = confirm("반납하시겠습니까?");
        if (confirmResult) {
            let unq 	= $(this).data("unq");
            let userid 	= $(this).data("id");
            let isbn 	= $(this).data("isbn");
            $.ajax({
                type: "POST",
                data: { "unq": unq,"id":userid,"isbn":isbn },
                url: "/bookReturnSave.do",
                datatype: "text",
                success: function(data) {
                    if (data === "ok") {
                        alert("반납이 완료되었습니다.");
                        location.reload(); // 페이지 새로고침
                    } else {
                        alert("반납 실패!");
                    }
                },
                error: function() {
                    alert("전송실패");
                }
            });
        }
    });
});
</script>

<style>
<style>
.page_number_area a {
    text-decoration: none;
    margin: 0 5px;
    color: black; /* 기본 링크 색상 */
}

.page_number_area a.active {
    color: red; /* 클릭된 링크 색상 */
    font-weight: bold; /* 클릭된 링크 글씨 굵게 */
}

.book-table {
    width: 900px; /* 변경할 너비 값을 지정하세요. 예: 100%, 90%, 800px 등 */
    border-collapse: collapse;
    margin-top: 20px;
}

.book-table th, .book-table td {
    padding: 10px;
    border: 1px solid #ddd;
    text-align: center;
}

.book-table th {
    background-color: #f2f2f2;
    font-weight: bold;
}

.book-cover {
    width: 50px;
    height: 70px;
}

.book-title {
    text-align: left;
}

.no-user {
    color: blue;
}

.user {
    color: red;
}

.return-button {
    background-color: #3498db;
    color: white;
    border: none;
    padding: 6px 10px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.return-button:hover {
    background-color: #2980b9;
}
.search-form {
  display: flex;
  align-items: right;
  float:right;
  margin-bottom: 20px;
  margin-right:-98px;
}

.search-select, .search-input, .search-button {
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

.search-select {
  margin-right: 10px;
  height:36px;
}

.search-input {
  margin-right: 10px;
  height:14px;
}

.search-button {
  background-color: #007bff;
  color: white;
  border: none;
  cursor: pointer;
  transition: background-color 0.3s;
  height:36px;
}

.search-button:hover {
  background-color: #555;
}

</style>

</head>
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
                <div class="container" style="border:0px solid black; margin-left:130px;">
                    
                    <p>
                        <form name="searchFrm" id="searchFrm" method="post" action="/bookReturn.do" class="search-form">
                            <input type="hidden" name="pageIndex" id="pageIndex" value="1">
                            <select name="searchCondition" class="search-select">
                                <option value="title" <c:if test="${vo.searchCondition=='title' }">selected</c:if> >제목</option>
                                <option value="authors" <c:if test="${vo.searchCondition=='authors' }">selected</c:if> >저자</option>
                                <option value="isbn" <c:if test="${vo.searchCondition=='isbn' }">selected</c:if> >ISBN</option>
                                <option value="id" <c:if test="${vo.searchCondition=='id' }">selected</c:if> >대출자</option>
                            </select>
                            <input type="text" name="searchKeyword" value="${vo.searchKeyword }" autofocus class="search-input">
                            <button type="submit" class="search-button">검색</button>
                        </form>
                    </p>
                    <table class="book-table">
                        <thead>
                            <tr>
                                <th width="6%">번호</th>
                                <th width="10%">표지</th>
                                <th width="27%">제목</th>
                                <th width="15%">저자</th>
                                <th width="15%">출판사</th>
                                <th width="15%">ISBN</th>
                                <th width="12%">대출자</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:set var="rownumber" value="${vo.recordCountPerPage }" />
                            <c:forEach var="list" items="${resultList}" varStatus="status">
                                <c:if test="${list.title.contains(vo.searchKeyword) || list.authors.contains(vo.searchKeyword) || list.isbn.contains(vo.searchKeyword) || (vo.searchCondition == 'id' && list.id != null)}">
                                    <tr>
                                        <td>${rownumber }</td>
                                        <td><img src="${list.thumbnail }" alt="표지 이미지" class="book-cover"></td>
                                        <td class="book-title"><a href="/bookDetail.do?unq=${list.unq }">${list.title }</a></td>
                                        <td>${list.authors }</td>
                                        <td>${list.publisher }</td>
                                        <td>${list.isbn }</td>
                                        <td>
                                            <c:if test="${list.id == null }">
                                                <span class="no-user">대출가능</span>
                                            </c:if>
                                            <c:if test="${list.id != null }">
                                                <span class="user">${list.id }<br>
                                                    <button type="button" class="return-button" data-unq="${list.unq}" data-id="${list.id}" data-isbn="${list.isbn }">반납</button>
                                                </span>
                                            </c:if>
                                        </td>
                                    </tr>
                                    <c:set var="rownumber" value="${rownumber-1 }" />
                                </c:if>
                            </c:forEach>
                        </tbody>
                    </table><br>
                    <div class="page_number_area" style="margin-left:60px;">
                        <a href="javascript:fn_previous()">이전</a>
                        <c:set var="startPage" value="${firstPage }" />
                        <c:set var="endPage" value="${startPage + 9}" />
                        <c:choose>
                            <c:when test="${endPage > vo.lastPage}">
                                <c:set var="endPage" value="${vo.lastPage}" />
                            </c:when>
                        </c:choose>
                        <c:forEach var="i" begin="${startPage}" end="${endPage}">
                            <a href="javascript:fn_page('${i }')" class="${i == vo.pageIndex ? 'active' : ''}">${i }</a>
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
        <%@include file = "../include/newaside.jsp" %>
    </aside>

</body>
</html>
