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
	
	function deleteComments(commentsNum, boardNum) {
		if (confirm("댓글을 삭제하시겠습니까?") == true ){
			location.href = '<c:out value="sboardDeleteComments.do?commentsNum="/>'+commentsNum + '&boardNum=' + boardNum;
		} else { }
	}

	function confirmDelete(){
		if (confirm("정말 삭제하시겠습니까? 삭제된 글은 복구할 수 없습니다.") == true) {
			location.href="<c:url value='sboardDelete.do'/>?num=${vo.num}";
		} else { }
	}
	$(document).ready(()=>{
		$("#mc").click(()=>{
			location.href="<c:url value='sboardModifyCommentsPage.do'/>?num=${vo.num}";  // GET
		});
	});
	
	
	function back(){
		location.href = '<c:out value="sboardFree.do"/>';
	}
	
	$(document).ready(()=>{
		$("#modify").click(()=>{
			location.href="<c:url value='sboardModifyPage.do'/>?num=${vo.num}";  // GET
		});
	});
	
	function Login() {
		location.href = '<c:out value="slogin.do"/>';
	}
	
	
	function commentsWrite(){
		var comments = $('#comments').val();
		var userNum = "${sessionScope.userNum}";
		var boardNum = "${vo.num}";		
		
		if (comments.length >= 101){
			alert('댓글은 100자 이하로 작성하세요.');
			return false;
		} else if (comments.trim() == '') {
			alert('댓글을 입력하세요.');
			return false;
		}
		
		// 개행문자 줄바꿈
		comments = comments.replace(/(?:\r\n|\r|\n)/g, '<br/>');
		location.href = '<c:out value="sboardInsertComments.do?boardNum="/>' + boardNum + '&userNum=' + userNum + '&comments=' + comments;
	}	
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
		
	<div align='right'>
		<c:if test="${sessionScope.userNum == vo.userNum || sessionScope.userNum == '2'}">
			<button type="button" class="btn btn-primary" id="modify">글 수정</button>
			<button type="button" class="btn btn-danger" onclick="confirmDelete()">삭제</button>
		</c:if>
		<c:if test="${sessionScope.userNum != '2'}">
			<button type="button" class="btn btn-success" onclick="back()">돌아가기</button>
		</c:if>
	</div>
	
  </div>
</div>
</div>

댓글 쓰는 공간
<div class="insertComments">
	<h3>댓글 작성</h3>
	<c:if test="${sessionScope.userNum != null}">
        	<textarea id="comments" name="comments" rows="4" cols="100" placeholder="댓글을 작성하세요." required></textarea>
        	<input type="button" class="btn btn-primary" value="댓글 작성" onclick="commentsWrite()" />
        </c:if>
        <c:if test="${sessionScope.userNum == null || sessionScope.userNum == ''}">
			<textarea id="comments" name="comments" rows="4" cols="100" placeholder="로그인 후 작성하세요." disabled="disabled" required></textarea>
        	<input type="button" class="btn btn-warning" value="로그인하기" onclick="Login()" />
        </c:if>
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
	      	
	      	<c:if test="${sessionScope.userNum == vo.userNum || sessionScope.userNum == '2'}">
	      	<td colspan="3" style= "text-align:right;">
	      		<button type="button" class="btn btn-outline-dark" id="mc">수정</button>
	      		<button type="button" class="btn btn-danger" onclick="deleteComments(${co.commentsNum}, ${co.boardNum})">삭제</button>
	      	</c:if>
	      	</td>
	    </tr>
	    <tr class="coComments">
	      	<td colspan="1"></td>
	      	<td colspan="2"><h5>${co.comments}<h5></td>
		</tr>
	</table> 
	</c:forEach>
</div>
</body>
</html>