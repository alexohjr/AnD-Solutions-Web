<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="login-outer">

	<div class="login-inner">
		
			<form action="${pageContext.request.contextPath }/admin/list" method="post" onsubmit="return adminLoginCheck()">
				
				
				<h3>관리자 로그인</h3>
				
				<input type="text" class="input inputId" placeholder="아이디" name="id" />
			
				<input type="password" class="input inputPwd" placeholder="비밀번호" name="pwd" />
				
				
				<input type="submit" value="LOGIN" class="loginBtn">
				
				<p class="infoText1">웹사이트 운영을 위한 관리자 모드입니다.</p>
				<p class="infoText2">아이디와 비밀번호를 입력하신 후 로그인해 주시기 바랍니다.</p>
				
				<i class="fas fa-arrow-circle-left"></i>
				<i class="fas fa-home"></i>
				
			</form>
	
	</div>

</div>