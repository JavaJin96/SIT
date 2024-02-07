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
		var id = $('#id').val();
		var pass = $('#pass').val();
		var name = $('#name').val();
		
		if (id.length >= 15) {
			alert('14자 이내로 입력하세요')
			return false;
		}
		if (pass.length >= 15) {
			alert('14자 이내로 입력하세요')
			return false;
		}
		if (name.length >= 10) {
			alert('10자 이내로 입력하세요')
			return false;
		}
	});
  });
  
  function idCheck() {
	  var checkId = document.getElementById("id").value;
	  var encodedId = encodeURIComponent(checkId);
	  
	  $.ajax({
	    	url : "<c:url value='suserDbCheck.do'/>",
	        type: 'GET',
	        data: {"id" : checkId},
	        success: function(data) {
	            if (data.dbId !== null && data.dbId === checkId) {
	                alert("중복된 아이디입니다");
	            } else {
	                alert("사용 가능한 아이디입니다.");
	                $("#isIdAvailable").val("true");
	            }          
	        },
	        error: function() {
	            alert('예기치 못한 오류가 발생했습니다.');
	        }
	    });
  }
  
  </script>

</head>
<body>
<input type="hidden" id="isIdAvailable" value="" />
<div class="container">
  <h2>회원가입</h2>
  
  <form class="form-horizontal" action="suserInsert.do" method="post">
    <div class="form-group">
      <label class="control-label col-sm-2" for="id">아이디:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="id" placeholder="아이디를 입력하세요" name="id" required/>
        <input type="button" value="중복 체크" onclick="idCheck()" class="btn btn-info">
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
      </div>
    </div>
   
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-primary">회원가입</button>
        <button type="button" class="btn btn-success" onclick="history.back()">취소</button>
      </div>
    </div>
  </form>
</div>

</body>
</html>