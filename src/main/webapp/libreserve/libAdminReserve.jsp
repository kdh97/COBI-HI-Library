<%@page import="java.util.List"%>
<%@page import="egov.libreserve.service.LibrsService"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="session_id" value="${sessionScope.SessionUserID }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>열람실 관리</title>

<script>

   var session_id = "${sessionScope.SessionUserID}";

   if (session_id !== "admin") {
        alert("관리자만 접근할 수 있습니다.");
       window.location.href = "/"; // 접근이 차단되었을 때 이동할 페이지 주소
   }

   var alertMessage = "${param.alertMessage}";
   if (alertMessage && alertMessage.trim() !== "") {
    alert(decodeURIComponent(alertMessage));
    location.href = "libAdminReserve.do";
   } 
   
   function showSeatInfo1(sitNumber) {
      
       var seatInfoDiv = document.getElementById("seatInfo");
       var seatInfo = "1열람실의 " + sitNumber + "번 좌석은 비어있는 좌석입니다.";

       // 좌석 정보를 설정하고 보여줍니다.
       seatInfoDiv.innerHTML = seatInfo;
       seatInfoDiv.style.display = "block";

       var yOffset = seatInfoDiv.getBoundingClientRect().top + window.scrollY;
       window.scrollTo({
           top: yOffset,
           behavior: "smooth" 
       });
   }
   
   function out1(sitNumber , sessionId , sdate , name) {
      
       var seatInfoDiv = document.getElementById("seatInfo");
       var seatInfo = "현재 " + sitNumber + "번 좌석은 " + name +"("+ sessionId + ")님이 " + sdate + "부터 사용중입니다. 퇴실시키겠습니까?";

       // 좌석 정보를 설정하고 보여줍니다.
       seatInfoDiv.innerHTML = seatInfo;
       seatInfoDiv.style.display = "block";

       createNextButton2(seatInfoDiv, sitNumber, sessionId);
       
       var yOffset = seatInfoDiv.getBoundingClientRect().top + window.scrollY;
       window.scrollTo({
           top: yOffset,
           behavior: "smooth" 
       });
   }
   
   function createNextButton2(container, sitNumber, sessionId) {
       var button = document.createElement("button");
       button.innerHTML = "퇴실";
       button.style.marginLeft = "5px";
       button.classList.add("reserve");
       button.onclick = function () {
          location.href = "librsAdminOut.do?sit_number=" + sitNumber + "&session_id=" + sessionId;
       };
       container.appendChild(button);
      
   }
</script>


</head>
<link rel="stylesheet" href="../css/lib.css">
<style>

a {
  text-decoration: none;
  color:inherit;
}
#seatInfo {
    display: none;
    text-align: center;
    margin-top: 20px;
    border: 1px solid #ccc;
    padding: 10px;
    background-color: #f8f8f8;
    width: 100%;
    box-sizing: border-box;
    line-height: 1.5;
}
#seatContainer {
    position: relative;
    width: 100%;
}

.seatImage {
    z-index: 0;
    width: 100%;
    height: auto;
    /* 기타 스타일 설정 */
}
.seatTable {
    position: absolute;
    top: 133px;
    left: 146px;
    z-index: 1; /* 테이블이 이미지 위에 오도록 설정 */
    /* 기타 스타일 설정 */
}
.seatTable2 {
    position: absolute;
    top: 299px;
    left: 146px;
    z-index: 1; /* 테이블이 이미지 위에 오도록 설정 */
    /* 기타 스타일 설정 */
}
.seatTable3 {
    position: absolute;
    top: 465px;
    left: 146px;
    z-index: 1; /* 테이블이 이미지 위에 오도록 설정 */
    /* 기타 스타일 설정 */
}
.reserve {
		background-color: #007bff;
		color: white;
		border: none;
		cursor: pointer;
		height:25px;
		border-radius: 5px;
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
					<div class="container" style="border:0px solid black; margin-left:180px;" >
				     
				     <!-- 본문 입력 -->
			     	
			     	<!-- 열람실 현황&배정 시작 -->
			     		
			     		<div style="text-align:center;margin-top:20px;">
						    현재 시간 :
						        <% 
						            Date currentDate = new Date();
						            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분");
						            String formattedDate = dateFormat.format(currentDate);
						            out.print(formattedDate);
						        %>
			     			
			    		<div style="text-align:right;margin-bottom:10px;">
			     			<img src="../images/1.gif"> 사용중인좌석 : ${Ytotal } <br>
			     			<img src="../images/2.gif"> 사용가능한좌석 : ${Ntotal }
			     			
			     			<div style="text-align:center;">
						   		열람실 좌석표 보기
			     			</div>
			     		
			     		</div>

			     			  <div id="seatContainer">
			     			  <!-- 좌석 1 ~ 20 시작-->	
								
								<div class="seatTable">		
			     				<table align="center" style="border-spacing:0px;text-align:center;margin-top:10px;">
			     			
			     				<tr>
			     				<c:forEach var="list" items="${rs }">	
			     				
			     					<td style="width:42px;height:27px;">
			     						<div
			     						<c:if test="${list.sitStatus=='Y' && list.sessionId != session_id }">
			     						 style="margin-left:5px;width:80%; height:80%;background: #35B62C; color: white;  border-radius: 20%;"
			     						</c:if>
			     						<c:if test="${list.sessionId==session_id && session_id != null && list.sitStatus=='Y'}">
			     						 style="margin-left:5px;width:80%; height:80%;background: #35B62C; color: white;  border-radius: 20%;"
			     						</c:if>
			     						>
			     						<c:if test="${list.sitStatus=='Y' }">
			     							<c:forEach var="sdate" items="${sdate }">
			     							<c:forEach var="name" items="${name }">
			     								<c:if test="${name.userid==list.sessionId }">
					                    		<c:if test="${sdate.sessionId==list.sessionId && sdate.sitNumber==list.sitNumber}">
			     									<a onclick="out1(${list.sitNumber },'${list.sessionId}','${sdate.sdate }','${name.name }')">${list.sitNumber }</a>
			     								</c:if>
			     								</c:if>
			     							</c:forEach>
			     							</c:forEach>
			     						</c:if>
			     						<c:if test="${list.sitStatus=='N'}">
											<a onclick="showSeatInfo1(${list.sitNumber })">${list.sitNumber }</a>
										</c:if>
										</div>
			     					</td>
			     					
			     				</c:forEach>
			     				 
			     				</tr>
			     				<tr>	
			     				<c:forEach var="list1" items="${rs1 }">
			     				
			     					<td style="width:42px;height:27px;">
			     						<div
			     						<c:if test="${list1.sitStatus=='Y' && list1.sessionId != session_id }">
			     						 style="margin-left:5px;width:80%; height:80%;background: #35B62C; color: white;  border-radius: 20%;"
			     						</c:if>
			     						<c:if test="${list1.sessionId==session_id && session_id != null && list1.sitStatus=='Y'}">
			     						 style="margin-left:5px;width:80%; height:80%;background: #35B62C; color: white;  border-radius: 20%;"
			     						</c:if>
			     						>
			     						
			     						<c:if test="${list1.sitStatus=='Y' }">
			     							<c:forEach var="sdate" items="${sdate }">
			     							<c:forEach var="name" items="${name }">
			     								<c:if test="${name.userid==list1.sessionId }">
					                    		<c:if test="${sdate.sessionId==list1.sessionId && sdate.sitNumber==list1.sitNumber}">
			     									<a onclick="out1(${list1.sitNumber },'${list1.sessionId}','${sdate.sdate }','${name.name }')">${list1.sitNumber }</a>
			     								</c:if>
			     								</c:if>
			     							</c:forEach>
			     							</c:forEach>
			     						</c:if>
			     						<c:if test="${list1.sitStatus=='N'}">
											<a onclick="showSeatInfo1(${list1.sitNumber })">${list1.sitNumber }</a>
										</c:if>
										</div>
			     					</td>
			     					
			     				</c:forEach> 	
			     				
			     				</tr>	
			     			</table>
			     			</div>
			     			<!-- 좌석 1 ~ 20 끝 -->
			     			
			     			<!-- 좌석 21 ~ 40 시작 -->
			     			<div class="seatTable2">	
							<table align="center" style="border-spacing:0px;text-align:center;margin-top:10px;">			     			
								<tr>
			     				
			     				<c:forEach var="list2" items="${rs2 }">
			     				
			     					<td style="width:42px;height:27px;">
			     						<div
			     						<c:if test="${list2.sitStatus=='Y' && list.sessionId != session_id }">
			     						 style="margin-left:5px;width:80%; height:80%;background: #35B62C; color: white;  border-radius: 20%;"
			     						</c:if>
			     						<c:if test="${list2.sessionId==session_id && session_id != null && list2.sitStatus=='Y'}">
			     						 style="margin-left:5px;width:80%; height:80%;background: #35B62C; color: white;  border-radius: 20%;"
			     						</c:if>
			     						>
			     						
			     						<c:if test="${list2.sitStatus=='Y' }">
			     							<c:forEach var="sdate" items="${sdate }">
			     							<c:forEach var="name" items="${name }">
			     								<c:if test="${name.userid==list2.sessionId }">
					                    		<c:if test="${sdate.sessionId==list2.sessionId && sdate.sitNumber==list2.sitNumber}">
			     									<a onclick="out1(${list2.sitNumber },'${list2.sessionId}','${sdate.sdate }','${name.name }')">${list2.sitNumber }</a>
			     								</c:if>
			     								</c:if>
			     							</c:forEach>
			     							</c:forEach>
			     						</c:if>
			     						<c:if test="${list2.sitStatus=='N'}">
											<a onclick="showSeatInfo1(${list2.sitNumber })">${list2.sitNumber }</a>
										</c:if>
										</div>
			     					</td>
			     					
			     				</c:forEach> 	
			     				</tr>	
			     			
			     				<tr>
			     				<c:forEach var="list3" items="${rs3 }">
			     				
			     					<td style="width:42px;height:27px;">
			     						<div
			     						<c:if test="${list.sitStatus=='Y' && list.sessionId != session_id }">
			     						 style="margin-left:5px;width:80%; height:80%;background: #35B62C; color: white;  border-radius: 20%;"
			     						</c:if>
			     						<c:if test="${list.sessionId==session_id && session_id != null && list.sitStatus=='Y'}">
			     						 style="margin-left:5px;width:80%; height:80%;background: #35B62C; color: white;  border-radius: 20%;"
			     						</c:if>
			     						>
			     						
			     						<c:if test="${list3.sitStatus=='Y' }">
			     							<c:forEach var="sdate" items="${sdate }">
			     							<c:forEach var="name" items="${name }">
			     								<c:if test="${name.userid==list3.sessionId }">
					                    		<c:if test="${sdate.sessionId==list3.sessionId && sdate.sitNumber==list3.sitNumber}">
			     									<a onclick="out1(${list3.sitNumber },'${list3.sessionId}','${sdate.sdate }','${name.name }')">${list3.sitNumber }</a>
			     								</c:if>
			     								</c:if>
			     							</c:forEach>
			     							</c:forEach>
			     						</c:if>
			     						<c:if test="${list3.sitStatus=='N'}">
											<a onclick="showSeatInfo1(${list3.sitNumber })">${list3.sitNumber }</a>
										</c:if>
										</div>
			     					</td>
			     					
			     				</c:forEach> 	
			     				
			     				</tr>	
							</table>			  
							</div>  
							<!-- 좌석 21 ~ 40 끝 -->
							 			
			     			<!-- 좌석 41 ~ 50 시작 -->
			     			<div class="seatTable3">
			     			<table align="center" style="border-spacing:0px;text-align:center;margin-top:10px;">
			     			<tr>
			     				
			     				<c:forEach var="list4" items="${rs4 }">
			     				
			     					<td style="width:42px;height:27px;">
			     						<div
			     						<c:if test="${list.sitStatus=='Y' && list.sessionId != session_id }">
			     						 style="margin-left:5px;width:80%; height:80%;background: #35B62C; color: white;  border-radius: 20%;"
			     						</c:if>
			     						<c:if test="${list.sessionId==session_id && session_id != null && list.sitStatus=='Y'}">
			     						 style="margin-left:5px;width:80%; height:80%;background: #35B62C; color: white;  border-radius: 20%;"
			     						</c:if>
			     						>
			     						
			     						<c:if test="${list4.sitStatus=='Y' }">
			     							<c:forEach var="sdate" items="${sdate }">
			     							<c:forEach var="name" items="${name }">
			     								<c:if test="${name.userid==list4.sessionId }">
					                    		<c:if test="${sdate.sessionId==list4.sessionId && sdate.sitNumber==list4.sitNumber}">
			     									<a onclick="out1(${list4.sitNumber },'${list4.sessionId}','${sdate.sdate }','${name.name }')">${list4.sitNumber }</a>
			     								</c:if>
			     								</c:if>
			     							</c:forEach>
			     							</c:forEach>
			     						</c:if>
			     						<c:if test="${list4.sitStatus=='N'}">
											<a onclick="showSeatInfo1(${list4.sitNumber })">${list4.sitNumber }</a>
										</c:if>
										</div>
			     					</td>
			     				</c:forEach> 	
			     				</tr>	
			     			</table>
			     			</div>
			     			<!-- 좌석 41 ~ 50 끝 -->
			     			
			     			
			     			
		     			<img src="../images/열람실.png">
	     			</div>
			     			<div class="seatInfo" id="seatInfo">
						
			     			</div>
			     			
					<div style="margin-top:20px">
					    사용중인 좌석현황
					</div>
					<div style="margin-top:20px; display: flex; flex-wrap: wrap;">
					    <c:forEach var="idlist" items="${idlist}" varStatus="status">
					        <div style="width: 8%; height:60px; margin: 1px; border: 1px solid #ccc; padding: 5px; font-size: 12px;margin-bottom:10px;">
					            <c:choose>
					                <c:when test="${idlist.sessionId != null}">
					                    <div style="background-color: #35B62C; padding: 3px; border: 1px solid gray;">
					                    <c:forEach var="sdate" items="${sdate }">
					                    <c:forEach var="name" items="${name }">
					                    	<c:if test="${sdate.sessionId==idlist.sessionId && sdate.sitNumber==idlist.sitNumber}">
					                    	<c:if test="${name.userid==idlist.sessionId }">
							                   		 <a onclick="out1(${idlist.sitNumber },'${idlist.sessionId}','${sdate.sdate }','${name.name }')">
							                        ${idlist.sitNumber}번 좌석
							                        ${name.name}<br>
													${sdate.sdate }
													</a>		
												</c:if>
					                        	</c:if>
					                        </c:forEach>
					                        </c:forEach>	
					                    </div>
					                </c:when>
					                <c:otherwise>
					                	<a onclick="showSeatInfo1(${idlist.sitNumber })">
					                    ${idlist.sitNumber}번 좌석<br>
					                    빈 좌석
					                    </a>
					                </c:otherwise>
					            </c:choose>
					        </div>
					        <c:if test="${status.index % 10 == 9 || status.last}">
					            <div style="width: 100%; clear: both;"></div>
					        </c:if>
					    </c:forEach>
					</div>

			     			
			     		</div>
			     	
			     	<!-- 열람실 현황&배정 끝 -->
			     	
				     <!-- 본문 입력 -->
				     
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