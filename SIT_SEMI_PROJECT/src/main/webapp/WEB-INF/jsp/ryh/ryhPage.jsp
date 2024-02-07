<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>게시판</title>
  <link rel="stylesheet" type="text/css" href="CSS/RboardList.css">
  <link rel="stylesheet" type="text/css" href="CSS/Rbutton.css">
</head>
<body>
<section class="notice">
  <div class="page-title">
        <div class="container">
        <a href="/BOARD/bl.do">
            <h3>게시판</h3>
        </a>
        </div>
    </div>
    <div id="board-search">
        <div class="container">
            <div class="search-window">
                <form action="/BOARD/st.do" method="post" accept-charset="UTF-8">
                    <div class="search-wrap">
                        <label for="search" class="blind">제목 검색</label>
                        <input id="search" type="search" name="search" placeholder="검색어를 입력해주세요." value="" required>
                        <button type="submit" class="btn btn-dark">검색</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
   
    <div id="board-list">
        <div class="container">
            <table class="board-table">
                <thead>
                <tr>
                    <th scope="col" class="th-num">번호</th>
                    <th scope="col" class="th-title">제목</th>
                    <th scope="col" class="th-date">등록일</th>
                </tr>
                </thead>
                <tbody>
				  <%
				  for(boardVO vo : list) {%>
				    <tr>
				      <td><%=vo.getNum()%></td>
				      <td><a href="bc.do?num=<%=vo.getNum()%>"><%=vo.getTitle()%></a></td>
		              <td><%=vo.getContentDate()%></td>
				    </tr>
				  <%  }  %>
		      	</tbody>				
            </table>
            
            <div class="pagination" style="text-align: center;">
                <%-- 이전 페이지로 이동하는 링크 --%>
                <% if (currentPage > 1) { %>
                    <a href="/BOARD/bl.do?page=<%=currentPage - 1%>" class="pagination-link">&lt; 이전</a>
                <% } else { %>
                    <span class="pagination-link-disabled">&lt; 이전</span>
                <% } %>

                <%-- 페이지 번호 출력 --%>
                <span class="pagination-current" ><%=currentPage%></span>

                <%-- 다음 페이지로 이동하는 링크 --%>
                <% if (currentPage < totalPages) { %>
                    <a href="/BOARD/bl.do?page=<%=currentPage + 1%>" class="pagination-link">다음 &gt;</a>
                <% } else { %>
                    <span class="pagination-link-disabled">다음 &gt;</span>
                <% } %>
            </div>
            
            
            
            <br>
            <div class="wrap" style="float: right;">
				<button type="button" onclick="location.href='/BOARD/board/boardInsert.jsp'" class="button">글 작성</button>
			</div>
        </div>
    </div>
		

</section>
</body>
</html>
