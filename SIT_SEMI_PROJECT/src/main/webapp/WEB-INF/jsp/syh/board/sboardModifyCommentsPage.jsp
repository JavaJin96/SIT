<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서윤호 자유게시판</title>
	<script type="text/javascript">
	
	function backPage() {
		location.href = "<c:url value='sboardContent.do'/>?num=${vo.num}";
	}
	
	$(document).ready(()=>{
		$("#modify").click(()=>{
			location.href="<c:url value='sboardModifyComments.do'/>?boardNum=${vo.num}";  // GET
		});
	});
	
	</script>
</head>

<body>
<div class="container">
  <h2>${vo.title} 게시글 입니다.</h2>
  <div class="panel panel-default">
    <div class="panel-body">

		<div class="form-group">
			<label>글 번호</label>
			<input type="text" class="form-control" id="num" name="num" value="${vo.num}" readonly="readonly">
		</div>
		
		<div class="form-group">
			<label>제목</label>
			<input type="text" class="form-control" name="title" value="${vo.title}" readonly="readonly">
		</div>
		
		<div class="form-group">
			<label>내용</label>
			<textarea class="form-control" rows="5" name="content" readonly="readonly">${vo.content}</textarea>
		</div>
		
		<div class="form-group">
			<label>작성자</label>
			<input type="text" class="form-control" name="name" value="${vo.name}" readonly="readonly">
		</div>
		
		<div class="form-group">
			<label>등록일자</label><br>
			<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.regdate}"/>
		</div>
  </div>
</div>
</div>

<div class="container">
	<c:if test="${not empty co}">
		<h3>댓글 목록</h3>
	</c:if>
	<c:forEach var="co" items="${co}" varStatus="status">
	<table class="comments">    
	 	    
	    <tr class="coTitle">
	      	<td colspan="1" style="text-align:center;"><strong>${co.name}</strong></td>
	      	<td colspan="2"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${co.regdate}"/></td>
	      	
	    </tr>
	    <tr class="coComments">
	      	<td colspan="1"></td>
	      	<td colspan="2">
	      		<h5><textarea id="comments" name="comments" rows="5" cols="70" placeholder="${co.comments}"></textarea></h5>
	      		<br>
	      		<button type="button" class="btn btn-info" id="">수정</button>
	      		<button type="button" class="btn btn-success" onclick="backPage()">돌아가깅</button>
	      	</td>
	      	
		</tr>
	</table> 
	</c:forEach>
</div>
</body>
</html>