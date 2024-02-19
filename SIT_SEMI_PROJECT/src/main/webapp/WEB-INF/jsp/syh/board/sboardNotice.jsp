<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서윤호 공지게시판</title>
<script type="text/javascript">
	
	function noticeWrite(){
		location.href = '<c:out value="snoticeWrite.do"/>';
	}
	</script>
</head>
<body>
	<h2>공지게시판</h2>
	<table class='table table-hover'>
		<thead>
			<tr>
				<th width="15%">글 번호</th>
				<th width="40%">제목</th>
				<th width="15%">작성자</th>
				<th width="15%">작성잉자</th>
				<th width="15%">조회수</th>
			</tr>
		</thead>
	<tbody>
	<c:forEach var="vo" items="${list}">
		<tr>
			<td>${vo.num}</td>
			<td><a href="<c:url value='snoticeContent.do?num=${vo.num}'/>">${vo.title}</a></td>
			<td>${vo.name}</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.regdate}"/></td>
			<td>${vo.count}</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<div align='right'>
      <c:if test="${sessionScope.userNum != '2'}">
      	<button type="button" class="btn btn-primary" onclick="noticeWrite()" disabled="disabled">글 작성</button>
      </c:if>
      <c:if test="${sessionScope.userNum == '2'}">
      	<button type="button" class="btn btn-primary" onclick="noticeWrite()">글 작성</button>
      </c:if>
  </div>
</body>
</html>