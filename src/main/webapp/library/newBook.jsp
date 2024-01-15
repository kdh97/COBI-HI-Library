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

<style>

.booktable {
	border-top:3px solid #c8c8c8;
	width:800px;
	border-collapse:collapse;
	
}
.booktable tr {
	border-top:1px solid #c8c8c8; 
	border-collapse:collapse;
	height:200px;
}
.bookdiv {
	width:700px; 
	height:170px; 
	border:0px solid black;
	position:relative;
	display: flex; /* Added to make flex layout */
	align-items: center; /* Center vertically */
}
.bookinfo {
	width:450px; 
	height:100px;
	display: inline;
	border:0px solid black;
	position:right;
	right:20px;  
}
.bookthum {
	width: 130px; 
	height: 170px; 
	float:left;
	padding-left:30px;
	margin-top:30px;
}
.link-style {
    font-size: 22px;  
    font-weight: bold;
    text-decoration: none;
    float:left;
    padding: 5px 0 0 5px;
    margin-left:30px;
}
.text-style1 {
    font-size: 15px;
    margin-top:15px;
    margin-left:35px;
    float:left;
    clear:left;
}
.text-style2 {
    font-size: 15px;
    margin-top:15px;
    margin-left:35px;
    float:left;
    clear:left;
}
.text-style3 {
    font-size: 15px;
    margin-top:15px;
    margin-left:35px;
    float:right;
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
            <%@include file = "../include/aside2.jsp" %>
        </aside>
        
        <div class="flex-item">
            <div class="container" style="border:0px solid black; margin-left:300px;">
                신착 도서 목록 <br><Br>
                <table class="booktable">
                    <c:forEach var="list" items="${resultList}" varStatus="status">
                            <c:if test="${status.index < 6}">
                                <tr>
                                    <td align="center">${status.index + 1}위</td>
                                    <td>
                                        <div class="bookdiv"> 
                                            <a href="/bookDetail.do?unq=${list.unq }"><img src="${list.thumbnail }" alt="표지 이미지" class="bookthum"></a>
                                            <div class="bookinfo">
                                                <a href="/bookDetail.do?unq=${list.unq }" class="link-style">${list.title }</a> <br>
                                                <div class="text-style1">${list.authors } | ${list.publisher } | ${list.datetime }</div>
                                                <div class="text-style2">${list.isbn }</div>
                                            </div>
                                        </div>
                                        <div class="text-style3">등록일자 : ${list.rdate }</div>
                                    </td>
                                </tr>
                            </c:if>
                    </c:forEach>   
                </table><br>
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
