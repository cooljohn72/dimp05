<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>
<jsp:useBean id="now" class="java.util.Date" />
 
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
<!--  
  <script type="text/javascript" src="/static/ckEditor/ckeditor.js"></script>
-->
 
<script type="text/javascript" src="//cdn.jsdelivr.net/ckeditor/4.0.1/ckeditor.js"></script>


<!-- for tag-it -->
<!-- 
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.12/jquery-ui.min.js" type="text/javascript" charset="utf-8"></script>
<script src="js/tag-it.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/flick/jquery-ui.css">
<link href="css/jquery.tagit.css" rel="stylesheet" type="text/css">
 -->

<!-- end of tag-it -->


 
</head>
<script type="text/javascript">
$(document).ready(function(){
	/* navi bar */
	$("#btn_backToStep0").click(function(){
        $("#tStep0").trigger("click");
    });
	
	$("#btn_toStep2").click(function(){
        $("#tStep2").trigger("click");
    });
	$("#btn_backToStep1").click(function(){
        $("#tStep1").trigger("click");
    });
	
	$("#btn_toStep3").click(function(){
        $("#tStep3").trigger("click");
    });
	$("#btn_backToStep2").click(function(){
        $("#tStep2").trigger("click");
    });
 
	$("#s01_LBLmoveToStep1").click(function(){
        $("#tStep1").trigger("click");
    });
	
	$("#s02_LBLmoveToStep1").click(function(){
        $("#tStep1").trigger("click");
    });
	 
	 $("#btn-toSave").click(function(){
		 // howTo에 단순 저장 값 설정.
		 $("#howTo").val("toSave");		 
		 $("#postForm").submit();
		 
	 });
	
	 $("#btn-toPost").click(function(){
		 // howTo에 공고 올리기 값 설정.
		 $("#howTo").val("toPost");		 
		 $("#postForm").submit();	
	 });
	 
	 $("#btnSubmit").click(function(){
		 
	 });
	 
	 
	 $("#contactNumber").focus(function(){		 
		$("#contactNumber").removeClass("errorField");		 
	 }); 
	 
});
</script>
<!-- The scrollable area -->
<body data-spy="scroll" data-target=".navbar" data-offset="50">

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/view/shared/topV3.jsp" flush="true"/>
<div class="container " style="overflow: scroll; margin-bottom: 100px; z-index:0" id="mainContent">
	<div class="row" >
	
				
		<jsp:include page="user_sideProfile.jsp"></jsp:include>
		
		<form id="postForm" class="form text-left" role="form" 
			action="${contextPath}/user/${targetUser.getIdx()}/p/edit" method="POST">		
	
		<div class='col-md-10 text-center' style="border-left:1px solid silver">
			<%-- 
			check login id and target user id
			if they are different, do not show the nav.
			
			<c:if test="" --%>
	
			<jsp:include page="userProfile_nav.jsp">
				<jsp:param name="targetUser" value="${targetUser.getIdx()}"/>
			</jsp:include>
			
			<!-- 
			<div class="tab-content" id="section1"> -->			
				<!-- activity -->
			  <div id="section1" class='row'>
			    <h3 class='text-left'>개인 기본 프로필 </h3>
			  	<div class='container col-md-8 profileElementBlock text-center'>			  	
				  	<div class='row' id='div_profilePicture'>				  		
				  		<div class='col-md-4 text-right profileElementHeader'>
				  			<label>프로필 사진 / 마크</label>
				  		</div>
				  		
				  		<div class='col-md-8 text-left' id='profileImageUploadContainer'>
				  			<div class='row'>
					  			<div class='col-md-4'>
						  			<img src="<c:url value="/resources/userUpload/pp/pp_44.jpg"/>" class='img-circle' alt="Cinque Terre" width="100" height="100">
						  		</div>
						  		
						  		<div class='col-md-8 text-center'>
						  			<p>권장 이미지
						  			<br> 
						  			( 250 x 250px )			  			
						  			</p>
						  			<button class='btn btn-link' type="button">업로드</button>
						  		</div>
				  			</div>				  			
				  			<div class='row'>
				  				<div class='col-md-12'>
				  				<p>
						  		회원님을 보여줄 수 있는 사진 또는 마크를 올려주세요.<br/> 
						  		올려주신 이미지는 딤프의 다른 회원들께 보여집니다.				  		
						  		</p>
				  				</div>
						  				
				  			</div>					  		
				  		</div>
				  	</div>
			  	</div>
			  	
			  	<div class='container col-md-8 profileElementBlock text-center'>			  	
				  	<div class='row' id='div_email'>				  		
				  		<div class='col-md-4 text-right'>
				  			<label>이메일 </label>
				  		</div>
				  		
				  		<div class='col-md-8 text-left' id='profileImageUploadContainer'>
				  			<div class='row'>
					  			<div class='col-md-12 '>
						  			${targetUser.geteMail()}
						  		</div>
				  			</div>				  			
				  			<div class='row'>
						  		<div class='col-md-12 '>
						  		이메일은 다른 딤프 회원들에게 공개되지 않습니다.
						  		</div>				  						  		
						  				
				  			</div>					  		
				  		</div>
				  	</div>				  	
				  	<div class='row' id='div_pw'>				  		
				  		<div class='col-md-4 text-right'>
				  			<label>비밀번호 </label>
				  		</div>				  		
				  		<div class='col-md-8' id='profileImageUploadContainer'>
				  			<div class='row text-left'>
					  			<div class='col-md-4'>
						  			<label>****************</label>
						  		</div>
				  			</div>				  			
				  			<div class='row'>
				  				<div class='col-md-12 text-right'>
				  					<button class='btn btn-link' type="button">비밀번호 변경 </button>
				  				</div>						  		
				  			</div>					  		
				  		</div>
				  	</div>
				  	
				  	<div class='row' id='div_nickName'>				  		
				  		<div class='col-md-4 text-right'>
				  			<label>표시이름 </label>
				  		</div>				  		
				  		<div class='col-md-8' id='profileImageUploadContainer'>
				  			<div class='row text-left'>
					  			<div class='col-md-4'>
						  			<input type='text' name='nickName' value="${targetUser.getNickName()}" placeholder=''>
						  		</div>
				  			</div>			  		
				  		</div>
				  	</div>
				  	
				  	<div class='row' id='div_legalName'>				  		
				  		<div class='col-md-4 text-right'>
				  			<label>이름 </label>
				  		</div>				  		
				  		<div class='col-md-8' id='profileImageUploadContainer'>
				  			<div class='row text-left'>
					  			<div class='col-md-4'>
						  			<input type='text' name='legalName' value="${targetUser.getLegalName() }">
						  		</div>
				  			</div>			  		
				  		</div>
				  	</div>				  	
				  	
				  	<!-- phone numbers -->
				  	<div class='row' id='div_contactNumbers'>				  		
				  		<div class='col-md-4 text-right'>
				  			<label>연락처</label>
				  		</div>
				  		
				  		<div class='col-md-8 text-left' id='profileImageUploadContainer'>
				  			<div class='row'>
					  			<div class='col-md-12 ' id='phoneNumberList'>
						  			저장된 연락처가 없습니다.
						  		</div>
				  			</div>		  			
				  			<div class='row'>
						  		<div class='col-md-12 '>
						  		연락처는 다른 딤프 회원들에게 공개되지 않습니다.
						  		</div>	
				  			</div>				  			
				  			<div class='row'>
						  		<div class='col-md-12 text-right'>
							  		<!-- 
							  		<button class='btn btn-link' type="button" data-toggle="modal" href="${contextPath}/user/${targetUser.getIdx()}/p/contact" data-target="#myModal" id='showModal_addContact'>연락처 추가하기 </button>
							  		 -->
							  		<%--  	
							  		<a data-toggle="modal" href="${contextPath}/user/addContact/${targetUser.getIdx()}/0" data-target="#myModal" id='showModal_addContact'>연락처 추가하기 </a>
							  		 --%>								
							  		 <a data-toggle="modal" href="#" data-target="#contactModal" id='showModal_addContact'>연락처 추가하기 </a>
						  		</div>	
				  			</div>					  		
				  		</div>
				  	</div>
				  	<!-- end of phone numbers -->
				  	
			  	</div>
			  	
			  	<div class='container col-md-8 profileElementBlock text-center'>
			  		
			  		<!-- address -->			  	
				  	<div class='row' id='div_address'>				  		
				  		<div class='col-md-4 text-right'>
				  			<label>주소 </label>
				  		</div>
				  		
				  		<div class='col-md-8 text-left' id='profileImageUploadContainer'>
				  			<div class='row'>
					  			<div class='col-md-12 '>
						  			<%-- <input type='text' name='address1' size='42' placeholder='예 : 대한민국 서울, 대구 수성구, 뉴욕 브루클린' value="${targetUser.getAddress1() }"> --%>
						  			<textarea name='address1' placeholder='예 : 대한민국 서울, 대구 수성구, 뉴욕 브루클린' rows='1' cols='41' maxlength="100">${targetUser.getAddress1() }</textarea>
						  		</div>
				  			</div>
				  			<br/>
				  			<div class='row'>
					  			<div class='col-md-12 '>
						  			<textarea name='address2' rows="3" cols="41" placeholder='예 : 강남구 테헤란로 25길 6-9, 613' maxlength='200'>${targetUser.getAddress2() }</textarea>
						  		</div>
				  			</div>				  			
				  			<div class='row'>
						  		<div class='col-md-12 '>
						  		지역을 제외한 세부 주소는 다른 딤프 회원들에게 공개되지 않습니다.
						  		</div>	
				  			</div>			  		
				  		</div>
				  	</div>
				  	<!-- end of address -->
				  	
				  	
				  	
				  	<!-- birth year / month -->				  	
				  	
				  	<div class='row' id='div_birthYearMonth'>				  		
				  		<div class='col-md-4 text-right'>
				  			<label>생년월일 </label>
				  		</div>
				  		
				  		<div class='col-md-8 text-left' id='profileImageUploadContainer'>
				  			<div class='row'>
					  			<div class='col-md-4 '>
						  			<input type='text' name='birthYearMonth' placeholder='예 : 900217' size='12' maxlength='6' value="${targetUser.getBirthYearMonth()}">
						  		</div>
						  		<div class='col-md-8 '>
						  			<label>성별 </label>
						  			<input type='text' name='gender' placeholder='예 : 남 / 여 ' size='10' maxlength='2' value='${targetUser.getGender() }'>
						  		</div>
				  			</div>		  			
				  			<div class='row'>
						  		<div class='col-md-12 '>
						  		생년월일과 성별은 지원하시는 경우 발주자에게 공개됩니다.
						  		</div>	
				  			</div>			  		
				  		</div>
				  	</div>
				  	<!-- end of birth year / month -->
				</div>
				
				<!-- 관심 카테고리  -->
				<div class='container col-md-8 profileElementBlock text-center'>			  	
				  	<div class='row' id='div_interestingCategories'>				  		
				  		<div class='col-md-4 text-right'>
				  			<label>관심 카테고리 </label>
				  		</div>
				  		
				  		<div class='col-md-8 text-left' id='profileImageUploadContainer'>
				  			<div class='row'>
					  			<div class="btn-group" data-toggle="buttons" >					  				
					  				
					  				<c:forEach items="${categoryList}" var="cList" begin="0" end="${fn:length(categoryList)-1 }">
										<label class='btn btn-primary' style='font-size:9px'>
										<input type="checkbox" name="categories" id='categories' value="${cList.code }">			
										${cList.categoryName }</label>
									</c:forEach>
									  <!-- <label class="btn btn-primary active">
									    <input type="checkbox" autocomplete="off" checked> Checkbox 1 (pre-checked)
									  </label>
									  <label class="btn btn-primary">
									    <input type="checkbox" autocomplete="off"> Checkbox 2
									  </label>
									  <label class="btn btn-primary">
									    <input type="checkbox" autocomplete="off"> Checkbox 3
									  </label> -->
									
						  			
						  		</div>
				  			</div>				  			
				  			<div class='row'>
						  		<div class='col-md-12 '>
						  		당신이 관심을 가지고 있는 분야는 무엇인가요? 복수 선택이 가능합니다.
						  		</div>				  						  		
						  				
				  			</div>					  		
				  		</div>
				  	</div>
				</div>
				<!-- end of 관심 카테고리  -->
		
			  </div>
			  <!-- end of activity -->
			  
			  <!-- folder starts here -->
			  <!-- dynamic tab의 경우 아래 class를 활성화 시킨다.			  
			  <div id="step1" class="tab-pane fade"> -->
			  <div id='header_section2' class='row'>
			  	<h3 class='text-left'>세부 항목 프로필 </h3>
			  </div>
			  
			  <div id="section2" class='row'>
			    <div class='container col-md-8 profileElementBlock text-center'>			  	
				  	<div class='row' id='div_acadamicBackgrounds'>				  		
				  		<div class='col-md-4 text-right'>
				  			<label>학력 </label>
				  		</div>
				  		
				  		<div class='col-md-8 text-left' id=''>
				  			<div class='row'>
					  			<div class='col-md-12 ' id='schoolList'></div>
				  			</div>
				  							  			
				  			<div class='row'>
						  		<div class='col-md-12 text-right'>
						  			<a data-toggle="modal" href="#" data-target="#schoolModal" id='showModal_adSchool'>학력 추가하기 </a>
						  			<!-- <button class='btn btn-link' type="button">학력 추가하기 </button> -->
						  		</div>	
				  			</div>
				  							  			
				  		</div>
				  	</div>
				</div>
				
				<div class='container col-md-8 profileElementBlock text-center'>			  	
				  	<div class='row' id='div_career'>				  		
				  		<div class='col-md-4 text-right'>
				  			<label>경력</label>
				  		</div>
				  		
				  		<div class='col-md-8 text-left' id=''>
				  			<div class='row'>
					  			<div class='col-md-12 ' id='careerList'></div>
				  			</div>
				  							  			
				  			<div class='row'>
						  		<div class='col-md-12 text-right'>
						  			<a data-toggle="modal" href="#" data-target="#careerModal" id='showModal_addCareer'>경력 추가하기 </a>
						  			<!-- <button class='btn btn-link' type="button">학력 추가하기 </button> -->
						  		</div>	
				  			</div>
				  							  			
				  		</div>
				  		
				  		
				  	</div>
				  	
				</div>
				<!-- end of academic background -->
				<div class='container col-md-8 profileElementBlock text-center'>			  	
				  	<div class='row' id='div_additionalCareer'>				  		
				  		<div class='col-md-4 text-right'>				
					 	<label>추가이력</label>
					 	</div>
					 	
					 	<div class='col-md-4'>
						<textarea name="additionalCareer" rows="3" cols="54" placeholder='예 : 논문 / 저서 / 기고 / 수상 이력 - 연도'>${targetUser.getAdditionalCareer()}</textarea>
					 	</div>
					</div>			 	
					
				</div>
				
				<div class='container col-md-8 profileElementBlock text-center'>			  	
				  	<div class='row' id='div_selfIntro'>				  		
				  		<div class='col-md-4 text-right'>				
					 	<label>자기소개</label>
					 	</div>
					 	
					 	<div class='col-md-4'>
						<textarea name="selfIntro" rows="3" cols="54" placeholder='예 : 회원님은 어떤 스타일의 Provider 또는 Client 인가요?'>${targetUser.getSelfIntro()}</textarea>
					 	</div>
					</div>			 	
					
				</div>
				
			  </div>
				 
				
				 
				 
				 
				 
				 <div class='row'>
					<div>
						<button type="submit" class='btn btn-primary' id="btnSubmit">저장하기</button>
					</div>
				</div>
				
				
			  </div>
			  
			  </form>
			  <!-- folder ends here -->
			  <!-- end of section2 -->
			  
			</div>
			  
			  <!-- profile starts here -->
			<input type="hidden" name="howTo"	id="howTo" value=""/>
					
		
		</div>
<%
/* 학력 모달  */
%>	
<jsp:include page="/WEB-INF/view/ajaxSchoolForm.jsp" flush="true"/>
<%
/* contactModal */
%>	
<jsp:include page="/WEB-INF/view/ajaxContactForm.jsp" flush="true"/>
<%
/* career modal */
%>	
<jsp:include page="/WEB-INF/view/ajaxCareerForm.jsp" flush="true"/>
<%/* 
/.contactModal */ %>

<jsp:include page="/WEB-INF/view/shared/footerV2.jsp" flush="true"/>

</body>

<script>
								
</script>

<script>
//전화번호 불러오기...
$(function(){
	var view = "${contextPath}/user/contactList/${targetUserIdx}/";
	var t = "#phoneNumberList";
	loadListAjax(view, t);}
);
//학력 불러오
$(function(){
	var view = "${contextPath}/user/schoolList/${targetUserIdx}/";
	var t = "#schoolList";
	loadListAjax(view, t);}
);

//경력 불러오
$(function(){
	var view = "${contextPath}/user/careerList/${targetUserIdx}/";
	var t = "#careerList";
	loadListAjax(view, t);}
);

function loadListAjax(paramUrl, paramTarget){
	var _url = paramUrl;	
	
	$.ajax({
		url: _url,
		type: 'GET',				
		success: function(data){
			$(paramTarget).empty().append(data);
		},
		error: function(data){
			/* handling error */
			/* alert("error;"+data); */
		}
	});
}

</script>
</html>
