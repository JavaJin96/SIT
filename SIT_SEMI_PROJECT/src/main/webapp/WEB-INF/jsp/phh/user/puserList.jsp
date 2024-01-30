<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function userDelete(no){
	window.location.href = '<c:out value="puserDelete.do?no=" />'+no;
	
}

$( document ).ready(function() {

	
});
		
</script>
</head>
<body>

<div class="container">
  <h2>회원관리</h2>            
  <table class="table table-striped">
    <thead>
      <tr>
        <th>NO</th>
        <th>아이디</th>
        <th>비밀번호</th>
        <th>닉네임</th>
        <th>역할</th>
        <th>가입일자</th>
        <th>삭제</th>
      </tr>
    </thead>
    <tbody>
	<c:forEach var="list" items="${list}" varStatus="status">
	<tr>
		<td>${list.no}</td>
		<td>${list.id}</td>
		<td>${list.pass}</td>
		<td>${list.name}</td>
		<td>${list.role}</td>
		<td>${list.regDate}</td>
		<td><button type="button" class="btn btn-danger btn-xs" onclick="userDelete(${list.no})">삭제</button></td>
	</tr>
	</c:forEach>    
    </tbody>
  </table>
</div>


</body>
</html>