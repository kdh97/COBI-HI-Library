<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="session_id" value="${sessionScope.SessionUserID }"/>
    
  <table class="menu-btn" style="width:1200px; align:center;">
   		<colgroup>
			<col width="12%"/>
			<col width="15%"/>
			<col width="15%"/>
			<col width="15%"/>
			<col width="15%"/>
			<col width="15%"/>
			<col width="13%"/>
		</colgroup>
    
    <tr>
      <td><a href="#"></a></td>
      <td><a href="/guide.do">이용안내</a></td>
      <td><a href="/bookSearch.do">자료검색</a></td>
      <td><a href="/libNoticeList2.do">도서관소식</a></td>
      <td><a href="/libReserve.do">신청서비스</a></td>
      <td>
      <c:if test="${s_userid == null }">
      	<a href="/libLoginWrite.do">나의 도서관</a> 
      </c:if>
      <c:if test="${s_userid != null }">
      	<a href="/myBookList.do">나의 도서관</a> 
      </c:if>
      </td>
      <td><a href="#"></a></td>
    </tr>
  </table>
  <ul class="menu-list">
   		<table width="1200px;" style="font-size:20px;">
	   		<colgroup>
				<col width="12%"/>
				<col width="15%"/>
				<col width="15%"/>
				<col width="15%"/>
				<col width="15%"/>
				<col width="15%"/>
				<col width="13%"/>
			</colgroup>
			<tr>
				<td><a href="#"></a></td>
				<td><a href="/libMap.do">오시는길</a></td>
				<td><a href="/bookSearch.do">통합검색</a></td>
				<td><a href="/libNoticeList2.do">공지사항</a></td>
				<td><a href="/libReserve.do">열람실</a></td>
				<td>
				<c:if test="${s_userid == null }">
			    	<a href="/libLoginWrite.do">대출목록</a> 
			    </c:if>
			    <c:if test="${s_userid != null }">
			    	<a href="/myBookList.do">대출목록</a> 
			    </c:if>
				</td>
				<td><a href="#"></a></td>
			</tr>
			<tr>
				<td><a href="#"></a></td>
				<td><a href="/guide.do">이용시간</a></td>
				<td><a href="/bookRent.do">대출하기</a></td>
				<td><a href="/libEventList2.do">문화행사</a></td>
				
				<td><a href="/voluntary.do">자원봉사신청</a></td>
				<td><a href="/libArchive.do?session_id=${session_id }">열람실기록</a></td>
				<td><a href="#"></a></td>
			</tr>
			<tr>
				<td><a href="#"></a></td>
				<td><a href="/reserveGuide.do">열람실이용</a></td>
				<td><a href="/newBook.do">신착도서</a></td>
				<td><a href="/libCalendar.do">일정</a></td>
				<td><a href="/tourGuide.do">도서견학신청</a></td>
				<td>
				<c:if test="${s_userid != 'admin' }">
                	<a href="/libMemberDetail.do">내 정보</a>
                </c:if>
				</td>
				<td><a href="#"></a></td>
			</tr>
			<tr>
				<td><a href="#"></a></td>
				<td><a href="/rentGuide.do">대출/반납</a></td>
				<td><a href="/popularBook.do">인기도서</a></td>
				<td><a href="#"></a></td>
				<td><a href="#"></a></td>
				<td><a href="#"></a></td>
				<td><a href="#"></a></td>
			</tr>
		</table>
  </ul>