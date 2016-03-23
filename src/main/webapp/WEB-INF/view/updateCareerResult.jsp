<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%

%>
<c:if test="${fn:length(careerList)>0 }">
	<c:forEach items="${careerList}" var="ctList" begin="0" end="${fn:length(careerList)-1 }">
	경력 idx; ${ctList.getIdx() } / 최종경력? ${ctList.getIsMain() } / 회사이름 ; ${ctList.getOrgName()}<br>
	</c:forEach>
</c:if>

<c:if test="${fn:length(careerList)<=0 }">
	저장된 경력 정보가 없습니다.
</c:if>