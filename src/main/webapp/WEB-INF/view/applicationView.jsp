<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title></title>
<link rel="stylesheet" type="text/css" href="#">
<!--[if IE]> <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script> <![endif]-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/layoutV2.css"/>">
<script>
$(document).ready(function(){
	
});
</script>

</head>
<body>

<jsp:include page="/WEB-INF/view/shared/topV3.jsp" flush="true"/>

<form method="POST" action="">

<div class="container" style="overflow: scroll; margin-bottom: 100px; z-index:0" id="mainContent">
	<div class='row'>
		<div class='col-md-8'>
			<div id='breadCrumb'>
				<a href='JavaScript:location.href="#";'>&lt; 다른 프로젝트[기술자문?프로젝트? ] 둘러보기</a> 
			</div>
			
			<div id='postTitle'>
				<h1>${article.getTitle() }</h1>
			</div>
		</div>
		<div class='col-md-4'>
		
		</div>
	</div>
	<hr>
	
	<div class='row'>		
		<div class='col-md-8'>			
			<h3>지원서 내용</h3>					
		</div>
		<div class='col-md-4' id='postDateInfo'>		
			<label>${article.getRegdate() }</label>		
		</div>		
	</div>
	
	<div class='row'>
		<!-- left spacer -->
		<!-- <div class="col-md-2" id='spacer'></div> -->
		<!-- end of left spacer -->
		<div class='col-md-8'>	
			<div id='sectionTitle'>
				
				<div id='applicationBody' class=''>
					<div id='applicationOwnerInfo'>
						<h4>${writer.getNickName() }의 지원서 입니다. </h4>
						<p>
						지원서 제출시에는 마이페이지에 기입된 회원님의 이력이 함께 제출됩니다.<br/>
						제출하신 지원서는 마이페이지 보관함에서 확인하실 수 있습니다
						</p>
					</div>
					
					<hr/>
					
					<div id="applicationOwnerResume">
						<h5>이력 제출을 위해 프로필 미입력 항목들과 자기소개을 입력해주세요.</h5>
						<label>표시이름 </label>
							${writer.getNickName()}
							<br/>
						<label>지역 </label>							
							${writer.getAddress1()}
						<br/>
						
						<label>관심 카테고리 </label>
						<br/>
						
						<label>학력 </label>
							${application.getWriterSchool() } / ${application.getWriterDegree() }
						<br/>
						
						<label>경력 </label>
							${application.getWriterCompany() } / ${application.getWriterRole() }
						<br/>
						
						<label>평점 </label>
						<br/>
						
						<label>소개</label>
						<br/>
						<textarea rows="3" cols="60" name='selfIntro_copied' id='selfIntro_copied'>${application.getSelfIntro_copied() }</textarea>
						
						<br>
						<a class='btn btn-default' href='${contextPath}/user/${writer.getIdx() }/p' target='_blank'>프로필 수정하기</a>																		
					</div>
					<hr>
					<div id='applicationBody'>
						<label>수행 계획에 대해 간단하게 설명해주세요.</label>
						<a href="#">수행 계획은 보통 어떤식으로 작성하나요?</a>
						<br/>
						<textarea rows="3" cols="60" name='writerPlan' id='writerPlan' placeholder='예 : 멀티 링크 SUV 하드포인트 설계를 이러한 방식으로 접근하겠습니다.'></textarea>
						<br>
						<a class='btn btn-default' href='${contextPath}/post/${article.getIdx()}' target='_blank'>공고문 다시보기</a>
					
					</div>
					<hr>
					<div id='applicationExpectingCost'>
						<label>요구하고자 하시는 금액은 어떻게 되나요?</label><br>
						<p>미입력시 클라이언트가 예상한 금액과 동일한 금액으로 지원됩니다.</p>
						<table style='width:100%'>							
							<tbody>
								<tr>
									<td>
										<span>${article.getExpectingCost()}원 </span>
									</td>
									<td><span>&gt;</span></td>
									<td>
										<input type="number" name='expectingCost' id='expectingCost' min="0" value='${application.getExpectingCost()}' />원
									</td>
								</tr>
							</tbody>						
						</table>
					</div>
					<hr>
					<div id='applicationExpectingDays'>
						<label>요구하고자 하시는 기간은 어떻게 되나요?</label><br>
						<p>미입력시 클라이언트가 예상한 기간과 동일한 기간으로 지원됩니다.</p>
						<table style='width:100%'>							
							<tbody>
								<tr>
									<td>
										<span>${article.getExpectingDays()}일 </span>
									</td>
									<td><span>&gt;</span></td>
									<td>
										<input type='number' name='expectingDays' id='expectingDays' min="0" value='${application.getExpectingDays()}'/>일
									</td>
								</tr>
							</tbody>						
						</table>
					</div>
				</div>
			</div>
			
		</div>
		
		<div class='col-md-4'>
			<label>지원서 상태: ${application.getStatus()}</label>
			<br>
			<br>
			<a href="${contextPath}/post/${article.getIdx()}/a/${application.getIdx()}/e" class='btn btn-default' id='btn-editApplication'>수정하기...</a>
			<br>
			<br>
			<a href="#" class='btn btn-primary'>협의 대상자로 선정합니다.</a>
		</div>		
		<!-- right spacer -->
		<!-- <div class="col-md-2" id='spacer'></div> -->
		<!-- end of right spacer -->
	
	</div>
</div>
</form>

<jsp:include page="/WEB-INF/view/shared/footerV2.jsp" flush="true"/>



</body>
</html>