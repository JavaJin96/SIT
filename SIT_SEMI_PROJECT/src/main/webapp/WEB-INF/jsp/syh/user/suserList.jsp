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
	
	function suserDelete(num){
		if (confirm("회원을 삭제하시겠습니까?") == true){
			location.href = '<c:out value="suserDelete.do?num=" />'+num;	
		} else { }
	}
	
	function suserpoi() {
		location.href = '<c:out value="suserpoi.do"/>';
	}
	
	</script>
</head>

<body>
<div class="container">
  <h2>회원 관리</h2>
  <input type="button" class="btn btn-outline-warning" name="userDatapoi" id="userDatapoi" value="유저 데이터 Excel 다운로드" onclick="suserpoi()" />   
  <table class="table table-hover">
    <thead>
      <tr>
        <th>num</th>
        <th>아이디</th>
        <th>비밀번호</th>
        <th>닉네임</th>
        <th>권한</th>
        <th>가입일자</th>
        <th>관리</th>
      </tr>
    </thead>
    
    <tbody>
	<c:forEach var="vo" items="${list}" varStatus="status">
	<tr>
		<td>${vo.num}</td>
		<td>${vo.id}</td>
		<td>${vo.pass}</td>
		<td>${vo.name}</td>
		<td>
		<c:choose>
                <c:when test="${vo.auth eq 1}">
                    ${vo.auth} (사용자)
                </c:when>
                <c:when test="${vo.auth eq 2}">
                    ${vo.auth} (관리자)
                </c:when>
                <c:otherwise>
                    ${vo.auth}
                </c:otherwise>
            </c:choose>
        </td>
		<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.regdate}"/></td>
		<c:if test="${vo.auth ne 2}">
            <td><button type="button" class="btn btn-warning" onclick="suserDelete(${vo.num})">삭제</button></td>
        </c:if>
	</tr>
	</c:forEach>    
    </tbody>
    
  </table>
</div>
</body>
</html>