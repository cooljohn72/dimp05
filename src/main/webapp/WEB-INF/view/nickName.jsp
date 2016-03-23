<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="utf-8"/>
    <title>DIMP</title>
    <link rel="stylesheet" type="text/css" href="#">
	<!--[if IE]> <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script> <![endif]-->
 	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/layout.css"/>"> 	 
 	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/smoothness/jquery-ui-1.9.2.custom.css"/>"> 	
 	<link rel="stylesheet" type="text/css" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
 	<%-- 
 	<script src="<c:url value="">" type="text/javascript" charset="utf-8"></script>
 	 --%>
 	 
 	<script src="<c:url value="/resources/js/jquery-1.8.3.js"/>" type="text/javascript" charset="utf-8"></script>
 	
 	<script>
	$(document).ready(function(){
		$("#submit-button").click(function(){
	        alert("The paragraph was clicked.");
	        
	        
	        // 비번 일치하고 ID중복 없으면 submit button 활성
	        
	    });
		
		$("#email").change(function(){
	        //alert("The paragraph was changed");
			//ID 중복 체크.
	       	//var idCheck = $("#isDulplicatedID").val();
	        //alert($("#isDuplicatedID").val());
	        //show();
	    });
		
		
		
		// 비밀번호 확인 일치여부 체크 
	});
	
	function checkPW(pw_o, pw_c)
	{
		if(pw_o!=pw_c){
			//display alert
			return false;
		}		
	}
	
	function formCheck(){
		
	}
</script>
 	
</head>
<body>

<div class="container">
	<div class="row">
		<div class="col-md-12 col-sm-12" id="top_layer_fixed">
			<jsp:include page="/WEB-INF/view/shared/top.jsp" flush="true"/>
		</div>
	</div>

	
	
	<form action="/user/requestActivation" method="post" onSubmit="return formCheck();">	
	<div class="row" id="centerContent">
  		<div class="col-md-12">
  			<!-- <div class="row">
  				<div class="col-md-12">
  					<h3>Sign-up with</h3>
  				</div>  				
  			</div>
  			 -->
  			  
  			<h3>Nick Name : ${user.eMail}/${user.password}</h3>
  			<p th:text="'eMail: ' + ${user.eMail}" />
  			<p th:text="'password: ' + ${user.password}" />
			
			<div class="row">
				<div class="col-md-12">
					<label for="nickName">별칭 </label><br />
					<div class="col-md-6">
						<input type="text" name="nickName" id="nickName" class="form-control" placeholder="홍길동 " />
					</div>
					<div id='nickNameAlert' class="text-danger">alert....쓸 수 없음..</div>
					<br />
					<div id="nickNameInfo">활동 잘하겠슴... 아래 활성화 버튼을 눌러주세요. </div>	
					<br/>
					
				</div>			
			</div>
			<div class="row">
				<div class="col-md-12">
					<input class="btn btn-primary" type="button" id="activation-button" name="activation-button" value="Complete Sign-up" />
			
				</div>				
			</div>			
  		</div>
  	</div>
  	
  	<input type="hidden" id="isDuplicatedNickName" value="1"/>
  	
  	</form>

	<!-- footer -->
	<div class='row' id="footer_container">
		<div id="footer">
			<jsp:include page="/WEB-INF/view/shared/footer.jsp" flush="true"/>
		</div>
	</div>
  	
</div>  	

<%-- 
<div id="top_container" class="row">
	<div id="top_layer_fixed">
    	<jsp:include page="/WEB-INF/view/shared/top.jsp" flush="true"/>      
    </div>
</div>
 --%>

<!-- 
<div id="content" class="row">
	<div id="centerContent">		
		<form action="/user/requestActivation" method="post" onSubmit="return formCheck();">				
		</form>	
	</div>	
</div>
 -->
</body>
</html>