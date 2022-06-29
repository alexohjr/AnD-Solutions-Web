<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%-- <tiles:getAsString name = "어트리뷰트이름" ignore = "true/false"/>
<tiles:insertAttribute name = "어트리뷰트이름" flush = "플러쉬여부" ignore = "에러무시여부"/> --%>

<tiles:importAttribute name="javascripts"/>
<tiles:importAttribute name="stylesheets"/>
<tiles:importAttribute name="favicon"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- <meta http-equiv="Content-Type"> -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title><tiles:insertAttribute name="title"></tiles:insertAttribute></title>
	 
	<!-- favicon -->
	<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/img/common/<tiles:insertAttribute name="favicon" />">
	<!-- end favicon -->
 
	<!-- stylesheets -->
    <c:forEach var="css" items="${stylesheets}">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/commons/css/<c:url value="${css}"/>.css">
    </c:forEach>
    <!-- end stylesheets -->
    
</head>

<body>

	<div class="loader-outer">
		<!-- <div class="loader-inner">
			<div class="loader"></div>
		</div> -->
	</div>
	
	<!-- body -->
	<div id="wrap">
	
		<!-- header -->
	<tiles:insertAttribute name="header" />
	<!-- end header -->
		
		<div class="container">
			<tiles:insertAttribute name="body" />
		</div>
		
		<span id="top_btn">
		</span>
		
		<!-- footer -->
	<tiles:insertAttribute name="footer" />
	<!-- end footer -->
		
	</div>
	
	
	<!-- end body -->
	
	
	
	<!-- scripts -->
    <c:forEach var="js" items="${javascripts}">
        <script src="${pageContext.request.contextPath }/commons/js/<c:url value="${js}"/>.js"></script>
    </c:forEach>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ae539a52aa4827698852f11a8f15b6d3"></script>
    <!-- end scripts -->
</body>
</html>



