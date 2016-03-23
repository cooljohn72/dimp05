<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title></title>
	<link rel="stylesheet" type="text/css" href="#">
	<!--[if IE]> <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script> 
	<![endif]-->
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/layout.css"/>">
	<link rel="stylesheet" type="text/css" 
		href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<script type="text/javascript">
/* 
value extractor(from queryString)
 */
function getParameterByName(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}

//query string; ?PR=1&....
		// 저장 후 결과 상태 값 받아서 결과 여부 표시하기 위해 사용할 것임..
var PR = getParameterByName('PR');
if(PR=="1"){
	alert("success!!");
}
</script>
 	
</head>
<body>

<div class="container">
<%-- 
	<div class="row" id="top_contatinerV2">
		<div class="col-md-12 col-sm-12" id="top_layer_fixed">
			<jsp:include page="/WEB-INF/view/shared/top.jsp" flush="true"/>
		</div>
	</div>
 --%>	
	
	<div class="row" id="content">
		<div class="col-md-12">
			<h2>Johnathan Wonyoung Song(${idx})(target:${target})의 마이 페이지 입니다. </h2>
			메인 페이지 입니다.<br/>
			This is the my page of user, Johnathan Wonyoung Song.<br/>
			
			<!-- menu in user page -->
			<%
			/*
			본인에게만 노출.
			모든 사용자에게 노출되는 activity는 profile선택 시, 
			default로 표시되기 때문에 아래 링크는 본인에게만 표시되면 됨. 
			*/
			%>
			 
			<ul>
				<li><a href='${contextPath }/user/1/a'>Activity</a></li>				
				<li><a href='${contextPath }/user/1/f'>보관함/scrap</a></li>
				<li><a href='${contextPath }/user/1/p'>Profile</a></li>
				<li><a href='${contextPath }/user/1/n'>Notice</a></li>				
			</ul>
			<!--end of 본인에게만 노출 -->
			<!-- end of menu in user page -->
			
			<p>DIMP says: ${message}</p>
			<p>
				<c:choose>				
					<c:when test="${t=='a' || t==null}">
						<div id="activityArea"> Activity area</div>
						<div id='subContent_activity'></div>
					</c:when>
					<c:when test="${t=='f' }">
						<div id="folderArea"> Folder area</div>
						<div id='subContent_folder'>Some List of my folder items...</div>
						<div id='subContent_scrap'>Some List of my scraped items...</div>
					</c:when>
					<c:when test="${t=='p' }">
						<div id="profileArea"> 
							Profile area
							<div id='profileSelector'>
								<!-- change a tag to span not to move to the top -->
								<!-- this selector change display property of panelBaic & panelCareer -->
								<ul>
									<li><a href="#">basic</a></li>
									<li><a href="#">career</a></li>
								</ul>
							</div>
							
							<div id='panelBasic'>
								<h3>기본 정보.</h3>
							</div>
							
							<div id='panelCareer'>
								<h3>학력 / 경력 정보.</h3>
							</div>
							
							
							<div id="modifyLink_user">
								<a href="${contextPath }/user/1/p/edit/b">edit my profile</a>
							</div>
							<div id='subContent_profile'></div>	
						</div>
					</c:when>
					<c:when test="${t=='n' }">
						<div id="noticeArea"> Notice area</div>
						<div id='subContent_notice'>Some list of my Notice...</div>
					</c:when>
				</c:choose>
			</p>
		</div>
	</div>
	
	<div class='row' id="footer_container">
		<div class="col-md-12" id="footer">
			<jsp:include page="/WEB-INF/view/shared/footer.jsp" flush="true"/>
		</div>
	</div>
</div>
 
</body>
</html>