<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
/* new SignUp */
%>
 
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
			/* 
			alert($("[id^='userType_']").prop("checked",true).val());
			 */
			/* checkUserTypeChecked(); */
			
			if($("#email").val().trim()==""){
				alert("email!");
				return false;
			}
			if($("#pword").val().trim()==""){
				alert("password!");
				return false;
			}else{
				/* 
				
				*/
			}					
	    });
		
		$("#email").blur(function(){
	        /* alert("the email field has been blur.."); */
	        // validate duplicated email and valid email address format.
	    });
		
		$("#pword").change(function(){
			//check password security level.
			if(!chkPwd( $.trim($('#pword').val()))){
				   $('#pword').val('');
				   $('#pword').focus();
				   //return false;
			}
		});	
		
		
		$("#pwordConfirm").blur(function(){
			// check if the same value has been entered.
			checkSamePasswords();
		});
		
	});
	
function checkUserTypeChecked(){
	if($('input[name="userType"]:checked').val()==""){
		alert("회원 형태를 선택해 주세요.");
		return false;
	}
}

function checkSamePasswords(){
	var alertDiv = $("#passwordAlert"); 
	if($("#pword").val() != $("#pwordConfirm").val()){				
		alertDiv.css("display", "block");
		alertDiv.html("**비밀번호가 다릅니다!");
		$("#pwordConfirm").val("");
		/* $("#pwordConfirm").focus(); */				
	}else{				
		alertDiv.css("display", "none");
		alertDiv.html("");
	}
}

/* 	
영문,숫자,특수문자 혼합하여 8자리~20자리 이내.(비밀번호 표준)
 */
function chkPwd(str){
	var pw = str;
	var num = pw.search(/[0-9]/g);
	var eng = pw.search(/[a-z]/ig);
	var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
 	var alertDiv = "";
	var alertMessage = "";
	
	alertDiv = "#pwordAlert";
	if(pw.length < 8 || pw.length > 20){		
		alertMessage = "8자리 ~ 20자리 이내로 입력해주세요.";	
		showAlert(alertDiv, alertMessage);		
		/* alert("8자리 ~ 20자리 이내로 입력해주세요."); */
		return false;
	 }else{
		hideAlert(alertDiv);
	}
	 if(pw.search(/₩s/) != -1){		
		alertMessage = "비밀번호는 공백업이 입력해주세요.";	
		showAlert(alertDiv, alertMessage);
		 return false;
	 } else
		hideAlert(alertDiv);
	
	if(num < 0 || eng < 0 || spe < 0 ){
		alertMessage = "영문,숫자, 특수문자를 혼합하여 입력해주세요.";	
		showAlert(alertDiv, alertMessage);
		return false;
	 }else
		hideAlert(alertDiv);;
	 
	 return true;
	}
		
function showAlert(divName, msg){
	var alertDiv = divName;
	var alertMessage = msg;
	
	$(alertDiv).html(alertMessage);
	$(alertDiv).css("display", "block");		
}		
function hideAlert(divName){
	var alertDiv = divName;
	$(alertDiv).html("");
	$(alertDiv).css("display", "none");
}
</script>

<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/view/shared/topV3.jsp" flush="true"/>

<form action="${contextPath }/signup" method="post">
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
								<label class='' style="cursor:pointer;"><input type='radio' name='userType' id='userType_p' value='p' checked> 개인회원</label> 
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
					<input type="email" name="email" id="email" class="form-control input-lg text-center" placeholder="이메일 주소" />
					<br />
				</div>
				<div class=''>					
					<input type="password" name="pword" id="pword" class="form-control input-lg text-center" placeholder="비밀번호" />					
					<div id='pwordAlert' class='small' style='color: red;'></div><br>
				</div>				
				<div class=''>
					<input type="password" name="pwordConfirm" id="pwordConfirm" class="form-control input-lg text-center" placeholder="비밀번호 확인" /><br />
				</div>				
				<br>
				<div class='row'>
					<div class='col-lg-9'>
						<p class='font-gray small'>					
						회원가입을 하면 딤프의 <span class='font-dimp'>서비스 약관, 개인정보 보호정책, 호스트 보호 프로그램 이용약관</span>에 동의하게 됩니다.
						</p> 
					</div>
					<div class='col-lg-3'>
					<!-- 
						<a href="#" class='font-dimp'>비밀번호가 생각나지 않으세요?</a>
					 -->	
						<button type="submit" class='btn btn-default' id='submit-button' name='submit-button'>회원 가입</button> 
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
</form>

<jsp:include page="/WEB-INF/view/shared/footerV2.jsp" flush="true"/>

</body>
</html>