<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

function openModal(){
    var modal = document.getElementById("myModal");
    modal.style.display = "block";
}
function closeModal(){
    var modal = document.getElementById("myModal");
    modal.style.display = "none";
}


function deleteBoard(no){
	location.href = '<c:out value="pboardDelete.do?no="/>'+no;		
}
function listFn(){
	location.href = '<c:out value="pboardList.do"/>'; 
}
function updateBoard(no){
	location.href = '<c:out value="pboardUpdatePage.do?no="/>'+no; 
}


$( document ).ready(function() {
	
	
});
		
</script>
<style>
.modal {
    display: none;
    position: fixed;
    top: 50%; /* 화면 상단으로부터 50% 위치에 고정 */
    left: 50%; /* 화면 좌측으로부터 50% 위치에 고정 */
    transform: translate(-50%, -50%); /* 화면 중앙으로 이동하는 트랜스폼 */
    height : 100px;
    width: 400px; /* Modal의 폭 */
    padding: 10px; /* Modal 내부 여백 */
    background-color: #fff;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); /* 그림자 효과 추가 */
}
</style>
</head>
<body>

<div class="container">
	<table class="table">
	<h2> <a href = "pboardList.do" style="color: inherit; text-decoration: none;" >자유게시판</a> </h2>
	<colgroup>
		<col style="width:25%" >
		<col style="width:25%" >
		<col style="width:25%" >
		<col style="width:25%" >
	</colgroup>
	<c:if test="${vo!=null}">
		<tr class="boardTitle" >
			<td>글 제목</td>
			<td colspan="3">${vo.title}</td>
		</tr>
		<tr class="boardContent" >
			<td>글 내용</td>
			<td colspan="3"> ${vo.contents} </td>
		</tr>
		<tr class="boardName" >
			<td>작성자</td>
			<td colspan="3">${vo.name}</td>
		</tr>
		<tr class="boardDate" >
			<td>작성일</td>
			<td colspan="3">${vo.creDate}</td>
		</tr>
	</c:if>
		<tr>
			<td colspan="4" align="right">
				<input type="button" value="목록" class='btn btn-info' onclick="listFn()"/>
				<c:if test="${sessionScope.userNo == vo.userNo || sessionScope.userNo == '1'}">
					<input type="button" class="btn btn-warning" value="삭제" onclick="openModal()" />
					<input type="button" class="btn btn-primary" value="수정하기" onclick="updateBoard(${vo.no})" />
				</c:if>
			</td>
		</tr>
		
<div id="myModal" class="modal">
	<div align="center">
		<div>
			<label for="check">정말로 삭제하시겠습니까?</label>
		</div>
		<div>
			<button type="button" class="btn btn-primary" onclick="deleteBoard(${vo.no})">확인</button>
			<button type="button" class="btn btn-warning" onclick="closeModal()">취소</button>
		</div>
	</div>
</div>
</table>
</div>

</body>
</html>