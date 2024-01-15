<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>문화행사 리스트</title> <!-- 관리자로그인 전 -->
</head>
 
<link rel="stylesheet" href="../css/lib.css">

<style>
    a {
        text-decoration-line: none;
        color: inherit;
    }
	.page_number_area a {
	    text-decoration: none;
	    margin: 0 5px;
	    color: black; /* 기본 링크 색상 */
	}
	
	.page_number_area a.active {
	    color: red; /* 클릭된 링크 색상 */
	    font-weight: bold; /* 클릭된 링크 글씨 굵게 */
	}
    #wrapper_title {
        background-color: #f2f2f2;
        padding: 20px;
        text-align: center;
        font-size: 24px;
        font-weight: bold;
        color: #333;
    }

    .content_area {
        width: 90%;
        text-align: center;
    }

    .page_number_area {
        width: 100%;
        text-align: center;
        padding-top: 20px;
    }

    .board1 {
        width: 800px;
        border-top: 2px solid #474747;
        border-bottom: 1px solid #cccccc;
        border-collapse: collapse;
    }

    .board1 th {
        border-bottom: 1px solid #cccccc;
        border-collapse: collapse;
        padding: 5px;
        height: 30px;
    }

    .board1 td {
        border-bottom: 1px solid #cccccc;
        border-collapse: collapse;
        padding: 5px;
        text-align: center;
        height: 20px;
    }

    .input1 {
        width: 98%;
    }

    .textarea1 {
        width: 98%;
        height: 200px;
    }

    .page_number_area {
        width: 100%;
        text-align: center;
        padding-top: 20px;
    }
    .search-form {
  display: flex;
  align-items: right;
  float:right;
  margin-bottom: 20px;
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
                <%@include file="../include/aside3.jsp" %>
            </aside>

            <div class="flex-item">
                <div class="container" style="border: 0px solid black; margin-left: 300px;">
                    <div id="wrapper_title">문화행사 목록</div>

                    <div class="content_area">
                        <table border="0" width="800" align="center">
                            <tr>
                                <td align="right">
                                    <form name="frm" method="post" action="/libEventList2.do?menu=1" class="search-form">
                                        <select name="searchCondition" class="search-select">
                                            <option value="title">제목</option>
                                            <option value="content">내용</option>
                                            <option value="rdate">날짜</option>
                                        </select>
                                        <input type="text" name="searchKeyword" class="search-input">
                                        <button type="submit" class="search-button">검색</button>
                                    </form>
                                </td>
                            </tr>
                        </table>
                        <table border="0" width="1000" align="center">
                            <tr>
                                <td align="left"> Total : ${total } </td>
                            </tr>
                        </table>
                        <table class="board1" align="center">
                            <colgroup>
                                <col width="10%" />
                                <col width="*" />
                                <col width="15%" />
                                <col width="10%" />
                                <col width="10%" />
                                <col width="10%" />
                            </colgroup>
                            <tr>
                                <th>번호</th>
                                <th>제목</th>
                                <th>글쓴이</th>
                                <th>첨부파일</th>
                                <th>날짜</th>
                                <th>조회</th>
                            </tr>
                            <c:set var="rownumber" value="${vo.recordCountPerPage }"/>
                            <c:forEach var="list" items="${resultList}" varStatus="status">
                                <tr>
                                    <td>${rownumber}</td>
                                    <td style="text-align:left;">
                                        <a href="/libEventDetail2.do?unq=${list.unq}">${list.title}</a>
                                    </td>
                                    <td>${list.name}</td>
                                    <td>
                                        <c:if test="${list.file1 != null || list.file2 != null}">Y</c:if>
                                        <c:if test="${list.file1 == null && list.file2 == null}">N</c:if>
                                    </td>
                                    <td>${list.rdate}</td>
                                    <td>${list.hits}</td>
                                </tr>
                                <c:set var="rownumber" value="${rownumber-1 }"/>
                            </c:forEach>
                        </table>
                    </div>

                    <div class="page_number_area">
                        <c:set var="itemsPerPage" value="10" />
                        <c:set var="totalItems" value="${total}" />

                        <c:set var="totalPages" value="${(totalItems + itemsPerPage - 1) / itemsPerPage}" />
                        <c:set var="startPage" value="${vo.pageIndex - 4}" />
                        <c:if test="${startPage lt 1}">
                            <c:set var="startPage" value="1" />
                        </c:if>

                        <c:set var="endPage" value="${vo.pageIndex + 4}" />
                        <c:if test="${endPage gt totalPages}">
                            <c:set var="endPage" value="${totalPages}" />
                        </c:if>

                        <c:if test="${vo.pageIndex > 1}">
                            <a href="/libEventList2.do?menu=1&pageIndex=${vo.pageIndex - 1}">이전</a>
                        </c:if>

                        <c:forEach var="pageNumber" begin="${startPage}" end="${endPage}">
                            <c:choose>
                                <c:when test="${pageNumber eq vo.pageIndex}">
                                    <a class="active">${pageNumber}</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="/libEventList2.do?menu=1&pageIndex=${pageNumber}">${pageNumber}</a>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>

                        <c:if test="${vo.pageIndex * vo.pageUnit < totalItems}">
                            <a href="/libEventList2.do?menu=1&pageIndex=${vo.pageIndex + 1}">다음</a>
                        </c:if>
                    </div>

                </div>
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