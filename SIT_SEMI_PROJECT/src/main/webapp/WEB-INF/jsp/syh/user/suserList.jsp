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
	function userDelete(num){
		if (confirm("정말 삭제하시겠습니까?") == true){
			location.href = '<c:out value="suserDelete.do?num=" />'+num;	
		} else {
			return false;
		}
	$(document).ready(function() {
		
	});
			
	</script>
</head>

<body>
<div class="container">
  <h2> 유저 관리</h2>            
  <table class="table table-hover">
    <thead>
      <tr>
        <th>num</th>
        <th>아이디</th>
        <th>비밀번호</th>
        <th>닉네임</th>
        <th>권한</th>
        <th>가입일자</th>
        <th>삭제</th>
      </tr>
    </thead>
    
    <tbody>
	<c:forEach var="list" items="${list}" varStatus="status">
	<tr>
		<td>${list.num}</td>
		<td>${list.id}</td>
		<td>${list.pass}</td>
		<td>${list.name}</td>
		<td>${list.auth}</td>
		<td>${list.regDate}</td>
		
		<td><button type="button" class="btn btn-warning" onclick="userDelete(${list.num})">삭제하기</button></td>
	</tr>
	</c:forEach>    
    </tbody>
    
  </table>
</div>
</body>
</html>