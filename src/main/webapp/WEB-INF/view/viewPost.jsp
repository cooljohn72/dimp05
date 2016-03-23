<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
 
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
<script type="text/javascript">
$(document).ready(function(){
	$("#comment").keydown(function(){
		/* 덧글 내용 있는지 여부 확인 */ 
		var x = event.keyCode;		
		if (x==13){
			// submit...
			$('#commentForm').submit();						
		}
	});
	
	$("#btn_createApplication").click(function(){
		location.href="${contextPath}/post/${article.getIdx()}/a/0/e";
	});
	
	$("#btn_viewApplication").click(function(){
		location.href="${contextPath}/post/${article.getIdx()}/a/0/e";
	});
	
	$("#btn_viewApplicationList").click(function(){
		location.href="${contextPath}/post/${article.getIdx()}/as";
	});	
});


function showReplyArea(parentCommentIdx){
	$(function(){
		var divId = "#replyCommentArea_"+parentCommentIdx;
		var divId_input = "#replyCommentContent_"+parentCommentIdx;				
		$(divId).css("display", "block");		
		$(divId_input).focus();		
	});	
}

function hideMe(elementId){
	$(function(){
		var divId = "#"+elementId;
		/* alert(divId); */
		
		$(divId).css("display", "none");	
	});
}

function postReply(_objId, _parentCommentId){
	var x = event.keyCode;		
	if (x==13){
		
		var objId = "#"+ _objId;
		$(function(){
			var comment = $(objId).val().trim();			
			var howToVal= "reply";
			$.ajax({
				type: "POST",
				url: "${contextPath}/post/${article.getIdx()}/comment",
				data: {parentCommentId : _parentCommentId, comment : comment},
				success: function(data){
					location.href="${contextPath}/post/${article.getIdx()}";				
				},
				error: function(data){
					/* alert("error;"+data); */
				}
			});		
			
		});
	}
}

</script>
<body>


<jsp:include page="/WEB-INF/view/shared/topV3.jsp" flush="true"/>


	<div>
	<label>Title</label>
	${article.getTitle() }
	</div>
	
	<div>
	<label>Writer</label>
	${article.getWriterIdx() }
	</div>
	
	<div>
	<H4>post status</H4>
	${article.getPostStatus() }
	</div>
	
	<div>
	<H4>Categories</H4>
	<c:if test="${fn:length(article.getCategoriesAL())>0}">
		<c:forEach items="${article.getCategoriesAL()}" var="cList" begin="0" end="${fn:length(article.getCategoriesAL())-1 }">
			<label class="label label-default">${cList }</label>
		</c:forEach>
	</c:if>
	
	</div>
	
	<div>
	<H4>Stage Categories</H4>
	<c:if test="${fn:length(article.getStageCategoriesAL())>0}">
		<c:forEach items="${article.getStageCategoriesAL()}" var="cList" begin="0" end="${fn:length(article.getStageCategoriesAL())-1 }">
			<label class="label label-default">${cList }</label>
		</c:forEach>
	</c:if>
	
	</div>
	
	<div>
		<H4>Required Outputs</H4>
		<c:if test="${fn:length(article.getRequiredOutputAL())>0}">
			<c:forEach items="${article.getRequiredOutputAL()}" var="cList" begin="0" end="${fn:length(article.getRequiredOutputAL())-1 }">
				<label class="label label-default">${cList }</label>
			</c:forEach>
		</c:if>	
	</div>
	
	<form id="commentForm" method='POST' action="${contextPath}/post/${article.getIdx() }/comment">	
	<div id='commentPanel'>
	<H4>Comments</H4>
		<c:if test="${isLoginUser}">
		
			<div id='commentInputGroup'>
				<textarea name='comment' id='comment' placeholder='write a Comment' rows='3' cols='60'></textarea>
				<!-- <input type="text" name='comment' id='comment' placeholder='write a Comment'/> -->	
			</div>
		</c:if>
		
		<div id='commentList'>
			<%
			//갯수만큼 반복...
			%>			
			<c:if test="${fn:length(comments)>0}">
				<c:forEach items="${comments}" var="cmtList" begin="0" end="${fn:length(comments)-1 }">
					<div id='comment_${cmtList.getIdx() }'>
						<%
						/* 본인이 작성한 글이라면 삭제 링크 보여주기 */ 
						%>					
						<c:if test="${loginUserIdx == cmtList.getWriterIdx()}">
							<span class='btn btn-link' onClick='JavaScript: removeComment(${cmtList.getIdx() });'>삭제</span>|
							<div style="display:none;">
								<a data-toggle="modal" href="#" data-target="#removeCommentModal" id='showModal_removeCommentModal'>삭제(modal) </a>
							</div>
						</c:if>						
						<%
						/* 발주자라면 회신 링크 보여주기 */ 
						
						%>						
						<c:if test="${loginUserIdx==article.getWriterIdx() && cmtList.isChildComment()==false}">
							<span class='btn btn-link' onClick='JavaScript: showReplyArea(${cmtList.getIdx() });'>회신</span>
						</c:if>						
						
						<br>
						
						
						<c:if test="${cmtList.isChildComment()}">
							<c:set var="replyStyleClass" value="_test"/>	
						</c:if>
						<c:if test="${!cmtList.isChildComment()}">
							<c:set var="replyStyleClass" value=""/>	
						</c:if>
						<div class="${replyStyleClass}">
						
						comment idx;${cmtList.getIdx() }<br>
						writerIdx; ${cmtList.getWriterIdx() }<br> 
						content; ${cmtList.getContent() } <br>
						registered date; ${cmtList.getRegDate() }<br>
						isReplingComment?; ${cmtList.isChildComment() }<br>
						<div class='replyCommentArea' id='replyCommentArea_${cmtList.getIdx()}' style='display:none;'>
							<textarea id='replyCommentContent_${cmtList.getIdx()}' cols='50' rows='1' placeholder='회신 내용을 입력하고 엔터키를 누르면 저장됩니다.' 
								onkeyup="JavaScript: postReply(this.id, ${cmtList.getIdx()});"></textarea> 
							<span class='btn btn-link' onClick='JavaScrip:hideMe("replyCommentArea_${cmtList.getIdx()}")'>XX</span>
						</div>
						</div>
						<hr/>
					</div>
					 
				</c:forEach>
			</c:if>
		</div>
<%-- 	
		<c:import var="data" url="/post/${article.getIdx()}/comment"/>
		<c:out value="${data}"/>
 --%>
 
 		<%-- 
 		<spring:url var="commentUrl" value="/post/{idx}/comment" context="">
		   <spring:param name="idx" value="${article.getIdx()}" />
		</spring:url>	
		<jsp:include page="${commentUrl}" />
		 --%>
		<%-- or...    
		<c:import url="${commentUrl}" />
		 --%>	
	</div>	
	<input type='hidden' name='isChildComment' value=''/>
	<input type='hidden' name='parentCommentId' value=''/>
	
	
	<div id='sideBar_viewPost'>
	<%
	/* 
	해당 포스트에 지원서를 제출했다면 지원서 보기 버튼
	작성만 하고 제출하지 않았다면 "작성중인 지원서 보기" 
	아직 작성하지 않았다면 지원하기 버튼 
	*/
	%>	 
	
	<c:if test="${isLoginUser}">	 
		<button type='button' class='btn btn-primary' id='btn_createApplication'>지원 하기</button>
		<button type='button' class='btn btn-primary' id='btn_viewApplication'>지원서 보기.</button>
		<button type='button' class='btn btn-primary' id='btn_viewApplicationList'>지원현황 보기</button>
	</c:if>
	</div>
	</form>
<jsp:include page="/WEB-INF/view/shared/footerV2.jsp" flush="true"/>


<div class="modal fade" id="removeCommentModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		     
			<h4 class="modal-title">Warning</h4>
		
		</div>			
			<div class="modal-body">
			    <p>삭제 후 변경 불가!<br>
			    그래도 지울랍니까?</p>		    
			    
			</div>
			<input type='hidden' id='commentIdToRemove' value=""/>			
			<div class="modal-footer">
			    <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			    <button type="button" class="btn btn-primary" id='btn-removeComment'>네, 삭제하겠습니다.</button>			    
			</div>			
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<script>
var commentIdToRemove;

function removeComment(commentId){	
	//check the owner and user are identical.--> @server
	//redirect to rest url
	// if success, hide the comment	
	$(function(){		
		$("#commentIdToRemove").val(commentId);		 
		 commentIdToRemove = $("#commentIdToRemove").val();		
		$("#showModal_removeCommentModal").trigger("click");
	});	
}

$("#btn-removeComment").click(function(){
	/* do ajax */
	/* $("#removeCommentModal").modal("hide"); */
	/* alert("cid:" + commentIdToRemove); */
	removeComment_ajax(commentIdToRemove);	
	
});

function removeComment_ajax(commentId){
	var howToVal= "rmvComment";
	$.ajax({
		type: "POST",
		url: "${contextPath}/post/${article.getIdx()}/C",
		data: {commentId : commentId, howTo : howToVal},
		success: function(data){
			var divIdToHide = "#comment_"+commentId;
			$(divIdToHide).css("display", "none");
			$("#removeCommentModal").modal("hide");
		},
		error: function(data){
			/* alert("error;"+data); */
		}
	});
}



</script>

</body>
</html>