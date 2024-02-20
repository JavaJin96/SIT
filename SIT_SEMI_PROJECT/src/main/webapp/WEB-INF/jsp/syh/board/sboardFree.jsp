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
<title>서윤호 자유게시판</title>
	<script type="text/javascript">
	
	function boardWrite(){
		location.href = '<c:out value="sboardWrite.do"/>';
	}
	
	function searchForm() {
		var search = $('#search').val();
		
	    if (search.trim() == '') {
	        alert("검색어를 입력하세요.");
	        return false;
	    }
	}
	
	function sboardpoi() {
		location.href = '<c:out value="sboardpoi.do"/>';
	}
	
	</script>
</head>
<body>
	<h2>자유게시판</h2>
	
	<c:if test="${sessionScope.userNum == '2'}"> <!-- 관리자일때 -->
		<input type="button" class="btn btn-outline-warning" name="boardDatapoi" id="boardDatapoi" value="게시글 데이터 Excel 다운로드" onclick="sboardpoi()" />
	</c:if>
	
	<div class="search">
		<form id="searchForm" action="sboardSearch.do" method="POST" onsubmit="return searchForm()">
			<select id="selectSearch" name="selectSearch">
				<option value="title" selected="selected">제목 </option>
				<option value="content">본문</option>
				<option value="name">작성자</option>		
			</select>
			<input type="text" id="search" placeholder="검색어 입력" name="search" value="${not empty search ? search : ''}"/>
			<input type="submit" class="btn btn-outline-primary" value='검색'/>
		</form>
	</div>
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
			<td><a href="<c:url value='sboardContent.do?num=${vo.num}'/>">${vo.title}</a></td>
			<td>${vo.name}</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.regdate}"/></td>
			<td>${vo.count}</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<div align='right'>
      <c:if test="${sessionScope.userId==null || sessionScope.userId==''}">
      	<button type="button" class="btn btn-primary" onclick="boardWrite()" disabled="disabled">글 작성</button>
      </c:if>
      <c:if test="${sessionScope.userId!=null && sessionScope.userId!=''}">
      	<button type="button" class="btn btn-primary" onclick="boardWrite()">글 작성</button>
      </c:if>
  </div>
  
<div class="pagination">
    <div class="container">
        <div class="row">
            <div class="col-md-1">
                <button class="btn btn-outline-dark" onclick="location.href='<c:url value='sboardFree.do'/>?page=1'">
                    &lt; 처음
                </button>
            </div>
            <c:forEach begin="1" end="${totalPages}" var="pageNumber">
                <div class="col-md-1">
                    <c:choose>
                        <c:when test="${pageNumber eq currentPage}">
                            <button class="btn btn-secondary active">${pageNumber}</button>
                        </c:when>
                        <c:otherwise>
                            <button class="btn btn-outline-dark" onclick="location.href='<c:url value='sboardFree.do'/>?page=${pageNumber}'">${pageNumber}</button>
                        </c:otherwise>
                    </c:choose>
                </div>
            </c:forEach>
            <div class="col-md-2">
                <button class="btn btn-outline-dark" onclick="location.href='<c:url value='sboardFree.do'/>?page=${totalPages}'">
                    끝 &gt;
                </button>
            </div>
        </div>
    </div>
</div>
</body>
</html>