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

function listFn(){
	location.href = '<c:out value="pshopList.do"/>';	
}

function openModal(){
    var modal = document.getElementById("myModal");
    modal.style.display = "block";
}
function closeModal(){
    var modal = document.getElementById("myModal");
    modal.style.display = "none";
}

function openModal2(replyNo){
    var modal = document.getElementById("myModal2-"+replyNo);
    modal.style.display = "block";
}

function closeModal2(replyNo){
    var modal = document.getElementById("myModal2-"+replyNo);
    modal.style.display = "none";
}


function deleteComment(replyNo, boardNo){
	location.href = '<c:out value="pshopCommentDelete.do?replyNo="/>'+replyNo + '&boardNo=' + boardNo;
}



function deleteShop(no, gubun){
	location.href = '<c:out value="pshopDelete.do?no="/>' + no + '&gubun=' + gubun;
}

function updateShop(no){
	location.href = '<c:out value="pshopUpdatePage.do?no="/>'+no; 
}


function doReview(){
	var comment = $('#comment').val();
	var userNo = "${sessionScope.userNo}";
	var boardNo = "${vo.no}";
	
	if (comment =='' || comment == null){
		alert('댓글을 작성 후 클릭바랍니다.');
		return false;
	}
	if (comment.length >= 101){
		alert('댓글의 내용이 너무 깁니다. 100자 이하로 작성해주세요');
		return false;
	}
	
	comment = comment.replace(/(?:\r\n|\r|\n)/g, '<br/>');
	
	location.href = '<c:out value="pcommentWrite.do?boardNo="/>' + boardNo + '&userNo=' + userNo + '&comment=' + comment;
}

function add(){
	if ($("#file").val() !=''){ // 파일이 첨부 되었을 때
		var formData = new FormData();
		formData.append("file", $("input[name=file]")[0].files[0]);
		$.ajax({
			url : "<c:url value='pupload.do'/>",
			type : "post",
			data : formData,
			// 파일 올릴떈 아래 2개를 추가해줘야함.
			processData : false,
			contentType : false,
			
			success : function(data){ // 업로드된 실제파일 이름을 전달받기
				// 파일이름 가져오기
				var filename = data.filename;
				$('#filename').val(filename);
				alert("사진첨부가 완료되었습니다.");
			},
			error : function(){ alert("error"); }
		});
		
	}else{ // 파일이 첨부 되지 않은 경우
		return false;
	}
}

// function deleteComment(replyNo, boardNo){
// 	location.href = '<c:out value="pcommentDelete.do?replyNo="/>'+replyNo + '&boardNo=' + boardNo;
// }
		
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
	<h2> <a href = "pshopList.do" style="color: inherit; text-decoration: none;" >혀노SHOP</a> </h2>
	<table class="table">
	<colgroup>
		<col style="width:25%" >
		<col style="width:25%" >
		<col style="width:25%" >
		<col style="width:25%" >
	</colgroup>
	<c:if test="${vo!=null}">
		<tr class="boardTitle" >
			<td colspan="4" style="text-align: center;"><img src="<c:out value='/SIT/download/${vo.fileName}'/>" width="400px" height="400px" ></td>
		</tr>	
		<tr class="boardTitle" >
			<td>상품명</td>
			<td colspan="3">${vo.title}</td>
		</tr>
		<tr class="boardContent" >
			<td>상품설명</td>
			<td colspan="3"> ${vo.contents} </td>
		</tr>
		<tr class="boardDate" >
			<td>작성일</td>
			<td colspan="3">${vo.creDate}</td>
		</tr>
	</c:if>
		<tr>
			<td colspan="4" align="right">
				<input type="button" value="목록" class='btn btn-info' onclick="listFn()" />
				<c:if test="${sessionScope.userRole == '1'}">
					<input type="button" class="btn btn-warning" value="삭제" onclick="openModal()" />
					<input type="button" class="btn btn-primary" value="수정하기" onclick="updateBoard(${vo.no})" />
				</c:if>
			</td>
		</tr>
</table>
	<!-- 댓글 목록 -->
	<div class="container">
		<c:if test="${not empty co}">
	    <h3>리뷰목록</h3>
	    </c:if>
	    <c:forEach var="co" items="${co}" varStatus="status">
		<table class="comment">    
		<colgroup>
			<col style="width:10%" >
			<col style="width:40%" >
			<col style="width:40%" >
			<col style="width:10%" >
		</colgroup>   	   
	       	<tr class="coTitle">
	       		<td colspan="1" style="text-align:center;"><strong>${co.name}</strong></td>
	       		<td colspan="1">${co.creDate}</td>     
	       		<c:if test="${co.fileName != null || co.fileName != ''}">
	       		<td colspan="2"><img src="<c:out value='/SIT/download/${co.fileName}'/>" width="200px" height="200px" ></td>
	       		</c:if>
	       	</tr>
	       	<tr class="coComment">
	       		<td colsapn="1"></td>
	       		<td colspan="2">${co.comment}</td>
	       		<c:if test="${sessionScope.userNo == co.userNo || sessionScope.userNo == '1'}">
	       			<td colspan="1"><input type="button" class="btn btn-danger" value="삭제" onclick="openModal2(${co.replyNo})" /></td>
<%-- 	       			<td colspan="1"><input type="button" class="btn btn-danger" value="삭제" onclick="deleteComment(${co.replyNo}, ${co.boardNo})" /></td> --%>
	       		</c:if>
	       	</tr>
		</table> 
		
<!-- 		각 댓글 번호에 맞는 Modal창을 열기 위함 -->
		<div id="myModal2-${co.replyNo}" class="modal">
			<div align="center">
				<div>
					<label for="check">정말로 삭제하시겠습니까?</label>
				</div>
				<div>
		<%-- 			<button type="button" class="btn btn-primary" onclick="deleteComment(${co.replyNo}, ${co.boardNo})">확인</button> --%>
					<button type="button" class="btn btn-primary" onclick="deleteComment(${co.replyNo}, ${co.boardNo})">확인</button>
					<button type="button" class="btn btn-warning" onclick="closeModal2(${co.replyNo})">취소</button>
				</div>
			</div>
		</div>		
	    </c:forEach>
	</div>
	
	
	<!-- 댓글 입력 -->
	<div class="container">
	<div class="commentWrite">
	    <h3>리뷰</h3>
	    <c:if test="${sessionScope.userNo != null}">
        	<textarea id="comment" name="comment" placeholder="리뷰를 100자 이내로 입력하세요..." required></textarea>
        	<input name="file" type="file"  />
        	<input type="button" value="사진등록" onclick="add()" />
        	<input type="hidden" name="filename" id="filename" value="" />
        </c:if>
        <c:if test="${sessionScope.userNo == null || sessionScope.userNo == ''}">
<!--         	<textarea id="comment" name="comment" placeholder="로그인 후 작성해주세요..." disabled="disabled" required></textarea> -->
			<textarea id="comment" name="comment" placeholder="로그인 후 작성해주세요..." disabled="disabled" required></textarea>
        </c:if>
        <input type="button" class="btn btn-primary" value="리뷰 작성" onclick="doComment()" />
	</div>
	</div>
	
</div>
<div id="myModal" class="modal">
	<div align="center">
		<div>
			<label for="check">정말로 삭제하시겠습니까?</label>
		</div>
		<div>
			<button type="button" class="btn btn-primary" onclick="deleteBoard(${vo.no}, ${vo.gubun})">확인</button>
			<button type="button" class="btn btn-warning" onclick="closeModal()">취소</button>
		</div>
	</div>
</div>


</body>
</html>