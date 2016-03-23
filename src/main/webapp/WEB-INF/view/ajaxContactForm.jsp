<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!-- Modal -->
<form id='addContactForm'>
<div class="modal fade" id="contactModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		     
			<h4 class="modal-title">연락처</h4>
		
		</div>			
			<div class="modal-body">
			    <div class="">
			    	<label>아래와 같은 연락처를 추가합니다.</label><br>
			    	<input type='text' name='contactNumber' id='contactNumber' placeholder='예 : 010-1234-5678'>
			    	<input type='hidden' name='contactNumberIdx' id='contactNumberIdx' value='0'>
			    	<label><input type='checkbox' name='isMainContact' id='isMainContact' value='1'>기본 연락처 입니다.</label>
			    </div>		    
			    <div id='aJaxResult'></div>
			</div>
			<input type='hidden' name='howToContact' value="add">
			<div class="modal-footer">
			    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			    <button type="button" class="btn btn-primary" id='btn-save'>Add Phone Number</button>			    
			</div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
</form>
<!-- /.modal -->
<script>
$("#btn-save").click(function(e){
	var _url = "${contextPath}/user/addContact/${targetUserIdx}/"+$("#contactNumberIdx").val();
	  	
	if($("#contactNumber").val()==""){
		 $("#contactNumber").addClass("errorField");
	}else{						 
		e.preventDefault();						 
		$.ajax({
			url: _url,
			type: 'POST',
			data: $('#addContactForm').serialize(),
	               success: function(data){
	            	   $("#phoneNumberList").empty().append(data);
					   $('#contactModal').modal('hide');
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