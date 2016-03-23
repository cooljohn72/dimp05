<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="loginUser" value="${loginUser}" scope="request" />

 
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
	});
</script>

<body>


<jsp:include page="/WEB-INF/view/shared/topV3.jsp" flush="true"/>

<form id='theForm' action="${contextPath }/requestactivation" method="post">
<div class="container " style="overflow: scroll; margin-bottom: 100px; z-index:0; ">
	<div class="row" style='padding-top:100px; padding-bottom:150px'>
		<div class="col-md-2 col-sm-2 col-xs-1" id='spacer'></div>
		
		<div class='col-md-8 col-sm-8 col-xs-10 ' id="content" style='padding:50px' >
		
			<div class='col-md-4 bg-dimp text-center' style='padding:50px; height:420px'>
				<p>딤프를 사용하고 계신가요?</p>
				<br><br><br><br><br><br><br><br>
				<div class='col-md-12'>
					<a href="${contextPath}/signin" class='btn btn-primary btn-block'>로그인</a>
				</div>
			</div>
			<div class='col-md-8 bg-white border-silver' style='padding:30px; padding-top:15px ;height:420px'>
			 	<p class='font-gray'><a href="#">페이스북 계정</a> 또는 <a href="#">구글 계정</a>으로도 가입하실 수 있습니다.</p>
				<hr class="dimp-border-color">
				<div class='text-center'>
					<table style='width:100%' class=''>
						<tr>
							<td style='width:50%;border-right: 1px solid #639493'>
								<label class='' style="cursor:pointer;"><input type='radio' name='userType' id='userType_p' value='p'> 개인회원</label> 
							</td>							
							<td style='width:50%;'>
								<label class='' style="cursor:pointer;"><input type='radio' name='userType' id='userType_b'  value='b'> 사업자 회원</label> 
							</td>
						</tr>						
					</table>
					<a href="#" class='font-dimp small'>제가 무슨 회원에 해당하는지 알고 싶어요</a>
					<!-- 
					<ul class=''>
						<li class='horizontal_ul_li _test text-center' style="margin-right:30px;">개인회원 
						</li>
						<li class='horizontal_ul_li _test text-center' style="margin-left:30px;">사업자 회원 
						</li>
					</ul> -->
				</div>
				<br>
				<!-- 
				<div class='row'>
					<div class='col-md-5 text-center' style='border-right:1px solid #639493'>
						개인회원
					</div>				
					
					<div class='col-md-5 text-center'>
						사업자 회원
					</div>
				</div>
				 -->

			 
				<div class=''>
					<p>아래 인증메일 발송하기 버튼을 누르시면 등록하신 이메일 계정 ${registeredEmail} (으)로 인증확인 메일이 발송됩니다.</p>
					<p>메일에 포함된 주소로 접속하여 최종 인증을 받으시면 회원등록이 완료됩니다.</p>
					<br />
				</div>
							
				<br>
				<div class='row'>
					
					<div class=''>					
						<button type="submit" class='btn btn-primary btn-block' id='submit-button' name='submit-button'>등록하신 메일 인증받기</button> 
					</div>					
				</div>
				<div class='row text-right'>
					<div class=''>
						
					</div>									
				</div>				
			</div>
			<div id='passwordAlert' class='alert alert-danger ' style="display:none;"></div>		
		</div>		
		
		<div class="col-md-2 col-sm-2 col-xs-1" id='spacer'></div>	
	</div>
	
</div>
<input type='hidden' name='requestingUserIdx' id='requestingUserIdx' value='${requestingUserIdx}'/>
<input type='hidden' name='requestingEmail' id='requestingEmail' value='${registeredEmail}'/>

</form>

<!-- original -->
<div class="container " style="overflow: scroll; margin-bottom: 100px; z-index:0">
	<div class="row">
	
		<!-- spacer -->	
		<div class="col-md-3 col-sm-3 col-xs-1" id='spacer'></div>
	
		<div class='col-md-6 col-sm-6 col-xs-10' id="content">
			
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

<!-- /. original -->

<jsp:include page="/WEB-INF/view/shared/footerV2.jsp" flush="true"/>

</body>
</html>