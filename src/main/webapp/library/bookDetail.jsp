<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="session_id" value="${sessionScope.SessionUserID }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 상세</title>
</head>
<style>
 /* Custom CSS styles for the table */
.content_area table {
  border-collapse: collapse;
  width: 80%;
  margin: auto;
  margin-top: 20px;
}

.content_area td {
  padding: 10px;
  border: 1px solid #ccc;
  text-align: left;
}

.content_area th {
  background-color: #f2f2f2;
  font-weight: bold;
  padding: 10px;
  border: 1px solid #ccc;
}

.content_area img {
  display: block; /* Added this line */
  margin: auto; /* Added this line */
  max-width: 250px;
  max-height: 350px;
  border: 1px solid #ccc;
  padding: 5px;
}

.rent-button {
  font-size: 20px;
  padding: 5px 10px;
  background-color: #3498db;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

.rent-button:hover {
  background-color: #2980b9;
}
</style>
<link rel="stylesheet" href="../css/lib.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>



<script>
$(function(){ 
    $(".rent-button").click(function(){
        let userid = "${sessionScope.SessionUserID }";
        let unq = ${vo.unq};
        let thumbnail    = "${vo.thumbnail}";
        let title       = "${vo.title}";
        let authors    = "${vo.authors}";
        let datetime    = "${vo.datetime}";
        let isbn       = "${vo.isbn}";
        
        

        if (userid === "admin") {
            let id1 = prompt("아이디를 입력하세요:");
            if (id1) {
                $.ajax({
                    type: "POST",
                    data: {"unq":unq,"id":id1,"thumbnail":thumbnail,"title":title,"authors":authors,"datetime":datetime,"isbn":isbn},
                    url: "/bookRentSave.do",
                    dataType: "text",  
                    success: function(data){
                        if (data === "overRent") {
                            alert("1인당 3권까지 대출 가능합니다.");
                        } else if (data === "ok") {
                            alert("대출완료 ! \n대출기간은 7일입니다.");
                            location = "/bookReturn.do";
                        } else if (data === "notMember") {
                        	alert("존재하지 않는 아이디입니다.");
                        } else {
                            alert("저장 실패!");
                        }
                    },
                    error: function(){
                        alert("전송 실패");
                    }
                });
            }
        } else {
            $.ajax({
                type: "POST",
                data: {"unq":unq,"id":userid,"thumbnail":thumbnail,"title":title,"authors":authors,"datetime":datetime,"isbn":isbn},
                url: "/bookRentSave.do",
                dataType: "text",  
                success: function(data){
                    if (data === "overRent") {
                        alert("1인당 3권까지 대출 가능합니다.");
                    } else if (data === "ok") {
                        alert("대출완료 ! \n대출기간은 7일입니다.");
                        location = "/bookRent.do";
                    } else {
                        alert("로그인 후 이용가능합니다.");
                    }
                },
                error: function(){
                    alert("전송 실패");
                }
            });
        }
    });
});
</script>

<body>
    <header class="header1">
        <%@include file="../include/header1.jsp" %>
    </header>
    <header class="header2">
        <%@include file="../include/header2.jsp" %>
    </header>

    
    <c:if test="${s_userid != 'admin' }">
    <nav class="nav">
        <%@include file="../include/nav.jsp" %>
    </nav>
    </c:if>
    <c:if test="${s_userid == 'admin' }">
    <nav class="nav2">
        <%@include file="../include/nav2.jsp" %>
    </nav>    
    </c:if>
    

    <section class="section1">
        <div class="sec1">
        	<c:if test="${s_userid != 'admin' }">
            <aside class="aside">
                <%@include file="../include/aside2.jsp" %>
            </aside>
            </c:if>

            <div class="flex-item">
                <div class="container" style="border:0px solid black; margin-left:
                <c:if test="${s_userid != 'admin' }">
                300px;
                </c:if>
                <c:if test="${s_userid == 'admin' }">
                180px;
                </c:if>
                ">

                    <div class="content_area">
                        <form name="frm" id="frm">

                            <input type="hidden" name="unq" id="unq" value="${vo.unq }">

                            <table align="center" height="800px;" border="1">
                                <tr>
                                    <th width="20%">제목</th>
                                    <td>${vo.title }</td>
                                </tr>
                                <tr>
                                    <th>썸네일</th>
                                    <td height="400px;"><img src="${vo.thumbnail}" alt="표지 이미지" style="width: 250px; height: 350px;"></td>
                                </tr>
                                <tr>
                                    <th>저자</th>
                                    <td>${vo.authors }</td>
                                </tr>
                                <tr>
                                    <th>출판사</th>
                                    <td>${vo.publisher }</td>
                                </tr>
                                <tr>
                                    <th>출판일</th>
                                    <td>${vo.datetime }</td>
                                </tr>
                                <tr>
                                    <th>ISBN</th>
                                    <td>${vo.isbn }</td>
                                </tr>
                                <tr>
                                    <th>줄거리</th>
                                    <td>
                                        <div>${vo.contents}</div>
                                    </td>
                                </tr>
                            </table>

                        </form><br>

                        <c:if test="${vo.id == null }">
                            <button type="submit" class="rent-button" style="font-size: 15px; padding: 5px 5px;">대출하기</button>
                        </c:if>

                        <c:if test="${vo.id != null }">
                            <span style="color: red; font-size: 20px;">대출중인 도서입니다.</span>
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
        <%@include file="../include/newaside.jsp" %>
    </aside>
</body>
</html>