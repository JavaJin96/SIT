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
        .container { max-width: 800px; margin: auto; padding: 20px; }
        .boardTitle, .boardContent { background-color: #f8f9fa; }
        textarea { resize: none; }
    </style>
</head>
<body>

<div class="container">
    <h2>게시글 상세 보기</h2>
    <table class="table">
        <colgroup>
            <col style="width:25%">
            <col style="width:75%">
        </colgroup>
        <tr class="boardTitle">
            <td>글 제목</td>
            <td>${post.title}</td>
        </tr>
        <tr class="boardContent">
            <td>글 내용</td>
            <td><pre>${post.contents}</pre></td>
        </tr>
        <tr>
            <td>작성자</td>
            <td>${post.userNo}</td>
        </tr>
        <tr>
            <td>작성일</td>
            <td><fmt:formatDate value="${post.createdDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
        </tr>
        <tr>
            <td>조회수</td>
            <td>${post.count}</td>
        </tr>
        <tr>
            <td colspan="2" align="right">
                <button type="button" class="btn btn-warning" onclick="history.back();">목록으로 돌아가기</button>
            </td>
        </tr>
    </table>
</div>

</body>
</html>
