<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>

 
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

	/*  
	$(":contains('LBLmoveToStep1')").click(function(){
		alert("d");
		$("#tStep1").trigger("click");
		alert("dd");
	})
	 */
	 /* end of navi bar */
	 
	 $("#btn-toSave").click(function(){
		 // howTo에 단순 저장 값 설정.
		 $("#howTo").val("toSave");		 
		 $("#postForm").submit();
		 
	 });
	
	 $("#btn-toPost").click(function(){
		 // howTo에 공고 올리기 값 설정.
		 $("#howTo").val("toPost");		 
		 $("#postForm").submit();
		 // 저
		 /* 
		 
		  */
	 });
	 
	 
	// ckeditor setting
    var ckeditor_config = {
         resize_enabled : false, // 에디터 크기를 조절하지 않음
         enterMode : CKEDITOR.ENTER_BR , // 엔터키를 <br> 로 적용함.
         shiftEnterMode : CKEDITOR.ENTER_P ,  // 쉬프트 +  엔터를 <p> 로 적용함.
         toolbarCanCollapse : true , 
         removePlugins : "elementspath", // DOM 출력하지 않음
         filebrowserUploadUrl: '<c:url value="/static/userUpload"/>', // 파일 업로드를 처리 할 경로 설정.

         // 에디터에 사용할 기능들 정의
         toolbar : [
           [ 'Source', '-' , 'NewPage', 'Preview' ],
           [ 'Cut', 'Copy', 'Paste', 'PasteText', '-', 'Undo', 'Redo' ],
           [ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript'],
           [ 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock' ],
           '/',
           [ 'Styles', 'Format', 'Font', 'FontSize' ],
           [ 'TextColor', 'BGColor' ],
           [ 'Image', 'Flash', 'Table' , 'SpecialChar' , 'Link', 'Unlink']

         ]

       };

    var editor = null;
    jQuery(function() {
         // ckeditor 적용
         editor = CKEDITOR.replace( "editor1" , ckeditor_config );
    });
    
});

</script>
<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/view/shared/topV3.jsp" flush="true"/>
<div class="container " style="overflow: scroll; margin-bottom: 100px; z-index:0">
	<div class="row">
	
				
		<jsp:include page="user_sideProfile.jsp"></jsp:include>
		
		targetUser; ${targetUserIdx}<br/>
		loginUserIdx; ${loginUserIdx}<br/>
	
		<div class='col-md-10 text-center' id="mainContent" style="border-left:1px solid silver">
			<c:if test="${targetUserIdx == loginUserIdx}">
				<jsp:include page="userProfile_nav.jsp">
					<jsp:param name="targetUser" value="${targetUserIdx}"/>
				</jsp:include>
			</c:if>		
			
			
			
			
					
			<div class='row'> 
				<div class='col-lg-8 col-md-8 col-sm-8 col-xs-8 text-left'>
					<h1>Advisory</h1>
				</div>
			 	
			 	<!-- data toggle 삭제하고 page redirect로 처리. -->
			 	<div class='col-lg-4 col-md-4 col-sm-4 col-xs-4 text-left' style='padding-top:4px'>
					<ul class="nav nav-pills">
						<li class="active"><a data-toggle="tab" href="#step0" id="tStep0">All</a></li>
						<li><a data-toggle="tab" href="#step1" id="tStep1">발주 </a></li>
						<li><a data-toggle="tab" href="#step2" id="tStep2">수주 </a></li>				
					</ul> 	
			 	</div>
			</div>		
				
			<form id="postForm" class="form text-left" role="form" action="${ contextPath}/new/post" method="POST">
			
			<div class="tab-content">
			
				<!-- activity -->
			  <div id="step0" class="tab-pane fade in active">
			  	<ul>
			  		<li>On-bid</li>
			  		<li>Processing</li>
			  		<li>Completed</li>
			  	</ul>
			  	<div class='row text-center' >
			  		
			  		<div class='col-md-6'>
			  			<h2>Advisory</h2>
						<p></p>
						<label for="postType_1" id='s01_LBLmoveToStep1' style='cursor: pointer;'>				
							<img alt="Advisory" src="<c:url value="/resources/images/main/advisory.jpg"/>" class="col-md-12 col-sm-12 col-xs-12">
							<br>
							click to create a advisory
						</label>  		
			  		</div> 	
			  		<div class='col-md-6'>
			  		
				  		<h2>Project</h2>
						<p></p>	
						<label for="postType_2" id='s02_LBLmoveToStep1' style='cursor: pointer;'>
							<img alt="Advisory" src="<c:url value="/resources/images/main/engineering.jpg"/>" class="col-md-12 col-sm-12 col-xs-12">
							click to create a project
						</label>  		
			  		</div>
			  	</div>
			    
			  </div>
			  <!-- end of activity -->
			  
			  <!-- folder starts here -->
			  <div id="step1" class="tab-pane fade">
			    <h3>보관함</h3>
			    <div class='form-group'>
					<strong>Post Type</strong><br/>
					
					<input type="radio" name="postType" id='postType_1' value="a">
						<label for="postType_1">Advisory</label>
					<input type="radio" name="postType" id='postType_2' value="p"> 
						<label for="postType_2">Project</label>
					
				</div>
				<div class='form-group'>
					<strong>발주자 형태</strong><br/>
			
					<input type="radio" name="ownerType" id='ownerType_1' value="1">
						<label for="ownerType_1"> 개인 </label>
					<input type="radio" name="ownerType" id='ownerType_2' value="2">
						<label for="ownerType_2"> 법인 </label>
				</div>
				
				<div class="form-group">
				    <strong>제목 :</strong>
				    <input type="text" class="form-control" name="title" id="title">
				</div>
				
				<!-- 분야 category -->
				<div class='form-group'>
					<strong>분야 category</strong><br/>
					<%-- 			
					<c:forEach items="${categoryList}" var="cList" begin="0" end="${fn:length(categoryList)-1 }">
						<label>
						<input type="checkbox" name="categories" id='categories' value="${cList.code }">			
						${cList.categoryName }</label>
					</c:forEach> 			
					 --%>
				</div>
				
				<!-- 단계 category -->
				<div class='form-group'>
					<strong>단계 category</strong><br/>
					<%-- 	
					<c:forEach items="${stageCategoryList}" var="scList" begin="0" end="${fn:length(stageCategoryList)-1 }">
						<input type="checkbox" name="stageCategories" id='categories2${scList.code }' value="${scList.code }">
						<label for="categories2${scList.code}">${scList.categoryName }</label>
					</c:forEach>
					 --%> 
				</div>
			    <div>    
				    <a href="#step0" class='btn btn-default' id="btn_backToStep0">&lt;&lt; 이전 단계</a>
				    <a href="#step2" class='btn btn-primary' id="btn_toStep2">다음 단계 &gt;&gt;</a>
			    </div>
			  </div>
			  <!-- folder ends here -->
			  
			  <!-- profile starts here -->
			  <div id="step2" class="tab-pane fade">
			    <h3>개인 정보</h3>
			    <p>Some content in Step 2.</p>
			    
			    <div class='form-group'>
					<strong>Scope</strong><br/>
					<textarea cols="80" id="editor1" name="editor1" rows="10"></textarea>
					<ckeditor:replace replace="editor1" basePath="/ckeditor/" />
					<%-- 				 
					<ckeditor:editor textareaAttributes="${editorAttr}" basePath="/ckeditor/" editor="editor1" value="Type here" />
					 --%> 
					<strong>Keyword</strong><br/>
					<input type="text" id="keyword" name="keyword">
				</div>
			    <div>
				    <a href="#step1" class='btn btn-default' id="btn_backToStep1">&lt;&lt; 이전 단계</a>
				    <a href="#step3" class='btn btn-primary' id="btn_toStep3">다음 단계 &gt;&gt;</a>
			    </div>
			    
			  </div>
			  
			  <!-- notice starts here -->  
			  <div id="step3" class="tab-pane fade">
			    <h3>알림</h3>
			    <!-- 
			    <p>Some content in Step 3.</p> 
			     -->
			    <div class='form-group'>
			    	<strong>예상업무 기간 </strong><br/>
			    	<label>계약일로 부터 <input type="text" name="expectingDays" id="expectingDays">  일</label>
			    	<br/>
			    	<strong>예상업무 비용 </strong><br/>
			    	<label>약 <input type="text" name="expectingCost" id="expectingCost">원 </label>
			    	<br/>
			    	
			    	<strong>인도물 요건 </strong><br/>
			    	<input type="checkbox" name="requiredOutput1" id='requiredOutput1' value="1">
					<label for="requiredOutput1">도면 </label>
					<input type="checkbox" name="requiredOutput2" id='requiredOutput2' value="2">
					<label for="requiredOutput2">제품 </label>
					<input type="checkbox" name="requiredOutput3" id='requiredOutput3' value="3">
					<label for="requiredOutput3">프로그램 </label>
					<input type="checkbox" name="requiredOutput4" id='requiredOutput4' value="4">
					<label for="requiredOutput4">보고서</label>
					<br/>
					
					<strong>지원자격 </strong><br/>
			    	<label>약 <input type="text" name="qualification" id="qualification">원 </label>
			    	<br/>
			    	
			    	<strong>이메일 알림</strong><br/>
			    	<input type="checkbox" name="emailNotice" id='emailNotice' value="1"> 
					<label for="emailNotice">새로운 지원자가 생기면 email 알림을 받겠습니다.</label>
			    	<br/>
			    </div>
			       
			    <div>
				    <a href="#step2" class='btn btn-default' id="btn_backToStep2">&lt;&lt;이전 단계</a>
				    <button type="button" class="btn btn-primary" id="btn-toSave">Save!</button>
				    <!-- 
				    <a href="#" class='btn btn-primary' id="btn_toSave">Save!</a>
				     -->
				    <button type="button" class="btn btn-danger" id="btn-toPost">공고 올리기</button>	    
				    <a href="#" class="btn btn-link" id="btn-preview">미리보기</a>
			    </div>
			  </div>			  
			  <!-- notice ends here. -->
			</div>			
			<%
			/* 
			게시물 Id; 없으면 create, 있으면 update 
			*/
			%>
			<input type="hidden" name="postIdx"	id="postIdx" value=""/>	
			<%
			/* 
			click(toSave); set status to draft
			click(toPost); set status to open
			 */
			%>
			<input type="hidden" name="howTo"	id="howTo" value=""/>
			</form>		
		
		</div>
	</div>
	

</div>

<jsp:include page="/WEB-INF/view/shared/footerV2.jsp" flush="true"/>

</body>
</html>
