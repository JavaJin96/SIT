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

function goCart(){
	var shopNo = "${vo.no}";
	var userNo = "${sessionScope.userNo}";
	var countElement = document.getElementById("count");
	var count = countElement.value;
	
	location.href = '<c:out value="pshopPutCart.do?shopNo="/>'+shopNo + '&userNo=' + userNo + '&count' + count;
}

function deleteCart(no){
	location.href = '<c:out value="pshopDelete.do?cartNo="/>' + no;
}

function updateShop(no){
	location.href = '<c:out value="pshopUpdatePage.do?no="/>'+no; 
}

function deleteCart(cartNo){
	var userNo = "${sessionScope.userNo}";
	location.href = '<c:out value="pshopDeleteCart.do?cartNo="/>'+cartNo+ '&userNo=' + userNo;
}

function payCart(){
	var userNo = "${sessionScope.userNo}";
	location.href = '<c:out value="pshopBuyCart.do?userNo="/>'+ userNo;
}
	
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

.commentWrite .btn-success {
	text-align: center !important;
	width: 40% !important;
	margin-left: 1rem;
 	float: left;
	border:none;
	}
	
.boardTitle .btn-danger{
	text-align: center !important;
	width: 40% !important;
 	float: left !important;
	border:none;
}

.btn-primary{
	text-align: center !important;
 	width: 10% !important;
  	float: right;
	border:none;
}

.emptyCart{
	text-align : center !important;
	font-size : 4rem !important;
	color : #0c43a8 !important;
}

</style>
</head>
<body>

<div class="container">
	<h2> <a href = "pshopList.do" style="color: inherit; text-decoration: none;" >혀노SHOP</a> </h2>
	  <table class="table table-striped">
		<colgroup>
			<col style="width:10%" >
			<col style="width:30%" >
			<col style="width:20%" >
			<col style="width:20%" >
			<col style="width:20%" >
		</colgroup>    
		<c:if test="${not empty list}">
		<thead>
			<tr>
				<td colspan="1"></td>
				<td colspan="1">물품제목</td>
				<td colspan="1">구매수량</td>
				<td colspan="1">상품가격</td>
				<td colspan="1"></td>
			</tr>
		</thead>
		</c:if>
		<c:forEach var="vo" items="${list}" varStatus="status">
				<tr class="boardTitle" >
					<td colspan="1"><img src="<c:out value='/SIT/download/${vo.fileName}'/>" width="60px" height="60px" ></td>
					<td colspan="1"> ${vo.title} </td>
					<td colspan="1"> ${vo.count} </td>
					<td colspan="1"> ${vo.count * vo.price} </td>
					<td colspan="1"> <input type="button" class="btn btn-danger" value="삭제" onclick="deleteCart(${vo.cartNo})" /> </td>
				</tr>	
		</c:forEach>
	  </table>
	  
	  <c:if test="${not empty list}">
	  <input type="button" class="btn btn-primary" value="구매" onclick="payCart()" />
	  </c:if>
	  <c:if test="${empty list}">
	  	<div class="emptyCart">
	  		장바구니에 담긴 물품이 없습니다.
	  	</div>
	  </c:if>
	  
	  
</div>


</body>
</html>