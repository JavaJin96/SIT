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
  
  $(function() {
	$('form').submit(function(){
		
		var pass = $('#pass').val();
		$("#id").removeAttr("disabled");
		$("#name").removeAttr("disabled");	
	});
  });
  
  function back() {
	  location.href = '<c:out value="slogin.do"/>';
  }
  
  // 아이디, 닉네임 중복체크 통과 시 회원가입 버튼 활성화 -> 현호님 아이디어
  function checkButton() {
	  var idYes = $("#idYes").val();
	  var nameYes = $("#nameYes").val();

	  
	  if (idYes === 'true' && nameYes === 'true') {
	        $("button[type='submit']").removeAttr("disabled");
	    } else {
	        $("button[type='submit']").attr("disabled", "disabled");
	    }
  }
  
  function checkId() {
	  var userId = document.getElementById("id").value;
	  var encodedId = encodeURIComponent(userId);
	  $.ajax({
	    	url : "<c:url value='suserDbCheck.do'/>",
	        type: 'GET',
	        data: {"id" : userId},
	        success: function(data) {
	            if (data.dbId != null && data.dbId == userId) {
	                alert("이미 사용중인 아이디입니다.");
	            } else if (userId.trim() == '') {
	            	alert("아이디를 입력하세요.");
	            } else if (userId.length >= 15) {
	            	alert("아이디는 14자 이내로 입력하세요.")
	            } else if (/\s/.test(userId)) {
	            	alert("아이디는 띄어쓰기가 불가능합니다.")
	            } else {
	                alert("사용 가능한 아이디입니다.");
	                $("#idYes").val("true");
	            }   
	            checkButton();
	        },
	        error: function() {
	            alert('예기치 못한 오류가 발생했습니다.');
	        }
	    });
  }
  
  function checkName() {
	  var userName = document.getElementById("name").value;
	  var encodedName = encodeURIComponent(userName);
	  $.ajax({
	    	url : "<c:url value='suserNameCheck.do'/>",
	        type: 'GET',
	        data: {"name" : userName},
	        success: function(data) {
	            if (data.dbName !== null && data.dbName === userName) {
	                alert("이미 사용중인 닉네임입니다.");
	            } else if (userName.trim() == '') {
	            	alert("닉네임을 입력하세요.");
	            } else if (userName.length >= 10) {
	            	alert("닉네임은 10자 이내로 입력하세요.")
	            } else if (/\s/.test(userName)) {
	            	alert("닉네임은 띄어쓰기가 불가능합니다.")
	            } else {
	                alert("사용 가능한 닉네임입니다.");
	                $("#nameYes").val("true");
	            }        
	            checkButton();
	        },
	        error: function() {
	            alert('예기치 못한 오류가 발생했습니다.');
	        }
	    });
  }
  
  $(document).ready(function() {
		checkButton();
  });
  
  </script>
</head>
<body>
<input type="hidden" id="idYes" value="" />
<input type="hidden" id="nameYes" value="" />
<div class="container">
  <h2>회원가입</h2>
  
  <form class="form-horizontal" action="suserInsert.do" method="post">
    <div class="form-group">
      <label class="control-label col-sm-2" for="id">아이디:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="id" placeholder="아이디를 입력하세요" name="id" required/>
        <input type="button" value="중복 체크" onclick="checkId()" class="btn btn-info">
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="pass">비밀번호:</label>
      <div class="col-sm-10">          
        <input type="password" class="form-control" id="pass" placeholder="비밀번호를 입력하세요" name="pass" required/>
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="name">닉네임:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="name" placeholder="닉네임을 입력하세요" name="name" required/>
      	<input type="button" value="중복 체크" onclick="checkName()" class="btn btn-info">
      </div>
    </div>
   
    <div class="form-group text-center">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-primary">회원가입</button>
        <button type="button" class="btn btn-success" onclick="back()">취소</button>
      </div>
    </div>
  </form>
</div>

</body>
</html>