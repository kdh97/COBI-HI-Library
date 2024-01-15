<%@page import="java.util.List"%>
<%@page import="egov.libreserve.service.LibrsService"%>
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
<title>열람실</title>

<script>
function fn_cant(sitNumber) {
    var seatInfoDiv = document.getElementById("seatInfo");
    seatInfoDiv.innerHTML = "4층 1열람실의 " + sitNumber + "번 좌석은 다른사용자가 사용중인 좌석입니다";
    seatInfoDiv.style.display = "block";
    
           var yOffset = seatInfoDiv.getBoundingClientRect().top + window.scrollY;
       window.scrollTo({
           top: yOffset,
           behavior: "smooth" 
       });
}

function showSeatInfo(sitNumber, session_id) {
   
    var seatInfoDiv = document.getElementById("seatInfo");
    var seatInfo = "4층 1열람실의 " + sitNumber + "번 좌석을 배정받으시겠습니까?";

    // 좌석 정보를 설정하고 보여줍니다.
    seatInfoDiv.innerHTML = seatInfo;
    seatInfoDiv.style.display = "block";

    createNextButton(seatInfoDiv, sitNumber, session_id);
    
    var yOffset = seatInfoDiv.getBoundingClientRect().top + window.scrollY;
       window.scrollTo({
           top: yOffset,
           behavior: "smooth" 
       });
}

function createNextButton(container, sitNumber, session_id) {
    var button = document.createElement("button");
    button.innerHTML = "배정받기";
    button.style.marginLeft = "5px";
    button.classList.add("reserve");
    button.onclick = function () {
        location.href = "librsUp.do?sit_number=" + sitNumber + "&session_id=" + session_id;
    };
    container.appendChild(button);
}

function out(sitNumber , session_id) {
   
    var seatInfoDiv = document.getElementById("seatInfo");
    var seatInfo = session_id + " 님 " + sitNumber + "번 좌석에서 퇴실하시겠습니까?";

    // 좌석 정보를 설정하고 보여줍니다.
    seatInfoDiv.innerHTML = seatInfo;
    seatInfoDiv.style.display = "block";

    createNextButton1(seatInfoDiv, sitNumber, session_id);
    
    var yOffset = seatInfoDiv.getBoundingClientRect().top + window.scrollY;
       window.scrollTo({
           top: yOffset,
           behavior: "smooth" 
       });
}

function createNextButton1(container, sitNumber, session_id) {
    var button = document.createElement("button");
    button.innerHTML = "퇴실하기";
    button.style.marginLeft = "5px";
    button.classList.add("reserve");
    button.onclick = function () {
       location.href = "librsOut.do?sit_number=" + sitNumber + "&session_id=" + session_id;
    };
    container.appendChild(button);
}

function needlogin() {
    alert("로그인이 필요한 서비스입니다");
    location.href = "libLoginWrite.do";
}

function already(session_id) {
   
    var seatInfoDiv = document.getElementById("seatInfo");
    var seatInfo = session_id+"님은 이미 4층 1열람실의 좌석을 사용중입니다."

    // 좌석 정보를 설정하고 보여줍니다.
    seatInfoDiv.innerHTML = seatInfo;
    seatInfoDiv.style.display = "block";
    
           var yOffset = seatInfoDiv.getBoundingClientRect().top + window.scrollY;
       window.scrollTo({
           top: yOffset,
           behavior: "smooth" 
       });
    
}

   var alertMessage = "${param.alertMessage}";
   if (alertMessage && alertMessage.trim() !== "") {
    alert(decodeURIComponent(alertMessage));
    location.href = "libReserve.do";
   }
</script>
<style>
.notice-icon {
   display: inline-block;
   width: 44px; /* Adjust size as needed */
   height: 27px; /* Adjust size as needed */
   background-color:  #369DE2; /* Background color of the circle */
   border-radius: 10%; /* Creates the circle shape */
   text-align: center;
   line-height: 26px; /* Centering vertically */
   color: white;
}


</style>

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
    top: 132px;
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
	
	<nav class="nav">
		<%@include file = "../include/nav.jsp" %>
	</nav>
	
	<section class="section1">
		<div class="sec1">
				<aside class="aside">
					<%@include file = "../include/aside4.jsp" %>
				</aside>
			
				<div class="flex-item">
					<div class="container" style="border:0px solid black; margin-left:300px;" >
				     
				     <!-- 본문 입력 -->
			     	
			     	<!-- 열람실 현황&배정 시작 -->
			     	
			     		<!-- 세션ID 좌석 시작 -->
			     		
			     		<c:forEach var="idlist" items="${idlist }">	
			     			<c:if test="${idlist.sessionId==session_id && session_id!=null}">
			     				<c:set var="sit" value="already"/>
			     			</c:if>
			     		</c:forEach>

			     
			     		<!-- 세션ID 좌석 끝 -->
			     		
			     		<div style="text-align:center;margin-top:40px;">
			     			
			     			열람실좌석현황보기 
			     			
			    		<div style="text-align:right">
			    		
			     			<img src="../images/1.gif"> 사용중인좌석 : ${Ytotal } <br>
			     			<img src="../images/2.gif"> 사용가능한좌석 : ${Ntotal }
			     		</div>
			     		
			     					     		
			     		<c:forEach var="al" items="${al }">
			     			<c:if test="${session_id == al.sessionId && session_id!=null}">
			     				${session_id } 님은 현재 ${al.sitNumber }번 좌석을 사용중입니다.
			     			</c:if>
			     		</c:forEach>
			     			  <div id="seatContainer">
			     			  
			     			  <!-- 좌석 1 ~ 20 시작-->	
								
								<div class="seatTable">		
								
			     				<table align="center" style="border-spacing:0px;text-align:center;margin-top:10px;">
			     			
			     				<tr>
			     				<c:forEach var="list" items="${rs }">	
			     					<td style="width:42px;height:27px;">
			     						<div
			     						<c:if test="${list.sitStatus=='Y' && list.sessionId != session_id }">
			     						 style="margin-left:5px;width:80%; height:80%;background: #FF7012; color: white;  border-radius: 20%;"
			     						</c:if>
			     						<c:if test="${list.sessionId==session_id && session_id != null && list.sitStatus=='Y'}">
			     						 style="margin-left:5px;width:80%; height:80%;background: green; color: white;  border-radius: 20%;"
			     						</c:if>
			     						>
			     					
				     					
				     					<c:if test="${session_id==null }">
						     					<a onclick="needlogin()" > ${list.sitNumber } </a>
				     					</c:if>
				     					
				     					<c:if test="${session_id!=null }">
				    						<c:if test="${sit!=null }">
				    							<c:if test="${list.sitStatus=='N'}">
					     							<a onclick="already('${session_id }')" >${list.sitNumber }</a>
												</c:if>
												<c:if test="${list.sitStatus=='Y' && list.sessionId!=session_id}">
									     			<a onclick="fn_cant(${list.sitNumber })">${list.sitNumber }</a>
									     		</c:if>
									     		<c:if test="${list.sitStatus=='Y' && list.sessionId==session_id && list.sessionId!=null  }">
									     			<a onclick="out(${list.sitNumber },'${session_id }')">${list.sitNumber }</a>
									     		</c:if>
					     					</c:if>
					  						
					  						<c:if test="${sit==null }">
					  							<c:if test="${list.sitStatus=='N'}">
					     							<a onclick="showSeatInfo(${list.sitNumber },'${session_id}')">${list.sitNumber }</a>
									     		</c:if>
									     		<c:if test="${list.sitStatus=='Y'}">
									     			<a onclick="fn_cant(${list.sitNumber })">${list.sitNumber }</a>
									     		</c:if>
					  						</c:if>
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
			     						 style="margin-left:5px;width:80%; height:80%;background: #FF7012; color: white;  border-radius: 20%;"
			     						</c:if>
			     						<c:if test="${list1.sessionId==session_id && session_id != null && list1.sitStatus=='Y'}">
			     						 style="margin-left:5px;width:80%; height:80%;background: green; color: white;  border-radius: 20%;"
			     						</c:if>
			     						>
			     										  			 				     					
				     					<c:if test="${session_id==null }">
						     					<a onclick="needlogin()" > ${list1.sitNumber } </a>
				     					</c:if>
				     					
				     					<c:if test="${session_id!=null }">
				    						<c:if test="${sit!=null }">
				    							<c:if test="${list1.sitStatus=='N'}">
					     							<a onclick="already('${session_id }')" >${list1.sitNumber }</a>
												</c:if>
												<c:if test="${list1.sitStatus=='Y' && list1.sessionId!=session_id}">
									     			<a onclick="fn_cant(${list1.sitNumber })">${list1.sitNumber }</a>
									     		</c:if>
									     		<c:if test="${list1.sitStatus=='Y' && list1.sessionId==session_id && list1.sessionId!=null  }">
									     			<a onclick="out(${list1.sitNumber },'${session_id }')">${list1.sitNumber }</a>
									     		</c:if>
					     					</c:if>
					  						
					  						<c:if test="${sit==null }">
					  							<c:if test="${list1.sitStatus=='N'}">
					     							<a onclick="showSeatInfo(${list1.sitNumber },'${session_id}')">${list1.sitNumber }</a>
									     		</c:if>
									     		<c:if test="${list1.sitStatus=='Y'}">
									     			<a onclick="fn_cant(${list1.sitNumber })">${list1.sitNumber }</a>
									     		</c:if>
					  						</c:if>
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
			     						<c:if test="${list2.sitStatus=='Y' && list2.sessionId != session_id }">
			     						 style="margin-left:5px;width:80%; height:80%;background: #FF7012; color: white;  border-radius: 20%;"
			     						</c:if>
			     						<c:if test="${list2.sessionId==session_id && session_id != null && list2.sitStatus=='Y'}">
			     						 style="margin-left:5px;width:80%; height:80%;background: green; color: white;  border-radius: 20%;"
			     						</c:if>
			     						>
				     					<c:if test="${session_id==null }">
						     					<a onclick="needlogin()" > ${list2.sitNumber } </a>
				     					</c:if>
				     					
				     					<c:if test="${session_id!=null }">
				    						<c:if test="${sit!=null }">
				    							<c:if test="${list2.sitStatus=='N'}">
					     							<a onclick="already('${session_id }')" >${list2.sitNumber }</a>
												</c:if>
												<c:if test="${list2.sitStatus=='Y' && list2.sessionId!=session_id}">
									     			<a onclick="fn_cant(${list2.sitNumber })">${list2.sitNumber }</a>
									     		</c:if>
									     		<c:if test="${list2.sitStatus=='Y' && list2.sessionId==session_id && list2.sessionId!=null  }">
									     			<a onclick="out(${list2.sitNumber },'${session_id }')">${list2.sitNumber }</a>
									     		</c:if>
					     					</c:if>
					  						
					  						<c:if test="${sit==null }">
					  							<c:if test="${list2.sitStatus=='N'}">
					     							<a onclick="showSeatInfo(${list2.sitNumber },'${session_id}')">${list2.sitNumber }</a>
									     		</c:if>
									     		<c:if test="${list2.sitStatus=='Y'}">
									     			<a onclick="fn_cant(${list2.sitNumber })">${list2.sitNumber }</a>
									     		</c:if>
					  						</c:if>
					     				</c:if>
					     				</div>
			    					</td>
			     				</c:forEach> 	
			     				</tr>	
			     			
			     				<tr>
			     				<c:forEach var="list3" items="${rs3 }">
			     					<td style="width:42px;height:27px;">
			     						<div
			     						<c:if test="${list3.sitStatus=='Y' && list3.sessionId != session_id }">
			     						 style="margin-left:5px;width:80%; height:80%;background: #FF7012; color: white;  border-radius: 20%;"
			     						</c:if>
			     						<c:if test="${list3.sessionId==session_id && session_id != null && list3.sitStatus=='Y'}">
			     						 style="margin-left:5px;width:80%; height:80%;background: green; color: white;  border-radius: 20%;"
			     						</c:if>
			     						>
				     					<c:if test="${session_id==null }">
						     					<a onclick="needlogin()" > ${list3.sitNumber } </a>
				     					</c:if>
				     					
				     					<c:if test="${session_id!=null }">
				    						<c:if test="${sit!=null }">
				    							<c:if test="${list3.sitStatus=='N'}">
					     							<a onclick="already('${session_id }')" >${list3.sitNumber }</a>
												</c:if>
												<c:if test="${list3.sitStatus=='Y' && list3.sessionId!=session_id}">
									     			<a onclick="fn_cant(${list3.sitNumber })">${list3.sitNumber }</a>
									     		</c:if>
									     		<c:if test="${list3.sitStatus=='Y' && list3.sessionId==session_id && list3.sessionId!=null  }">
									     			<a onclick="out(${list3.sitNumber },'${session_id }')">${list3.sitNumber }</a>
									     		</c:if>
					     					</c:if>
					  						
					  						<c:if test="${sit==null }">
					  							<c:if test="${list3.sitStatus=='N'}">
					     							<a onclick="showSeatInfo(${list3.sitNumber },'${session_id}')">${list3.sitNumber }</a>
									     		</c:if>
									     		<c:if test="${list3.sitStatus=='Y'}">
									     			<a onclick="fn_cant(${list3.sitNumber })">${list3.sitNumber }</a>
									     		</c:if>
					  						</c:if>
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
			     						<c:if test="${list4.sitStatus=='Y' && list4.sessionId != session_id }">
			     						 style="margin-left:5px;width:80%; height:80%;background: #FF7012; color: white;  border-radius: 20%;"
			     						</c:if>
			     						<c:if test="${list4.sessionId==session_id && session_id != null && list4.sitStatus=='Y'}">
			     						 style="margin-left:5px;width:80%; height:80%;background: green; color: white;  border-radius: 20%;"
			     						</c:if>
			     						>
				     					<c:if test="${session_id==null }">
						     					<a onclick="needlogin()" > ${list4.sitNumber } </a>
				     					</c:if>
				     					
				     					<c:if test="${session_id!=null }">
				    						<c:if test="${sit!=null }">
				    							<c:if test="${list4.sitStatus=='N'}">
					     							<a onclick="already('${session_id }')" >${list4.sitNumber }</a>
												</c:if>
												<c:if test="${list4.sitStatus=='Y' && list4.sessionId!=session_id}">
									     			<a onclick="fn_cant(${list4.sitNumber })">${list4.sitNumber }</a>
									     		</c:if>
									     		<c:if test="${list4.sitStatus=='Y' && list4.sessionId==session_id && list4.sessionId!=null  }">
									     			<a onclick="out(${list4.sitNumber },'${session_id }')">${list4.sitNumber }</a>
									     		</c:if>
					     					</c:if>
					  						
					  						<c:if test="${sit==null }">
					  							<c:if test="${list4.sitStatus=='N'}">
					     							<a onclick="showSeatInfo(${list4.sitNumber },'${session_id}')">${list4.sitNumber }</a>
									     		</c:if>
									     		<c:if test="${list4.sitStatus=='Y'}">
									     			<a onclick="fn_cant(${list4.sitNumber })">${list4.sitNumber }</a>
									     		</c:if>
					  						</c:if>
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