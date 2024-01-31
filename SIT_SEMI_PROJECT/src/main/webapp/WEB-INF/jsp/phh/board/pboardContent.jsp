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

function openModal(mode){
    var modal = document.getElementById("myModal");
    modal.style.display = "block";
    // mode 값 설정
    document.getElementById("mode").value = mode;
}
function closeModal(){
    var modal = document.getElementById("myModal");
 	// 비밀번호 입력 필드 초기화
    document.getElementById("pw").value = '';
 	
    modal.style.display = "none";
}


function checkPw(num){
	var inputPw = document.getElementById("pw").value;
	var mode = document.getElementById("mode").value;
	var realPw = '${vo.pass}';
	if (inputPw == realPw){
		if(mode=='update'){
			location.href = "boardUpdatePage.do?num="+num;	
		}
		if(mode=='delete'){
			location.href = "boardDelete.do?num="+num;	
		}
	} else{
		alert("비밀번호가 틀렸습니다");
	}
}
function listFn(){
	window.location.href = '<c:out value="pboardList.do"/>'; 
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
    height : 150px;
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
	<h2> <a href = "/pboardList.do" style="color: inherit; text-decoration: none;" >자유게시판</a> </h2>
	<table class="table">
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
				<input type="button" class="btn btn-primary" value="수정하기" onclick="openModal('update')" />
				<input type="button" class="btn btn-warning" value="삭제" onclick="openModal('delete')" />				
			</td>
		</tr>
		
<div id="myModal" class="modal">
	<div align="center">
		<span class="close" id="closeBtn" onclick="closeModal()">&times;</span>
		<!-- 여기에 비밀번호 입력 폼 추가 -->
		<div>
			<label for="password">비밀번호:</label>
			<input type="password" id="pw" name="pw" />
			<input type="hidden" id="mode" name="mode" />
			<button type="button" onclick="checkPw(${vo.no})">확인</button>
		</div>
	</div>
</div>
</table>
</div>

</body>
</html>