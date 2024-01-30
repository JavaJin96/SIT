<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function boardWrite(){
	window.location.href = '<c:out value="pboardWrite.do"/>';
}


$( document ).ready(function() {
	
	
});
		
</script>
</head>
<body>

<div class="container">
  <div class="row">
    <div class="col-md-6">
      <h2>자유게시판</h2>
    </div>
    <div class="col-md-6 text-right">
      <br>
      <c:if test="${sessionScope.userId==null || sessionScope.userId==''}">
      	<button type="button" class="btn btn-primary" onclick="boardWrite()" disabled="disabled">글 작성</button>
      </c:if>
      <c:if test="${sessionScope.userId!=null && sessionScope.userId!=''}">
      	<button type="button" class="btn btn-primary" onclick="boardWrite()">글 작성</button>
      </c:if>
      <br>
    </div>
  </div>
<!--   <table> -->
<!-- 	<td><h2>자유게시판</h2></td> -->
<!-- 	<td style="text-align : right;"><button type="button" class="btn btn-primary" onclick="boardInsert()">글 작성</button></td> -->
<!--   </table> -->
  <table class="table table-striped">
    <thead>
      <tr>
        <th>NO</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일자</th>
      </tr>
    </thead>
    <tbody>
	<c:forEach var="list" items="${list}" varStatus="status">
	<tr>
		<td>${list.no}</td>
		<td>${list.title}</td>
		<td>${list.name}</td>
		<td>${list.creDate}</td>
	</tr>
	</c:forEach>    
    </tbody>
  </table>
</div>


</body>
</html>