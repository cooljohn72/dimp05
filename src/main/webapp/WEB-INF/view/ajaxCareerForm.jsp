<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<jsp:useBean id="now" class="java.util.Date" />

<!-- Modal -->
<form id='addCareerForm'>
<div class="modal fade" id="careerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		     
			<h4 class="modal-title">경력</h4>
		
		</div>			
			<div class="modal-body">
			    <div class="">
			    	
			    	<label>아래와 같은 경력을 추가합니다.</label><br>
			    	<label>회사/기관</label>
			    	<input type='text' name='orgName' id='orgName' placeholder='예 : 삼성전자'>
			    	<br/>
			    	<label>직무</label>
			    	<input type='text' name='role' id='role' placeholder='예 : 연구 개발'>
			    	<br/>
			    	<fmt:formatDate var="year" value="${now}" pattern="yyyy" />
			    	<label>시작일 </label>			    	
			    	<select class="form-control" id="career_startYear" name='career_startYear'>
					    <option value="0">시작연도</option>									     
					    <c:forEach begin="1972" end="${year}" varStatus="loop">
					    	<option value="<c:out value="${loop.end - loop.count + 1}"/>"><c:out value="${loop.end - loop.count + 1}"/></option>
					    </c:forEach>									    
					</select>
					<select class="form-control" id="career_startMonth" name="career_startMonth">
						<option value="0">시작월</option>									     
						<c:forEach var="i" begin="1" end="12" varStatus="loop">
							<option value="<c:out value="${i}"/>"><c:out value="${i}"/></option>
						</c:forEach>									    
					</select>
					
					<label>종료일 </label>
					<select class="form-control" id="career_endYear" name='career_endYear'>
						<option value="0">종료연도</option>									     
						<c:forEach begin="1972" end="${year}" varStatus="loop">
							<option value="<c:out value="${loop.end - loop.count + 1}"/>"><c:out value="${loop.end - loop.count + 1}"/></option>
						</c:forEach>									    
					</select>
					<select class="form-control" id="career_endMonth" name='career_endMonth'>
						<option value="0">종료월</option>									     
						<c:forEach var="i" begin="1" end="12" varStatus="loop">
							<option value="<c:out value="${i}"/>"><c:out value="${i}"/></option>
						</c:forEach>									    
					</select>
			    	<label><input type='checkbox' name='isMainCareer' id='isMainCareer' value="1">최종 경력입니다.</label>
			    	<input type='hidden' name='careerIdx' id='careerIdx' value='0'>			    	
			    </div>		    
			    <div id='aJaxResult'></div>
			</div>
			<input type='hidden' name='howToCareer' value="add">
			<div class="modal-footer">
			    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			    <button type="button" class="btn btn-primary" id='btn-save-career'>Add Career</button>			    
			</div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
</form>
<!-- /.modal -->
<script>
$("#btn-save-career").click(function(e){
	var _url = "${contextPath}/user/addCareer/${targetUserIdx}/"+$("#careerIdx").val();

	/* some error check... */
	if($("#orgName").val()==""){
		 $("#orgName").addClass("errorField");
	}else{				
		/* 
		e.preventDefault();
		 */
		$.ajax({
			url: _url,
			type: 'POST',
			data: $('#addCareerForm').serialize(),
			success: function(data){
				$("#careerList").empty().append(data);
				$('#careerModal').modal('hide');
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