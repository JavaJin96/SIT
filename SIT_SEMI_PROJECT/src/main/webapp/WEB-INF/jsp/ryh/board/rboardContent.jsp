<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 상세 보기</title>
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <style>
        .container { 
        	max-width: 800px; margin: auto; padding: 20px; 
        }
        .boardTitle, .boardContent { 
        	background-color: #f8f9fa; 
        }
        textarea { 
        	resize: none; 
        }
        
        .table {
		    table-layout: fixed;
		    width: 100%;
		}
        
        .boardTitle td{
        	max-width: 500px; 
		    word-wrap: break-word;
		    white-space: pre-wrap;
        }
        
        .boardContent td {
		    max-width: 500px; 
		    height: 350px; 
		    overflow: auto; 
		    word-wrap: break-word;
		    white-space: pre-wrap;
		}
       
		
    </style>
</head>
<body>
	<script type="text/javascript">
    
    function updateBoard(num){
    	location.href = 'rboardUpdatepage.do?num='+ num;
    }
    
    function deleteBoard(num){
    	location.href = 'deleteBoard.do?num=' + num;
    }
    
    function backlist(){
    	location.href = 'rboardList.do';
    }
    
    </script>
    
<input type="hidden" name="num" value="${vo.num}" />
<div class="container">
    <h2>게시글 상세 보기</h2>
  <c:if test="${vo!=null}">
    <table class="table">
        <colgroup>
            <col style="width:25%">
            <col style="width:75%">
        </colgroup>
        <tr class="boardTitle">
            <td>글 제목</td>
            <td>${vo.title}</td>
        </tr>
        <tr class="boardContent">
            <td>글 내용</td>
            <td>${vo.contents}</td>
        </tr>
        <tr>
            <td>작성자</td>
            <td>${vo.writer}</td>
        </tr>
        <tr>
            <td>작성일</td>
            <td><fmt:formatDate value="${vo.contentDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
        </tr>
        <tr>
            <td>조회수</td>
            <td>${vo.count}</td>
        </tr>
      </c:if>
        <tr>
            <td colspan="2">
	            <button type="button" class="btn btn-warning" onclick="updateBoard(${vo.num});">수정</button>
	            <button type="button" class="btn btn-warning" onclick="deleteBoard(${vo.num});">삭제</button>
                <button type="button" class="btn btn-warning" onclick="backlist();" >목록으로 돌아가기</button>
            </td>
        </tr>
    </table>
</div>

</body>
</html>
