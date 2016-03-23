<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>DIMP-${pageTitle}</title>
<link rel="stylesheet" type="text/css" href="#">
<!--[if IE]> <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script> <![endif]-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/layoutV2.css"/>">


</head>
<body>

<jsp:include page="/WEB-INF/view/shared/topV3.jsp" flush="true">
	<jsp:param value="${postListType}" name="show2ndLevelNavi_postListType"/>
</jsp:include>


<form method="POST" action="">

<div class="container" style="overflow: scroll; margin-bottom: 100px; z-index:0" id="mainContent">
	<div class='row'>
		<div class='col-md-12'>	
			<div id='postTitle'>
				<h1>${pageTitle}</h1>
			</div>
		</div>
	</div>
	<hr>
	
	<div class='row'>		
		<div class='col-md-12'>			
			<h3>소제목..</h3>
			<p>[안내문....]</p>					
		</div>
		<%-- 
		<div class='col-md-4' id='postDateInfo'>		
			<label>${article.getRegdate() }//</label>		
		</div>
		 --%>
	</div>
	<div class='row'>
		<div class='col-md-12 _test'>
			필터 버튼...
		</div>
	</div>
	
	<div class='row'>
		<!-- left spacer -->
		<!-- <div class="col-md-2" id='spacer'></div> -->
		<!-- end of left spacer -->
		
		<div class='col-md-12' id='articleList'>	
			<c:if test="${fn:length(articleList)>0}">
				<c:forEach items="${articleList}" var="aList">
					
					
					<div class='row' id='aId_${aList.getIdx()}' style=''>
						
						
						idx; ${aList.getIdx() } | 
						<a href="${contextPath}/post/${aList.getIdx()}">title; ${aList.getWriterName()}</a>
							<table class='_test' style='width:100%' border='1'>
								<tr>
									<td style='width:450px'>
										<h3>
											<a href="${contextPath}/post/${aList.getIdx()}">
											${aList.getTitle()}
											</a>
										</h3>
										<br>
										${aList.getWriterName()}
									</td>
									<td style='width:100px'>
										마감일
									</td>
									<td style='width:100px'>
										${aList.getHowManyApplied()}명 지원
									</td>
									<td style='width:50px'>
										스크랩 버튼
									</td>
								</tr>
								<tr>
									<td colspan='2'>
										label...<br>
										text....
									</td>									
									<td colspan='2'>
										<table style='width:100%' class='text-right'>
											<tr>
												<td style='width:25%'><span class='glyphicon glyphicon-calendar' style='color: #999999;'></span></td>
												<td>expecting days</td>												
											</tr>
											<tr>
												<td><span class='glyphicon glyphicon-tag' style='color: #999999;'></span></td>
												<td>expecting cost</td>												
											</tr>
											<tr>
												<td><span class='glyphicon glyphicon-file' style='color: #999999;'></span></td>
												<td>report???</td>												
											</tr>
										</table>										
									</td>									
								</tr>							
							</table>
					</div>			 
				</c:forEach>
			</c:if>
			
		</div>
	</div>
</div>
</form>

<jsp:include page="/WEB-INF/view/shared/footerV2.jsp" flush="true"/>



</body>
</html>