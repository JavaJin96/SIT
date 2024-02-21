<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서윤호 자유게시판</title>
	<script type="text/javascript">
	
	function boardWrite(){
		location.href = '<c:out value="sboardWrite.do"/>';
	}
	

	function confirmDelete(){
		if (confirm("정말 삭제하시겠습니까? 삭제된 글은 복구할 수 없습니다.") == true) {
			location.href="<c:url value='sboardDelete.do'/>?num=${vo.num}";
		} else { }
	}
	
	function back(){
		location.href = '<c:out value="sboardNotice.do"/>';
	}
	
	$(document).ready(()=>{
		$("#modify").click(()=>{
			location.href="<c:url value='sboardModifyPage.do'/>?num=${vo.num}";  // GET
		});
	});
	</script>
</head>

<body>
<div class="container">
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
		
	<div align='right'>
		<c:if test="${sessionScope.userId=='manager'}">
			<button type="button" class="btn btn-primary" id="modify">글 수정</button>
			<button type="button" class="btn btn-danger" onclick="confirmDelete()">삭제</button>
		</c:if>
		<c:if test="${sessionScope.userId!='manager'}">
			<button type="button" class="btn btn-success" onclick="back()">돌아가기</button>
		</c:if>
	</div>
	
  </div>
</div>
</div>
</body>
</html>