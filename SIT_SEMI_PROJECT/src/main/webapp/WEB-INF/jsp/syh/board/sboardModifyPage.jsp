<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Board Modify</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  
  	$(document).ready(()=>{
  		$("#list").click(()=>{
  			location.href="<c:url value='sboardContent.do?num=${vo.num}'/>";
  		});
  	});
  </script>

</head>
<body>
 
<div class="container">
  <h2>게시글 수정화면</h2>
  <div class="panel panel-default">
    <div class="panel-body">
    
	<form action="<c:url value='sboardModify.do'/>" method="post">
		
		<div class="form-group">
			<label>글 번호</label>
			<input type="text" class="form-control" name="num" id="num" value="${vo.num}" readonly="readonly">
		</div>
		
		<div class="form-group">
			<label>제목</label>
			<input type="text" class="form-control" name="title" id="title" value="${vo.title}">
		</div>
		
		<div class="form-group">
			<label>내용</label>
			<textarea class="form-control" rows="5" name="content">${vo.content}</textarea>
		</div>
		
		<div class="form-group">
			<label>작성자</label>
			<input type="text" class="form-control" name="name" value="${vo.name}" readonly="readonly">
		</div>
		
		<div class="form-group">
			<label>등록일자</label><br>
			<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.regdate}"/>
		</div>
		
		<button type="submit" class="btn btn-primary">수정</button>
		<button id="list" type="button" class="btn btn-info">되돌아가기</button>
	</form>
    
    </div>
  </div>
</div>

</body>
</html>