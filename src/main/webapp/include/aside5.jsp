<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<table style="border-collapse: collapse;width:220px;">
			<tr>
				<td style="font-size:35px;height:180px; background-size: cover;">
				<a href="/myBookList.do">나의도서관</a>
				</td>
			</tr>
			<tr>
				<td height="80"><a href="/myBookList.do">대출목록</a></td>
			</tr>
			<tr>
				<td height="80"><a href="/libArchive.do?session_id=${session_id }">열람실기록</a></td>
			</tr>
			<tr>
				<td height="80"><c:if test="${s_userid != 'admin' }">
                	<a href="/libMemberDetail.do">내 정보</a>
                </c:if></td>
			</tr>
			<tr>
				<td height="80"></td>
			</tr>
		</table>