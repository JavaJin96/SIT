<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서윤호 공지게시판</title>
</head>
<body>
	<h2>서윤호 공지게시판</h2>
	<table class='table table-hover'>
	<thead>
	
	<tr>
		<th width="15%">글 번호</th>
		<th width="40%">제목</th>
		<th width="15%">작성자</th>
		<th width="15%">작성일자</th>
		<th width="15%">조회수</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach var="vo" items="${list}" varStatus="status">
		<tr>
		<td>${vo.num}</td>
		<td>${vo.title}</td>
		<td>${vo.userNum}</td>
		<td>${vo.regdate}</td>
		<td>${vo.count}</td>
	</tr>
	</c:forEach>
	</tbody>
</table>
</body>
</html>