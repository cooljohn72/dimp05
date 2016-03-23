<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title></title>
<link rel="stylesheet" type="text/css" href="#">
<!--[if IE]> <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script> <![endif]-->

<link rel="stylesheet" type="text/css" 
		href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
		
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/layoutV2.css"/>">

</head>

<script>	
	$(document).ready(function(){
		
		var alertDiv = $("#alertPanel");
		var resultmsg = "${resultmsg}";
		alertDiv.css("display", "none");
		if(resultmsg){
			alertDiv.css("display", "block");
		}
				
		$("#submit-button").submit(function(){
	        /* alert("The submit-button was clicked."); */
	        alert($("#email").val());
	    });
		
		$("#email").blur(function(){
	        /* alert("the email field has been blur.."); */
	        // validate duplicated email and valid email address format.
	    });
		
		$("#pword").change(function(){
			//check password security level.
		});	
		
		$("#pwordConfirm").blur(function(){
			// check if the same value has been entered.
			 
			if($("#pword").val() != $("#pwordConfirm").val()){
				alertDiv.css("display", "block");
				alertDiv.html("비밀번호가 다릅니다!");
				$("#pwordConfirm").val("");
				$("#pwordConfirm").focus();				
			}else{
				alertDiv.css("display", "block");
				alertDiv.html("");
			}
		});	
		
		$("#btn-moveToSignUp").click(function(){
			location.href="${contextPath}/signup";
		});
	});
</script>

<body>




<c:set var="loginUser" value="${loginUser}" scope="request" />
<jsp:include page="/WEB-INF/view/shared/topV3.jsp" flush="true"/>

<form id='theForm' action="${contextPath }/signin" method="post">
<div class="container " style="overflow: scroll; margin-bottom: 100px; z-index:0; ">
	<div class="row" style='padding-top:150px; padding-bottom:150px'>
		<div class="col-md-2 col-sm-2 col-xs-1" id='spacer'></div>
		
		<div class='col-md-8 col-sm-8 col-xs-10 ' id="content" style='padding:50px' >
			<!-- content area -->
			<div class='row'>
					
				<div class='col-md-4 bg-dimp text-center' style='padding:50px; height:300px'>
					<p>딤프가 처음이신가요?</p>
					<br><br><br><br><br><br><br><br>
					<div class='col-md-12'>
						<a href="${contextPath}/signup" class='btn btn-primary btn-block'>회원 가입</a>
					</div>
				</div>
				<div class='col-md-8 bg-white border-silver' style='padding:30px; padding-top:15px ;height:300px'>
				 	<p class='font-gray'><a href="#">페이스북 계정</a> 또는 <a href="#">구글 계정</a>으로도 로그인하실 수 있습니다.</p>
					<hr class="dimp-border-color">
					<div class=''>
						<input type="email" name="email" id="email" class="form-control input-lg text-center" placeholder="이메일 주소" /><br />
					</div>
					<div class=''>
						<input type="password" name="pword" id="pword" class="form-control input-lg text-center" placeholder="비밀번호" />
					</div>
					<br>
					<div class='row'>
						<div class='col-lg-6'>
							<label class='font-gray small'>					
							<input type="checkbox" name='rememberMe' id="rememberMe">
							비밀번호 저장
							</label> 
						</div>
						<div class='col-lg-6 small'>
							<a href="${contextPath}/password/forgot" class='font-dimp'>비밀번호가 생각나지 않으세요?</a> 
						</div>					
					</div>
					<div class='row text-right'>
						<div class=''>					
						<button type="submit" class='btn btn-default' id='submit-button' name='submit-button'>로그인</button>
						</div>									
					</div>
									
				</div>
			</div>
			<!-- /. content area -->
			<br>
			<!-- alert area -->
			
			<div class='row'>
				<c:if test="${isAlreadySignUp.equals(true)}">
					<div id='alertPanel_alreadySignUp' class='alert alert-info' style="display:block;">${isAlreadySignUpMSG}</div>
				</c:if>
				
				<div id='alertPanel' class='alert alert-danger' style="display:block;">${resultmsg}</div>
			</div>
			<!-- /. alert area -->				
		</div>		
		
		<div class="col-md-2 col-sm-2 col-xs-1" id='spacer'></div>	
	</div>
	
</div>
</form>
<jsp:include page="/WEB-INF/view/shared/footerV2.jsp" flush="true"/>

</body>
</html>