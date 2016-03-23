<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:useBean id="now" class="java.util.Date" />

<!-- Modal -->
<form id='addSchoolForm'>
<div class="modal fade" id="schoolModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		     
			<h4 class="modal-title">학력</h4>
		
		</div>			
			<div class="modal-body">
			    <div class="">
			    	
			    	<label>아래와 같은 연락처를 추가합니다.</label><br>
			    	<label>학교 </label>
			    	<input type='text' name='school' id='school' placeholder='예 : 서울대학교'>
			    	<br/>
			    	<label>전공 / 학위 </label>
			    	<input type='text' name='degree' id='degree' placeholder='예 : 기계공학과, 석사'>
			    	<br/>
			    	<fmt:formatDate var="year" value="${now}" pattern="yyyy" />
			    	<label>시작일 </label>			    	
			    	<select class="form-control" id="school_startYear" name='school_startYear'>
					    <option value="0">시작연도</option>									     
					    <c:forEach begin="1972" end="${year}" varStatus="loop">
					    	<option value="<c:out value="${loop.end - loop.count + 1}"/>"><c:out value="${loop.end - loop.count + 1}"/></option>
					    </c:forEach>									    
					</select>
					<select class="form-control" name='school_startMonth' id="school_startMonth">
						<option value="0">시작월</option>									     
						<c:forEach var="i" begin="1" end="12" varStatus="loop">
							<option value="<c:out value="${i}"/>"><c:out value="${i}"/></option>
						</c:forEach>									    
					</select>
					
					<label>종료일 </label>
					<select class="form-control" id="school_endYear" name='school_endYear'>
						<option value="0">종료연도</option>									     
						<c:forEach begin="1972" end="${year}" varStatus="loop">
							<option value="<c:out value="${loop.end - loop.count + 1}"/>"><c:out value="${loop.end - loop.count + 1}"/></option>
						</c:forEach>									    
					</select>
					<select class="form-control" id="school_endMonth" name='school_endMonth'>
						<option value="0">종료월</option>									     
						<c:forEach var="i" begin="1" end="12" varStatus="loop">
							<option value="<c:out value="${i}"/>"><c:out value="${i}"/></option>
						</c:forEach>									    
					</select>
			    	<label><input type='checkbox' name='isMainSchool' id='isMainSchool' value="1">최종 학력입니다.</label>
			    	<input type='hidden' name='schoolIdx' id='schoolIdx' value='0'>			    	
			    </div>		    
			    <div id='aJaxResult'></div>
			</div>
			<input type='hidden' name='howToSchool' value="add">
			<div class="modal-footer">
			    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			    <button type="button" class="btn btn-primary" id='btn-save-school'>Add Academic background</button>			    
			</div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
</form>
<!-- /.modal -->
<script>
$("#btn-save-school").click(function(e){
	var _url = "${contextPath}/user/addSchool/${targetUserIdx}/"+$("#schoolIdx").val();

	/* some error check... */
	if($("#school").val()==""){
		 $("#school").addClass("errorField");
	}else{						 
		e.preventDefault();						 
		$.ajax({
			url: _url,
			type: 'POST',
			data: $('#addSchoolForm').serialize(),
	               success: function(data){
	            	   $("#schoolList").empty().append(data);
					   $('#schoolModal').modal('hide');
	               	/* 
	               	alert("success");
	               	 */
				},
				error: function(data){
					/* handling error */
					/* alert("error;"+data); */
				}
		});
		
	}
});
</script>