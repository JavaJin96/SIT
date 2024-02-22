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
	
	function sback() {
		location.href = '<c:url value="regProductContent.do?num=${vo.num}"/>';
	}
	
	function add() {
	    var fileInput = $("#file")[0];
	    var fileName = fileInput.value;

	    if (fileName !== '') { // 파일이 첨부되었을 때
	        var formData = new FormData();
	        formData.append("file", fileInput.files[0]);

	        $.ajax({
	            url: "<c:url value='uploadForm.do'/>",
	            type: "post",
	            data: formData,

	            processData: false,
	            contentType: false,

	            success: function (data) {
	                var newFileName = data.fileName;  // 새로운 파일명

	                if (newFileName !== '') {
	                    $('#fileName').val(newFileName);
	                    alert("사진첨부가 완료되었습니다.");
	                    $("#submit").removeAttr("disabled");
	                } else {
	                    alert("파일 업로드에 실패하였습니다. 기존 파일을 유지합니다.");
	                }
	            },
	            error: function () {
	                alert("파일 업로드 중 오류가 발생했습니다.");
	            }
	        });

	    } else {
	        // 첨부 X
	        return false;
	    }
	}
	
	</script>
</head>

<body>
<div class="container">
  <h2>게시글 수정화면</h2>
  <div class="panel panel-default">
    <div class="panel-body">
    
	<form action="<c:url value='modifyProduct.do'/>" method="post">
		
		<div class="form-group">
			<label>상품 고유번호</label>
			<input type="text" class="form-control" name="num" id="num" value="${vo.num}" readonly="readonly">
		</div>
		
		<div class="form-group">
			<label>상품명</label>
			<input type="text" class="form-control" name="prodTitle" id="prodTitle" value="${vo.prodTitle}">
		</div>
		
		<div class="form-group">
			<label>상품설명</label>
			<textarea class="form-control" rows="5" name=prodContents>${vo.prodContents}</textarea>
		</div>
		
		<div class="form-group">
			<label>가격</label>
			<input type="text" class="form-control" name="price" id="price" value="${vo.price}">
		</div>
		
		<div class="form-group">
			<label>판매자</label>
			<input type="text" class="form-control" name="name" value="${vo.name}" readonly="readonly">
		</div>
		
		<div class="form-group">
			<label>등록일</label><br>
			<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.regdate}"/>
		</div>
		
		<%--
		<div class="form-group">
			<label>상품 이미지</label>
			<input type="file" name="file" class="btn btn-outline-secondary"/>
			<input type="button" class="btn btn-outline-success" value="사진등록" onclick="add()" />
			<input type="hidden" name="fileName" id="fileName" value="" />	
		</div>
		--%>
		
		<div align='right'>
			<button type="submit" class="btn btn-primary">상품정보 수정</button>
			<button type="button" class="btn btn-success" onclick="sback()">돌아가기</button>
		</div>
	</form>
	</div>
    
    </div>
  </div>

리뷰 남기는 공간
</body>
</html>