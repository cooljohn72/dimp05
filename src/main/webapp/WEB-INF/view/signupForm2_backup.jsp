<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title></title>
<link rel="stylesheet" type="text/css" href="#">
<!--[if IE]> <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script> <![endif]-->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/layoutV2.css"/>">

</head>

<script>
	$(document).ready(function(){
		$("#submit-button").click(function(){
			
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
			var alertDiv = $("#passwordAlert"); 
			if($("#pword").val() != $("#pwordConfirm").val()){				
				alertDiv.css("display", "block");
				alertDiv.html("**비밀번호가 다릅니다!");
				$("#pwordConfirm").val("");
				$("#pwordConfirm").focus();				
			}else{				
				alertDiv.css("display", "none");
				alertDiv.html("");
			}
		});
		
		
	});
</script>

<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/view/shared/topV3.jsp" flush="true"/>

<div class="container" style="overflow: scroll; margin-bottom: 100px; z-index:0">
	<div class="row" >
		<!-- spacer -->	
		<div class="col-md-3 col-sm-3 col-xs-1" id='spacer'></div>
	
		<div class='col-md-6 col-sm-6 col-xs-10' id="mainContent">
			<form action="${contextPath }/signup" method="post">
		
				<h3>Sign-up with</h3>
			
				<div id="openid-buttons">
					<div class="major-provider   facebook-login" data-provider='facebook' data-oauthserver='https://www.facebook.com/v2.0/dialog/oauth' data-oauthversion='2.0'>
						<div class="icon-container"><span class="icon" style=""></span></div>
						<div class="text"><span>Facebook</span></div>
						<!-- 
						<br class="cbt"/>
						 -->
					</div>
					
					<div class="major-provider   google-login" data-provider='google' data-oauthserver='https://accounts.google.com/o/oauth2/auth' data-oauthversion='2.0'>
						<div class="icon-container"><span class="icon" style=""></span></div>
						<div class="text"><span>Google</span></div>
						<!-- 
						<br class="cbt"/>
						 -->
					</div>
					
	           	</div>
			
				
				
				<ul>
					<li><a href='#'>Facebook</a></li>
					<li><a href='#'>Google+</a></li>
				</ul>
				
				or<br>
				
				<label for="email">Email</label><br />
				<input type="email" name="email" id="email" class="form-control" placeholder="example@domain.com" /><br />
				
				<label for="pword">Password</label><br />
				<input type="password" name="pword" id="pword" class="form-control" placeholder="" /><br />
				
				<label for="pwordConfirm">Confirm Password</label><br />
				<input type="password" name="pwordConfirm" id="pwordConfirm" class="form-control" placeholder="" /><br />
				
				<div id='passwordAlert' class='alert alert-danger ' style="display:none;"></div>
				<!-- btn-primary
				
				<input class="fr" type="button" id="submit-button" name="submit-button" value="Sign up" /> -->
				<button type='button' class='btn btn-primary btn-block' id='submit-button' name='submit-button'>Sign Up</button>
			
			</form>
		
		</div>
		
		<!-- spacer -->
		<div class="col-md-3 col-sm-3 col-xs-1" id='spacer'></div>
		
		<!-- 
		<div class='col-md-2' style='height:1000px'>
			<p>
				This is the side bar
			</p>
		</div>
		 -->
	</div>
</div>

<jsp:include page="/WEB-INF/view/shared/footerV2.jsp" flush="true"/>

</body>
</html>