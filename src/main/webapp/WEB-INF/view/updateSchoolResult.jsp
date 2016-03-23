<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%

%>
<c:if test="${fn:length(schoolList)>0 }">
	<c:forEach items="${schoolList}" var="ctList" begin="0" end="${fn:length(schoolList)-1 }">
	학력 idx; ${ctList.getIdx() } / 최종학력? ${ctList.getIsMain() } / school name ; ${ctList.getSchoolName()}<br>
	</c:forEach>
</c:if>
<c:if test="${fn:length(schoolList)<=0 }">
	저장된 학력 정보가 없습니다.
</c:if>
