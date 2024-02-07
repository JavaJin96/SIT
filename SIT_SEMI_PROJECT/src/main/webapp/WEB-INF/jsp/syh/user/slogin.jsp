<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>로그인</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  	function signup(){
		location.href = '<c:out value="sSignup.do" />';  // 회원가입 페이지로
	}

	$(document).ready(function() {
		
	});
  
  </script>


</head>
<body>

<div class="container">
  <h2>Login</h2>
  
  <form class="form-horizontal" action="sdoLogin.do" >
    <div class="form-group">
      <label class="control-label col-sm-2" for="id">아이디:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="id" placeholder="아이디를 입력하세요" name="id">
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="pass">비밀번호:</label>
      <div class="col-sm-10">          
        <input type="password" class="form-control" id="pass" placeholder="비밀번호를 입력하세요" name="pass">
      </div>
    </div>
   
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-primary">로그인</button>
        <button type="button" class="btn btn-success" onclick="signup()">회원가입</button>
      </div>
    </div>
  </form>
</div>

</body>
</html>