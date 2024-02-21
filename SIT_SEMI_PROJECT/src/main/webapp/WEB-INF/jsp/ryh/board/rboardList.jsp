<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판</title>
    <script type="text/javascript">
    function boardWrite(){
    	location.href = '<c:out value="rboardWrite.do"/>';
    }
    
    function goToContent(num) {
        location.href = 'rboardContent.do?num=' + num; 
    }
    
    </script>
    
    <style>
         
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .page-title h3 {
            margin: 0;
            padding-bottom: 20px;
            font-size: 24px;
        }
        .board-table {
            width: 100%;
            border-collapse: collapse;
        }
        .board-table, .board-table th, .board-table td {
            border: 1px solid #ddd;
        }
        .board-table th, .board-table td {
            padding: 8px;
            text-align: left;
        }
        .board-table th {
            background-color: #f2f2f2;
        }
        .board-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .board-table tr:hover {
            background-color: #eef;
        }
        .search-window {
            margin-bottom: 20px;
        }
        .search-wrap {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        .search-wrap input[type="search"] {
            width: 80%;
            padding: 10px;
            margin-right: 10px;
        }
        .search-wrap button {
            width: 18%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
        }
        .search-wrap button:hover {
            background-color: #0056b3;
        }
        .wrap {
            text-align: right;
            margin-top: 20px;
        }
        .wrap button {
            padding: 10px 20px;
            background-color: #28a745;
            color: white;
            border: none;
            cursor: pointer;
        }
        .wrap button:hover {
            background-color: #218838;
        }
        
        .board-table td {
		    max-width: 100px;
		    overflow: hidden;
		    text-overflow: ellipsis;
		    white-space: nowrap;
		}
        

    </style>
</head>
<body>

<section class="notice">
    <div class="page-title">
        <h3>게시판</h3>
    </div>
    <div id="board-search">
        <div class="search-window">
    <form action="ryh/rsearchList.do" method="post" accept-charset="UTF-8">
        <div class="search-wrap">
            <input id="search" type="search" name="search" placeholder="검색어를 입력해주세요." required>
            <button type="submit">검색</button> 
        </div>
    </form>
</div>
    </div>
   
    <div id="board-list">
        <table class="board-table">
            <thead>
                <tr>
                    <th scope="col">번호</th>
                    <th scope="col">제목</th>
                    <th scope="col">내용</th>
                    <th scope="col">조회수</th>
                    <th scope="col">작성자</th>
                    <th scope="col">작성일자</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="vo" items="${list}" varStatus="status">
                    <tr onclick="goToContent(${vo.num})" style="cursor: pointer;"> 
                            <td>${status.index + 1}</td>
                            <td>${vo.title}</td>
                            <td>${vo.contents}</td>
                            <td>${vo.count}</td>
                            <td>${vo.writer}</td>
                            <td>${vo.contentDate}</td>
                        </tr>
                </c:forEach>
            </tbody>				
        </table>
        
        <div class="wrap">
            <button type="button" onclick="boardWrite()">글 작성</button>
        </div>
    </div>
</section>
</body>
</html>
